<?php

/**
 * Bismillahir Rahmanir Raheem
 * 
 * PHP Mikrotik Billing (https://github.com/paybilling/phpnuxbill/)
 *
 * Asset Manager System For PHPNuxBill 
 *
 * @author: Focuslinks Digital Solutions <focuslinkstech@gmail.com>
 * Website: https://focuslinkstech.com.ng/
 * GitHub: https://github.com/Focuslinkstech/
 * Telegram: https://t.me/focuslinkstech/
 *
 **/

register_menu(" Asset Manager", true, "assetManager", 'AFTER_MESSAGE', 'fa fa-cubes', '', "");

function assetManager()
{
    global $ui, $config;
    _admin();
    $ui->assign('_title', $GLOBALS['config']['CompanyName'] . ' - ' . 'Asset Manager');
    $ui->assign('_system_menu', '');
    $admin = Admin::_info();
    $ui->assign('_admin', $admin);

    // Check user type for access
    if (!in_array($admin['user_type'], ['SuperAdmin', 'Admin', 'Sales'])) {
        _alert(Lang::T('You do not have permission to access this page'), 'danger', "dashboard");
        exit;
    }

    // Create assets table if it doesn't exist
    createAssetsTable();

    // Load asset statistics
    $stats = getAssetStatistics();
    $ui->assign('stats', $stats);

    // Load recent assets
    $recentAssets = getRecentAssets(10);
    $ui->assign('recentAssets', $recentAssets);
    $ui->assign('version', 'v1.0.0');
    $ui->assign('xheader', '<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
     <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
     <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>');
    $ui->display('assetManager.tpl');
}

function createAssetsTable()
{
    try {
        // Create assets table
        $sql = "CREATE TABLE IF NOT EXISTS tbl_assets (
            id INT AUTO_INCREMENT PRIMARY KEY,
            asset_id VARCHAR(50) UNIQUE NOT NULL,
            category ENUM('network', 'customer', 'infrastructure', 'vehicle', 'tool') NOT NULL,
            name VARCHAR(255) NOT NULL,
            brand_model VARCHAR(255),
            serial_number VARCHAR(255),
            purchase_date DATE,
            purchase_cost DECIMAL(10,2),
            supplier VARCHAR(255),
            location VARCHAR(255),
            lat VARCHAR(20),
            lng VARCHAR(20),
            status ENUM('active', 'inactive', 'maintenance', 'decommissioned') DEFAULT 'active',
            warranty_expiry DATE,
            assigned_to VARCHAR(255),
            deployed_date DATE,
            description TEXT,
            ip_address VARCHAR(45),
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
        )";
        ORM::raw_execute($sql);

        // Create asset maintenance table
        $sql = "CREATE TABLE IF NOT EXISTS tbl_asset_maintenance (
            id INT AUTO_INCREMENT PRIMARY KEY,
            asset_id VARCHAR(50) NOT NULL,
            scheduled_date DATE NOT NULL,
            maintenance_date DATE NOT NULL,
            maintenance_type ENUM('preventive', 'corrective', 'emergency', 'inspection', 'calibration', 'upgrade') NOT NULL,
            description TEXT,
            priority ENUM('low', 'medium', 'high', 'critical') DEFAULT 'medium',
            status ENUM('scheduled', 'completed', 'in_progress', 'overdue', 'cancelled') DEFAULT 'scheduled',
            technician VARCHAR(255),
            cost DECIMAL(10,2),
            actual_cost DECIMAL(10,2),
            completion_notes TEXT,
            next_maintenance DATE,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
            FOREIGN KEY (asset_id) REFERENCES tbl_assets(asset_id) ON DELETE CASCADE
        )";
        ORM::raw_execute($sql);

        // Create asset assignments table
        $sql = "CREATE TABLE IF NOT EXISTS tbl_asset_assignments (
            id INT AUTO_INCREMENT PRIMARY KEY,
            asset_id VARCHAR(50) NOT NULL,
            assigned_to VARCHAR(255) NOT NULL,
            assignment_date DATE NOT NULL,
            return_date DATE,
            assignment_type ENUM('customer', 'employee', 'location') NOT NULL,
            notes TEXT,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            FOREIGN KEY (asset_id) REFERENCES tbl_assets(asset_id) ON DELETE CASCADE
        )";
        ORM::raw_execute($sql);
    } catch (Exception $e) {
        _log("Asset Manager DB Error: " . $e->getMessage());
        echo "Asset Manager DB Error: " . $e->getMessage();
        exit;
    }
}

function asset_add()
{
    _admin();

    $admin = Admin::_info();
    if (!in_array($admin['user_type'], ['SuperAdmin', 'Admin', 'Sales'])) {
        header('Content-Type: application/json');
        echo json_encode(['success' => false, 'message' => Lang::T('Permission denied')]);
        exit;
    }

    if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
        header('Content-Type: application/json');
        echo json_encode(['success' => false, 'message' => Lang::T('Invalid request method')]);
        exit;
    }

    $rawInput = file_get_contents('php://input');
    _log("Raw input: " . $rawInput);

    $data = json_decode($rawInput, true);

    if (json_last_error() !== JSON_ERROR_NONE) {
        header('Content-Type: application/json');
        echo json_encode(['success' => false, 'message' => Lang::T('Invalid JSON data: ') . json_last_error_msg()]);
        exit;
    }

    _log("Decoded data: " . print_r($data, true));

    if (!$data || !isset($data['asset_id']) || !isset($data['category']) || !isset($data['name'])) {
        header('Content-Type: application/json');
        echo json_encode(['success' => false, 'message' => Lang::T('Missing required fields: asset_id, category, or name')]);
        exit;
    }

    try {
        // Ensure tables exist
        createAssetsTable();

        // Check if asset_id already exists
        $existingAsset = ORM::for_table('tbl_assets')->where('asset_id', $data['asset_id'])->find_one();
        if ($existingAsset) {
            header('Content-Type: application/json');
            echo json_encode(['success' => false, 'message' => Lang::T('Asset ID already exists')]);
            exit;
        }

        $asset = ORM::for_table('tbl_assets')->create();
        $asset->asset_id = $data['asset_id'];
        $asset->category = $data['category'];
        $asset->name = $data['name'];
        $asset->brand_model = $data['brand_model'] ?? '';
        $asset->serial_number = $data['serial_number'] ?? '';
        $asset->purchase_date = !empty($data['purchase_date']) ? $data['purchase_date'] : null;
        $asset->purchase_cost = !empty($data['purchase_cost']) ? floatval($data['purchase_cost']) : 0;
        $asset->supplier = $data['supplier'] ?? '';
        $asset->location = $data['location'] ?? '';
        $asset->lat = $data['lat'] ?? '';
        $asset->lng = $data['lng'] ?? '';
        $asset->status = $data['status'] ?? 'active';
        $asset->warranty_expiry = !empty($data['warranty_expiry']) ? $data['warranty_expiry'] : null;
        $asset->assigned_to = $data['assigned_to'] ?? '';
        $asset->deployed_date = $data['deployed_date'] ?? 'null';
        $asset->description = $data['description'] ?? '';
        $asset->ip_address = $data['ip_address'] ?? null;
        $asset->created_at = date('Y-m-d H:i:s');

        _log(Lang::T("About to save asset: ") . print_r($asset->as_array(), true));

        $result = $asset->save();

        if ($result) {
            _log("Asset added: " . $data['asset_id'], $admin['user_type']);
            header('Content-Type: application/json');
            echo json_encode(['success' => true, 'message' => Lang::T('Asset added successfully'), 'asset_id' => $data['asset_id']]);
        } else {
            header('Content-Type: application/json');
            echo json_encode(['success' => false, 'message' => Lang::T('Failed to save asset to database')]);
        }
    } catch (Exception $e) {
        _log("Asset Add Error: " . $e->getMessage());
        _log("Stack trace: " . $e->getTraceAsString());
        header('Content-Type: application/json');
        echo json_encode(['success' => false, 'message' => Lang::T('Database error: ') . $e->getMessage()]);
    }
    exit;
}

function asset_edit()
{
    _admin();

    $admin = Admin::_info();
    if (!in_array($admin['user_type'], ['SuperAdmin', 'Admin'])) {
        echo json_encode(['success' => false, 'message' => Lang::T('Permission denied')]);
        exit;
    }

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $data = json_decode(file_get_contents('php://input'), true);

        try {
            $asset = ORM::for_table('tbl_assets')->where('asset_id', $data['asset_id'])->find_one();

            if ($asset) {
                $asset->category = $data['category'];
                $asset->name = $data['name'];
                $asset->brand_model = $data['brand_model'];
                $asset->serial_number = $data['serial_number'];
                $asset->purchase_date = $data['purchase_date'] ?: null;
                $asset->purchase_cost = $data['purchase_cost'] ?: null;
                $asset->supplier = $data['supplier'];
                $asset->location = $data['location'];
                $asset->lat = $data['lat'] ?? '';
                $asset->lng = $data['lng'] ?? '';
                $asset->status = $data['status'];
                $asset->warranty_expiry = $data['warranty_expiry'] ?: null;
                $asset->assigned_to = $data['assigned_to'];
                $asset->description = $data['description'];
                $asset->ip_address = $data['ip_address'] ?? null;

                $result = $asset->save();

                if ($result) {
                    _log("Asset updated: " . $data['asset_id'], $admin['user_type']);
                    echo json_encode(['success' => true, 'message' => Lang::T('Asset updated successfully')]);
                } else {
                    echo json_encode(['success' => false, 'message' => Lang::T('Failed to update asset')]);
                }
            } else {
                echo json_encode(['success' => false, 'message' => Lang::T('Asset not found')]);
            }
        } catch (Exception $e) {
            _log(Lang::T('Asset Edit Error: ') . $e->getMessage());
            echo json_encode(['success' => false, 'message' => Lang::T('Database error: ') . $e->getMessage()]);
        }
    }
}

function asset_delete()
{
    _admin();

    $admin = Admin::_info();
    if (!in_array($admin['user_type'], ['SuperAdmin', 'Admin'])) {
        header('Content-Type: application/json');
        echo json_encode(['success' => false, 'message' => Lang::T('Permission denied')]);
        exit;
    }

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $assetId = $_POST['asset_id'] ?? '';

        if (empty($assetId)) {
            header('Content-Type: application/json');
            echo json_encode(['success' => false, 'message' => Lang::T('Asset ID required')]);
            exit;
        }

        try {
            $asset = ORM::for_table('tbl_assets')->where('asset_id', $assetId)->find_one();

            if ($asset) {
                $result = $asset->delete();

                if ($result) {
                    _log("Asset deleted: " . $assetId, $admin['user_type']);
                    header('Content-Type: application/json');
                    echo json_encode(['success' => true, 'message' => Lang::T('Asset deleted successfully')]);
                } else {
                    header('Content-Type: application/json');
                    echo json_encode(['success' => false, 'message' => Lang::T('Failed to delete asset')]);
                }
            } else {
                header('Content-Type: application/json');
                echo json_encode(['success' => false, 'message' => Lang::T('Asset not found')]);
            }
        } catch (Exception $e) {
            _log("Asset Delete Error: " . $e->getMessage());
            header('Content-Type: application/json');
            echo json_encode(['success' => false, 'message' => Lang::T('Database error: ') . $e->getMessage()]);
        }
    }
}

function asset_view()
{
    _admin();

    $assetId = $_GET['asset_id'] ?? '';

    if (empty($assetId)) {
        header('Content-Type: application/json');
        echo json_encode(['success' => false, 'message' => 'Asset ID required']);
        exit;
    }

    try {
        // Get asset details
        $asset = ORM::for_table('tbl_assets')->where('asset_id', $assetId)->find_one();

        if ($asset) {
            // Get maintenance history
            $maintenance = ORM::for_table('tbl_asset_maintenance')
                ->where('asset_id', $assetId)
                ->order_by_desc('maintenance_date')
                ->find_array();

            // Get assignment history
            $assignments = ORM::for_table('tbl_asset_assignments')
                ->where('asset_id', $assetId)
                ->order_by_desc('assignment_date')
                ->find_array();

            header('Content-Type: application/json');
            echo json_encode([
                'success' => true,
                'asset' => $asset->as_array(),
                'maintenance' => $maintenance,
                'assignments' => $assignments
            ]);
        } else {
            header('Content-Type: application/json');
            echo json_encode(['success' => false, 'message' => 'Asset not found']);
        }
    } catch (Exception $e) {
        _log("Asset View Error: " . $e->getMessage());
        header('Content-Type: application/json');
        echo json_encode(['success' => false, 'message' => 'Database error: ' . $e->getMessage()]);
    }
    exit;
}

function getMaintenanceCostAnalysis()
{
    try {
        $analysis = [];
        $quarters = [];
        $plannedCosts = [];
        $emergencyCosts = [];

        // Get data for last 4 quarters
        for ($i = 3; $i >= 0; $i--) {
            // Calculate quarter start and end dates
            $currentQuarter = ceil(date('n') / 3);
            $currentYear = date('Y');

            $targetQuarter = $currentQuarter - $i;
            $targetYear = $currentYear;

            // Adjust for previous year quarters
            if ($targetQuarter <= 0) {
                $targetQuarter += 4;
                $targetYear--;
            }

            $quarterStart = date('Y-m-d', mktime(0, 0, 0, ($targetQuarter - 1) * 3 + 1, 1, $targetYear));
            $quarterEnd = date('Y-m-t', mktime(0, 0, 0, $targetQuarter * 3, 1, $targetYear));

            $quarterLabel = 'Q' . $targetQuarter . ' ' . $targetYear;
            $quarters[] = $quarterLabel;

            // Get planned maintenance costs (preventive)
            $plannedResult = ORM::for_table('tbl_asset_maintenance')
                ->select_expr('SUM(COALESCE(actual_cost, cost))', 'total_cost')
                ->where('maintenance_type', 'preventive')
                ->where_gte('maintenance_date', $quarterStart)
                ->where_lte('maintenance_date', $quarterEnd)
                ->find_one();
            $plannedCosts[] = (float)($plannedResult->total_cost ?? 0);

            // Get emergency maintenance costs (corrective + emergency)
            $emergencyResult = ORM::for_table('tbl_asset_maintenance')
                ->select_expr('SUM(COALESCE(actual_cost, cost))', 'total_cost')
                ->where_in('maintenance_type', ['corrective', 'emergency'])
                ->where_gte('maintenance_date', $quarterStart)
                ->where_lte('maintenance_date', $quarterEnd)
                ->find_one();
            $emergencyCosts[] = (float)($emergencyResult->total_cost ?? 0);
        }

        return [
            'labels' => $quarters,
            'planned' => $plannedCosts,
            'emergency' => $emergencyCosts
        ];
    } catch (Exception $e) {
        _log("Maintenance Cost Analysis Error: " . $e->getMessage());
        return [
            'labels' => ['Q1', 'Q2', 'Q3', 'Q4'],
            'planned' => [0, 0, 0, 0],
            'emergency' => [0, 0, 0, 0]
        ];
    }
}

function getAssetUtilizationTrends()
{
    try {
        $trends = [];
        $weeks = [];

        // Debug: Log function start and check if assets table exists
        _log("Starting getAssetUtilizationTrends calculation");

        // First check if we have any assets at all
        $totalAssetsEver = ORM::for_table('tbl_assets')->count();
        _log("Total assets in database: $totalAssetsEver");

        if ($totalAssetsEver == 0) {
            _log("No assets found in database, returning zero data");
            return [
                'labels' => ['Week 1', 'Week 2', 'Week 3', 'Week 4'],
                'data' => [0, 0, 0, 0]
            ];
        }

        // Get data for last 4 weeks
        for ($i = 3; $i >= 0; $i--) {
            $weekStart = date('Y-m-d', strtotime("-$i weeks Monday"));
            $weekEnd = date('Y-m-d', strtotime("-$i weeks Sunday"));
            $weekLabel = 'Week ' . (4 - $i);
            $weeks[] = $weekLabel;

            // Count total assets existing during this week
            $totalAssets = ORM::for_table('tbl_assets')
                ->where_lte('created_at', $weekEnd . ' 23:59:59')
                ->count();

            // Count active assets during this week
            $activeAssets = ORM::for_table('tbl_assets')
                ->where('status', 'active')
                ->where_lte('created_at', $weekEnd . ' 23:59:59')
                ->count();

            // Calculate utilization percentage
            $utilization = $totalAssets > 0 ? round(($activeAssets / $totalAssets) * 100, 1) : 0;
            $trends[] = $utilization;

            // Debug: Log each week's data
            _log("Week $weekLabel ($weekStart to $weekEnd): Total=$totalAssets, Active=$activeAssets, Utilization=$utilization%");
        }

        $result = [
            'labels' => $weeks,
            'data' => $trends
        ];

        // Debug: Log final result
        _log("Utilization Trends Result: " . json_encode($result));

        return $result;
    } catch (Exception $e) {
        _log("Asset Utilization Trends Error: " . $e->getMessage());
        return [
            'labels' => ['Week 1', 'Week 2', 'Week 3', 'Week 4'],
            'data' => [0, 0, 0, 0]
        ];
    }
}

function getAssetPerformanceHistory()
{
    try {
        $history = [];
        $months = [];

        _log("Starting getAssetPerformanceHistory calculation");

        // Get data for last 12 months
        for ($i = 11; $i >= 0; $i--) {
            $date = date('Y-m-01', strtotime("-$i months"));
            $monthName = date('M', strtotime($date));
            $months[] = $monthName;

            $startOfMonth = date('Y-m-01', strtotime($date));
            $endOfMonth = date('Y-m-t', strtotime($date));

            // Count NEW assets registered this month
            $newAssetsThisMonth = ORM::for_table('tbl_assets')
                ->where_gte('created_at', $startOfMonth . ' 00:00:00')
                ->where_lte('created_at', $endOfMonth . ' 23:59:59')
                ->count();

            // Count maintenance activities performed this month
            $maintenanceThisMonth = ORM::for_table('tbl_asset_maintenance')
                ->where_raw("DATE_FORMAT(maintenance_date, '%Y-%m') = '" . date('Y-m', strtotime($date)) . "'")
                ->count();

            $history['registered'][] = $newAssetsThisMonth;
            $history['maintenance'][] = $maintenanceThisMonth;

            // Debug: Log each month's data
            _log("Month $monthName: New assets=$newAssetsThisMonth, Maintenance=$maintenanceThisMonth");
        }

        $result = [
            'labels' => $months,
            'registered' => $history['registered'],
            'maintenance' => $history['maintenance']
        ];

        _log("Asset Performance History Result: " . json_encode($result));

        return $result;
    } catch (Exception $e) {
        _log("Asset Performance History Error: " . $e->getMessage());
        return [
            'labels' => ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
            'registered' => [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            'maintenance' => [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        ];
    }
}

function getAssetStatistics()
{
    try {
        $stats = [];

        // Total assets
        $stats['total'] = ORM::for_table('tbl_assets')->count();

        // Active assets
        $stats['active'] = ORM::for_table('tbl_assets')->where('status', 'active')->count();

        // Under maintenance
        $stats['maintenance'] = ORM::for_table('tbl_assets')->where('status', 'maintenance')->count();

        // Critical (warranty expiring in 30 days)
        $stats['critical'] = ORM::for_table('tbl_assets')
            ->where_raw('warranty_expiry <= DATE_ADD(CURDATE(), INTERVAL 30 DAY) AND warranty_expiry >= CURDATE()')
            ->count();

        // Total asset value
        $result = ORM::for_table('tbl_assets')
            ->select_expr('SUM(purchase_cost)', 'total_value')
            ->where_not_null('purchase_cost')
            ->find_one();
        $stats['total_value'] = (float)($result->total_value ?? 0);

        $result = ORM::for_table('tbl_asset_maintenance')
            ->select_expr('SUM(COALESCE(actual_cost, cost))', 'monthly_maintenance')
            ->where_raw('MONTH(maintenance_date) = MONTH(CURDATE()) AND YEAR(maintenance_date) = YEAR(CURDATE())')
            ->find_one();
        $stats['monthly_maintenance'] = (float)($result->monthly_maintenance ?? 0);

        // Asset utilization calculation (active assets / total assets * 100)
        if ($stats['total'] > 0) {
            $stats['utilization'] = round(($stats['active'] / $stats['total']) * 100, 1);
        } else {
            $stats['utilization'] = 0;
        }

        // Average uptime calculation based on asset status and maintenance frequency
        if ($stats['total'] > 0) {
            $uptime_score = ($stats['active'] * 100) + ($stats['maintenance'] * 50);
            $stats['avg_uptime'] = round($uptime_score / $stats['total'], 1);
        } else {
            $stats['avg_uptime'] = 0;
        }

        // Assets by category
        $stats['by_category'] = ORM::for_table('tbl_assets')
            ->select('category')
            ->select_expr('COUNT(*)', 'count')
            ->group_by('category')
            ->find_array();

        // Assets by location
        $stats['by_location'] = ORM::for_table('tbl_assets')
            ->select('location')
            ->select_expr('COUNT(*)', 'count')
            ->where_not_null('location')
            ->where_not_equal('location', '')
            ->group_by('location')
            ->order_by_desc('count')
            ->limit(10)
            ->find_array();

        // Assets by status
        $stats['by_status'] = ORM::for_table('tbl_assets')
            ->select('status')
            ->select_expr('COUNT(*)', 'count')
            ->group_by('status')
            ->find_array();

        // Recent maintenance activities
        $stats['recent_maintenance'] = ORM::for_table('tbl_asset_maintenance')
            ->select('tbl_asset_maintenance.*')
            ->select('tbl_assets.name', 'asset_name')
            ->left_outer_join('tbl_assets', array('tbl_asset_maintenance.asset_id', '=', 'tbl_assets.asset_id'))
            ->order_by_desc('tbl_asset_maintenance.maintenance_date')
            ->limit(5)
            ->find_array();

        // Performance history for charts
        $stats['performance_history'] = getAssetPerformanceHistory();

        // Utilization trends for analytics
        $stats['utilization_trends'] = getAssetUtilizationTrends();

        // Maintenance cost analysis for charts
        $stats['maintenance_cost_analysis'] = getMaintenanceCostAnalysis();

        $stats['this_month_maintenance'] = getThisMonthMaintenance();

        $stats['lifecycle_distribution'] = getLifecycleDistribution();

        return $stats;
    } catch (Exception $e) {
        _log("Asset Statistics Error: " . $e->getMessage());
        return [
            'total' => 0,
            'active' => 0,
            'maintenance' => 0,
            'critical' => 0,
            'total_value' => 0,
            'monthly_maintenance' => 0,
            'utilization' => 0,
            'avg_uptime' => 0,
            'by_category' => [],
            'by_location' => [],
            'by_status' => [],
            'recent_maintenance' => []
        ];
    }
}

function getRecentAssets($limit = 10)
{
    try {
        return ORM::for_table('tbl_assets')
            ->order_by_desc('created_at')
            ->limit($limit)
            ->find_array();
    } catch (Exception $e) {
        _log("Recent Assets Error: " . $e->getMessage());
        return [];
    }
}

/**
 * Returns the maintenance activities performed in the current month.
 *
 * @return array
 */
function getThisMonthMaintenance()
{
    try {
        $results = ORM::for_table('tbl_asset_maintenance')
            ->select('maintenance_date')
            // ->where_raw('MONTH(maintenance_date) = MONTH(CURDATE()) AND YEAR(maintenance_date) = YEAR(CURDATE())')
            ->order_by_desc('maintenance_date')
            ->find_array();
        return $results;
    } catch (Exception $e) {
        _log("This Month Maintenance Error: " . $e->getMessage());
        return [];
    }
}

function asset_statistics()
{
    try {
        _admin();
        header('Content-Type: application/json');

        $stats = getAssetStatistics();
        echo json_encode(['success' => true, 'data' => $stats]);
    } catch (Exception $e) {
        header('Content-Type: application/json');
        echo json_encode(['success' => false, 'message' => $e->getMessage()]);
    }
}

function asset_export()
{
    _admin();

    $admin = Admin::_info();
    if (!in_array($admin['user_type'], ['SuperAdmin', 'Admin', 'Sales'])) {
        echo json_encode(['success' => false, 'message' => Lang::T('Permission denied')]);
        exit;
    }

    try {
        $assets = ORM::for_table('tbl_assets')
            ->order_by('asset_id')
            ->find_array();

        // Set CSV headers
        header('Content-Type: text/csv');
        header('Content-Disposition: attachment; filename="assets_export_' . date('Y-m-d_H-i-s') . '.csv"');

        $output = fopen('php://output', 'w');

        // Write CSV header
        if (!empty($assets)) {
            fputcsv($output, array_keys($assets[0]));

            // Write data rows
            foreach ($assets as $asset) {
                fputcsv($output, $asset);
            }
        }

        fclose($output);
        _log("Assets exported", $admin['user_type']);
    } catch (Exception $e) {
        _log("Asset Export Error: " . $e->getMessage());
        echo json_encode(['success' => false, 'message' => Lang::T('Export failed: ') . $e->getMessage()]);
    }
}

function asset_list()
{
    _admin();
    header('Content-Type: application/json');

    try {
        $assets = ORM::for_table('tbl_assets')
            ->order_by_desc('created_at')
            ->find_array();

        echo json_encode(['success' => true, 'data' => $assets]);
    } catch (Exception $e) {
        _log("Asset List Error: " . $e->getMessage());
        echo json_encode(['success' => false, 'message' => Lang::T('Database error: ') . $e->getMessage()]);
    }
}

function asset_list_by_category()
{
    _admin();
    header('Content-Type: application/json');

    $category = $_GET['category'] ?? '';

    if (empty($category)) {
        echo json_encode(['success' => false, 'message' => Lang::T('Category required')]);
        exit;
    }

    try {
        $assets = ORM::for_table('tbl_assets')
            ->where('category', $category)
            ->order_by_desc('created_at')
            ->find_array();

        echo json_encode(['success' => true, 'data' => $assets]);
    } catch (Exception $e) {
        _log("Asset List by Category Error: " . $e->getMessage());
        echo json_encode(['success' => false, 'message' => Lang::T('Database error: ') . $e->getMessage()]);
    }
}


function asset_schedule_maintenance()
{
    _admin();

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        try {
            $input = json_decode(file_get_contents('php://input'), true);

            if (!$input) {
                _log("Failed to decode JSON input for maintenance scheduling");
                header('Content-Type: application/json');
                echo json_encode(['success' => false, 'message' => 'Invalid JSON input']);
                exit;
            }

            // Validate required fields
            $required_fields = ['asset_id', 'maintenance_type', 'scheduled_date', 'description'];
            foreach ($required_fields as $field) {
                if (empty($input[$field])) {
                    header('Content-Type: application/json');
                    echo json_encode(['success' => false, 'message' => "Field '$field' is required"]);
                    exit;
                }
            }

            // Check if asset exists
            $asset = ORM::for_table('tbl_assets')
                ->where('asset_id', $input['asset_id'])
                ->find_one();

            if (!$asset) {
                header('Content-Type: application/json');
                echo json_encode(['success' => false, 'message' => 'Asset not found']);
                exit;
            }

            // Create maintenance schedule record
            $maintenance = ORM::for_table('tbl_asset_maintenance')->create();
            $maintenance->asset_id = $input['asset_id'];
            $maintenance->maintenance_type = $input['maintenance_type'];
            $maintenance->scheduled_date = $input['scheduled_date'];
            $maintenance->maintenance_date = null; // Will be set when maintenance is completed
            $maintenance->description = $input['description'];
            $maintenance->technician = $input['technician'] ?? null;
            $maintenance->cost = $input['estimated_cost'] ?? 0;
            $maintenance->priority = $input['priority'] ?? 'medium';
            $maintenance->status = 'scheduled';
            $maintenance->created_at = date('Y-m-d H:i:s');
            $maintenance->save();

            _log("Scheduled maintenance for asset: " . $input['asset_id'] . " on " . $input['scheduled_date']);

            header('Content-Type: application/json');
            echo json_encode([
                'success' => true,
                'message' => 'Maintenance scheduled successfully',
                'maintenance_id' => $maintenance->id
            ]);
            exit;
        } catch (Exception $e) {
            _log("Error scheduling maintenance: " . $e->getMessage());
            header('Content-Type: application/json');
            echo json_encode(['success' => false, 'message' => 'Error scheduling maintenance: ' . $e->getMessage()]);
            exit;
        }
    }

    header('Content-Type: application/json');
    echo json_encode(['success' => false, 'message' => 'Invalid request method']);
    exit;
}

function asset_complete_maintenance()
{
    _admin();

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        try {
            $input = json_decode(file_get_contents('php://input'), true);

            if (!$input || empty($input['maintenance_id'])) {
                header('Content-Type: application/json');
                echo json_encode(['success' => false, 'message' => 'Maintenance ID is required']);
                exit;
            }

            // Find maintenance record
            $maintenance = ORM::for_table('tbl_asset_maintenance')
                ->where('id', $input['maintenance_id'])
                ->find_one();

            if (!$maintenance) {
                header('Content-Type: application/json');
                echo json_encode(['success' => false, 'message' => 'Maintenance record not found']);
                exit;
            }

            // Update maintenance record
            $maintenance->status = 'completed';
            $maintenance->maintenance_date = $input['completion_date'] ?? date('Y-m-d');
            $maintenance->actual_cost = $input['actual_cost'] ?? $maintenance->estimated_cost;
            $maintenance->technician = $input['technician'] ?? $maintenance->technician;
            $maintenance->completion_notes = $input['completion_notes'] ?? '';
            $maintenance->updated_at = date('Y-m-d H:i:s');
            $maintenance->save();

            _log("Completed maintenance for maintenance ID: " . $input['maintenance_id']);

            header('Content-Type: application/json');
            echo json_encode([
                'success' => true,
                'message' => 'Maintenance marked as completed'
            ]);
            exit;
        } catch (Exception $e) {
            _log("Error completing maintenance: " . $e->getMessage());
            header('Content-Type: application/json');
            echo json_encode(['success' => false, 'message' => 'Error completing maintenance: ' . $e->getMessage()]);
            exit;
        }
    }

    header('Content-Type: application/json');
    echo json_encode(['success' => false, 'message' => 'Invalid request method']);
    exit;
}

function asset_maintenance_list()
{
    _admin();

    try {
        $status = $_GET['status'] ?? 'all';
        $asset_id = $_GET['asset_id'] ?? null;

        $query = ORM::for_table('tbl_asset_maintenance')
            ->table_alias('m')
            ->select('m.*')
            ->left_outer_join('tbl_assets', ['m.asset_id', '=', 'a.asset_id'], 'a')
            ->select('a.name', 'asset_name')
            ->select('a.category', 'asset_category');

        if ($status !== 'all') {
            $query->where('m.status', $status);
        }

        if ($asset_id) {
            $query->where('m.asset_id', $asset_id);
        }

        $maintenance_records = $query->order_by_desc('m.scheduled_date')->find_array();

        header('Content-Type: application/json');
        echo json_encode([
            'success' => true,
            'data' => $maintenance_records
        ]);
        exit;
    } catch (Exception $e) {
        _log("Error fetching maintenance list: " . $e->getMessage());
        header('Content-Type: application/json');
        echo json_encode(['success' => false, 'message' => 'Error fetching maintenance records']);
        exit;
    }
}

function asset_upcoming_maintenance()
{
    _admin();

    try {
        $days_ahead = $_GET['days'] ?? 30;
        $today = date('Y-m-d');
        $future_date = date('Y-m-d', strtotime("+$days_ahead days"));

        $upcoming = ORM::for_table('tbl_asset_maintenance')
            ->table_alias('m')
            ->select('m.*')
            ->select('a.name', 'asset_name')
            ->select('a.category', 'asset_category')
            ->select('a.location', 'asset_location')
            ->left_outer_join('tbl_assets', ['m.asset_id', '=', 'a.asset_id'], 'a')
            ->where_gte('m.scheduled_date', $today)
            ->where_lte('m.scheduled_date', $future_date)
            ->order_by_asc('m.scheduled_date')
            ->find_array();

        header('Content-Type: application/json');
        echo json_encode([
            'success' => true,
            'data' => $upcoming
        ]);
        exit;
    } catch (Exception $e) {
        _log("Error fetching upcoming maintenance: " . $e->getMessage());
        header('Content-Type: application/json');
        echo json_encode(['success' => false, 'message' => 'Error fetching upcoming maintenance']);
        exit;
    }
}

function asset_update_maintenance()
{
    _admin();

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        try {
            $input = json_decode(file_get_contents('php://input'), true);

            if (!$input || empty($input['maintenance_id'])) {
                header('Content-Type: application/json');
                echo json_encode(['success' => false, 'message' => 'Maintenance ID is required']);
                exit;
            }

            // Find maintenance record
            $maintenance = ORM::for_table('tbl_asset_maintenance')
                ->where('id', $input['maintenance_id'])
                ->find_one();

            if (!$maintenance) {
                header('Content-Type: application/json');
                echo json_encode(['success' => false, 'message' => 'Maintenance record not found']);
                exit;
            }

            // Update maintenance record
            if (isset($input['asset_id'])) $maintenance->asset_id = $input['asset_id'];
            if (isset($input['maintenance_type'])) $maintenance->maintenance_type = $input['maintenance_type'];
            if (isset($input['scheduled_date'])) $maintenance->scheduled_date = $input['scheduled_date'];
            if (isset($input['priority'])) $maintenance->priority = $input['priority'];
            if (isset($input['technician'])) $maintenance->technician = $input['technician'];
            if (isset($input['cost'])) $maintenance->cost = $input['cost'];
            if (isset($input['description'])) $maintenance->description = $input['description'];
            if (isset($input['status'])) $maintenance->status = $input['status'];

            $maintenance->updated_at = date('Y-m-d H:i:s');
            $maintenance->save();

            _log("Updated maintenance ID: " . $input['maintenance_id']);

            header('Content-Type: application/json');
            echo json_encode([
                'success' => true,
                'message' => 'Maintenance schedule updated successfully'
            ]);
            exit;
        } catch (Exception $e) {
            _log("Error updating maintenance: " . $e->getMessage());
            header('Content-Type: application/json');
            echo json_encode(['success' => false, 'message' => 'Error updating maintenance: ' . $e->getMessage()]);
            exit;
        }
    }

    header('Content-Type: application/json');
    echo json_encode(['success' => false, 'message' => 'Invalid request method']);
    exit;
}

function asset_delete_maintenance()
{
    _admin();

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        try {
            $input = json_decode(file_get_contents('php://input'), true);

            if (!$input || empty($input['maintenance_id'])) {
                header('Content-Type: application/json');
                echo json_encode(['success' => false, 'message' => 'Maintenance ID is required']);
                exit;
            }

            // Find maintenance record
            $maintenance = ORM::for_table('tbl_asset_maintenance')
                ->where('id', $input['maintenance_id'])
                ->find_one();

            if (!$maintenance) {
                header('Content-Type: application/json');
                echo json_encode(['success' => false, 'message' => 'Maintenance record not found']);
                exit;
            }

            // Delete maintenance record
            $result = $maintenance->delete();

            if ($result) {
                _log("Deleted maintenance ID: " . $input['maintenance_id']);
                header('Content-Type: application/json');
                echo json_encode([
                    'success' => true,
                    'message' => 'Maintenance schedule deleted successfully'
                ]);
            } else {
                header('Content-Type: application/json');
                echo json_encode(['success' => false, 'message' => 'Failed to delete maintenance schedule']);
            }
            exit;
        } catch (Exception $e) {
            _log("Error deleting maintenance: " . $e->getMessage());
            header('Content-Type: application/json');
            echo json_encode(['success' => false, 'message' => 'Error deleting maintenance: ' . $e->getMessage()]);
            exit;
        }
    }

    header('Content-Type: application/json');
    echo json_encode(['success' => false, 'message' => 'Invalid request method']);
    exit;
}

function getLifecycleDistribution()
{
    try {
        _log("Starting getLifecycleDistribution calculation");

        $distribution = [];
        $labels = ['New (0-1yr)', 'Good (1-3yr)', 'Aging (3-5yr)', 'End of Life (5yr+)'];
        $data = [0, 0, 0, 0];

        // Get all assets with purchase dates
        $assets = ORM::for_table('tbl_assets')
            ->select('purchase_date', 'created_at')
            ->where_not_null('purchase_date')
            ->find_array();

        $currentDate = new DateTime();

        foreach ($assets as $asset) {
            $assetDate = new DateTime($asset['purchase_date']);
            $interval = $currentDate->diff($assetDate);
            $years = $interval->y + ($interval->m / 12); // Include months as decimal

            if ($years <= 1) {
                $data[0]++; // New (0-1yr)
            } elseif ($years <= 3) {
                $data[1]++; // Good (1-3yr)
            } elseif ($years <= 5) {
                $data[2]++; // Aging (3-5yr)
            } else {
                $data[3]++; // End of Life (5yr+)
            }
        }

        // For assets without purchase dates, use created_at as fallback
        $assetsWithoutPurchaseDate = ORM::for_table('tbl_assets')
            ->select('created_at')
            ->where_null('purchase_date')
            ->find_array();

        foreach ($assetsWithoutPurchaseDate as $asset) {
            $assetDate = new DateTime($asset['created_at']);
            $interval = $currentDate->diff($assetDate);
            $years = $interval->y + ($interval->m / 12);

            if ($years <= 1) {
                $data[0]++; // New (0-1yr)
            } elseif ($years <= 3) {
                $data[1]++; // Good (1-3yr)
            } elseif ($years <= 5) {
                $data[2]++; // Aging (3-5yr)
            } else {
                $data[3]++; // End of Life (5yr+)
            }
        }

        $result = [
            'labels' => $labels,
            'data' => $data
        ];

        _log("Lifecycle Distribution Result: " . json_encode($result));

        return $result;
    } catch (Exception $e) {
        _log("Asset Lifecycle Distribution Error: " . $e->getMessage());
        return [
            'labels' => ['New (0-1yr)', 'Good (1-3yr)', 'Aging (3-5yr)', 'End of Life (5yr+)'],
            'data' => [0, 0, 0, 0]
        ];
    }
}

/**
 * Function to generate and export asset reports in PDF format
 * This function handles the AJAX request from the asset manager UI
 * to create PDF reports for inventory, value, maintenance, depreciation, or status
 */
function asset_report_export()
{
    _admin();

    // Check user permissions
    $admin = Admin::_info();
    if (!in_array($admin['user_type'], ['SuperAdmin', 'Admin', 'Sales'])) {
        header('Content-Type: application/json');
        echo json_encode(['success' => false, 'message' => Lang::T('Permission denied')]);
        exit;
    }

    // Check if the request is POST
    if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
        header('Content-Type: application/json');
        echo json_encode(['success' => false, 'message' => Lang::T('Invalid request method')]);
        exit;
    }

    // Get the report data from the request
    $reportDataJson = $_POST['reportData'] ?? '';

    if (empty($reportDataJson)) {
        header('Content-Type: application/json');
        echo json_encode(['success' => false, 'message' => Lang::T('No report data provided')]);
        exit;
    }

    // Decode the report data
    $reportData = json_decode($reportDataJson, true);

    if (json_last_error() !== JSON_ERROR_NONE) {
        header('Content-Type: application/json');
        echo json_encode(['success' => false, 'message' => Lang::T('Invalid JSON data')]);
        exit;
    }

    try {
        // Check if we have required data
        if (!isset($reportData['reportType']) || !isset($reportData['title']) || !isset($reportData['tableHTML'])) {
            header('Content-Type: application/json');
            echo json_encode(['success' => false, 'message' => Lang::T('Missing required report data')]);
            exit;
        }

        // Generate a unique filename for the PDF
        $timestamp = date('Y-m-d_H-i-s');
        $reportType = $reportData['reportType'];
        $fileName = "asset_{$reportType}_report_{$timestamp}.pdf";
        $filePath = 'system/uploads/' . $fileName;

        // Generate the PDF content
        $html = generatePdfHtml($reportData);

        $mpdf = new \Mpdf\Mpdf([
            'margin_left' => 15,
            'margin_right' => 15,
            'margin_top' => 15,
            'margin_bottom' => 15,
        ]);

        // Set document information
        $mpdf->SetTitle($reportData['title']);
        $mpdf->SetAuthor($admin['fullname']);
        $mpdf->SetCreator($GLOBALS['config']['CompanyName']);

        // Set header
        $mpdf->SetHTMLHeader('<div style="text-align: center; font-weight: bold;">' . $GLOBALS['config']['CompanyName'] . '</div>');

        // Set footer
        $mpdf->SetHTMLFooter('<div style="text-align: center; font-size: 10px;">Generated on: ' . date('Y-m-d H:i:s') . '</div>');

        // Write HTML content
        $mpdf->WriteHTML($html);

        // Save file
        $mpdf->Output($filePath, \Mpdf\Output\Destination::FILE);


        // Check if file was created
        if (!file_exists($filePath)) {
            header('Content-Type: application/json');
            echo json_encode(['success' => false, 'message' => Lang::T('Failed to save PDF file')]);
            exit;
        }

        // Log the successful PDF generation
        _log("Generated PDF report: " . $fileName, $admin['user_type']);

        // Return success response with file URL
        $fileUrl = getUrl('') . '/' . $filePath;
        header('Content-Type: application/json');
        echo json_encode([
            'success' => true,
            'message' => Lang::T('PDF report generated successfully'),
            'fileName' => $fileName,
            'fileUrl' => $fileUrl
        ]);
    } catch (Exception $e) {
        _log("PDF generation error: " . $e->getMessage());
        header('Content-Type: application/json');
        echo json_encode([
            'success' => false,
            'message' => Lang::T('PDF generation error: ') . $e->getMessage()
        ]);
    }
    exit;
}

/**
 * Helper function to generate HTML content for the PDF report with professional styling
 * 
 * @param array $reportData The report data from the request
 * @return string The HTML content for the PDF
 */
function generatePdfHtml($reportData)
{
    // Extract data
    $title = $reportData['title'];
    $reportType = $reportData['reportType'];
    $tableHTML = $reportData['tableHTML'];
    $summaryHTML = $reportData['summaryHTML'] ?? '';
    $companyName = $GLOBALS['config']['CompanyName'];
    $currentDate = date('F j, Y');
    $currentTime = date('H:i:s');

    // Create a simple HTML structure
    $html = "<!DOCTYPE html>
        <html>
        <head>
            <title>{$title}</title>
            <style>
                body { font-family: Arial, sans-serif; }
                .header { text-align: center; margin-bottom: 20px; }
                table { width: 100%; border-collapse: collapse; }
                th, td { border: 1px solid #ddd; padding: 8px; }
                th { background-color: #f2f2f2; }
            </style>
        </head>
        <body>
            <div class='header'>
                <h1>{$title}</h1>
                <p>Generated on {$currentDate} at {$currentTime}</p>
            </div>";

    // Add summary if available
    if (!empty($summaryHTML)) {
        $html .= '<div>' . $summaryHTML . '</div>';
    }

    // Add table (either as is if it's HTML, or create a simple one if it's text)
    if (strpos($tableHTML, '<table') !== false) {
        $html .= $tableHTML;
    } else {
        // Create a basic table from plaintext
        $html .= '<table>';
        $lines = preg_split('/\r\n|\r|\n/', $tableHTML);
        foreach ($lines as $index => $line) {
            $line = trim($line);
            if (empty($line)) continue;

            $cells = preg_split('/\s{2,}/', $line);

            $html .= '<tr>';
            foreach ($cells as $cell) {
                $tag = ($index === 0) ? 'th' : 'td';
                $html .= "<{$tag}>" . htmlspecialchars(trim($cell)) . "</{$tag}>";
            }
            $html .= '</tr>';
        }
        $html .= '</table>';
    }

    $html .= "
            <div style='margin-top: 20px; text-align: center;'>
                <p>Generated by {$companyName}</p>
            </div>
        </body>
        </html>";

    return $html;
}

/**
 * Handler for marking welcome message as seen
 */
function asset_welcome_seen()
{
    _admin();
    // _log("Processing asset_welcome_seen request");
    
    if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
        header('Content-Type: application/json');
       // _log("Invalid request method for asset_welcome_seen");
        echo json_encode(['success' => false, 'message' => 'Invalid request method']);
        exit;
    }
    // Update the settings to record that welcome message has been seen
    try {
        $exists = ORM::for_table('tbl_appconfig')
            ->where('setting', 'welcome_message_viewed')
            ->count();
            
        if ($exists) {
            ORM::for_table('tbl_appconfig')
                ->where('setting', 'welcome_message_viewed')
                ->find_one()
                ->set('value', 'yes')
                ->save();
        } else {
            ORM::for_table('tbl_appconfig')->create()
                ->set('setting', 'welcome_message_viewed')
                ->set('value', 'yes')
                ->save();
        }
        
        header('Content-Type: application/json');
        echo json_encode(['success' => true]);
    } catch (Exception $e) {
        header('Content-Type: application/json');
        echo json_encode(['success' => false, 'message' => $e->getMessage()]);
    }
    exit;
}