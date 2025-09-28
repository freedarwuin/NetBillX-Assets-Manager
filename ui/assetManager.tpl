{include file="sections/header.tpl"}

<style>
    .asset-stats-card {
        transition: transform 0.2s;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
    }

    .asset-stats-card:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
    }

    .huge {
        font-size: 40px;
        font-weight: bold;
    }

    .panel-green {
        border-color: #5cb85c;
    }

    .panel-green>.panel-heading {
        color: #fff;
        background-color: #5cb85c;
        border-color: #5cb85c;
    }

    .panel-yellow {
        border-color: #f0ad4e;
    }

    .panel-yellow>.panel-heading {
        color: #fff;
        background-color: #f0ad4e;
        border-color: #f0ad4e;
    }

    .panel-red {
        border-color: #d9534f;
    }

    .panel-red>.panel-heading {
        color: #fff;
        background-color: #d9534f;
        border-color: #d9534f;
    }

    .panel-info {
        border-color: #5bc0de;
    }

    .panel-info>.panel-heading {
        color: #fff;
        background-color: #5bc0de;
        border-color: #5bc0de;
    }

    .asset-search-filter {
        margin-bottom: 15px;
    }

    .status-badge {
        font-size: 11px;
        padding: 3px 8px;
    }

    .maintenance-alert {
        background-color: #fcf8e3;
        border: 1px solid #faebcc;
        border-radius: 4px;
        padding: 8px 12px;
        margin-bottom: 10px;
    }

    .warranty-alert {
        background-color: #f2dede;
        border: 1px solid #ebccd1;
        border-radius: 4px;
        padding: 8px 12px;
        margin-bottom: 10px;
    }

    .chart-container {
        position: relative;
        height: 300px;
        margin-bottom: 20px;
    }

    .map-container {
        height: 400px;
        border-radius: 8px;
        border: 1px solid #ddd;
    }

    .location-info {
        background: white;
        padding: 10px;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        margin: 5px;
    }

    .dashboard-stats {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        border-radius: 10px;
        padding: 20px;
        margin-bottom: 20px;
    }

    .metric-card {
        background: white;
        border-radius: 8px;
        padding: 15px;
        margin: 10px 0;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        transition: all 0.3s ease;
    }

    .metric-card:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
    }

    .progress-circle {
        width: 80px;
        height: 80px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: bold;
        color: white;
        margin: 0 auto;
    }

    .asset-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 20px;
        margin: 20px 0;
    }

    /* Map container styling */
    #mapContainer {
        height: 400px;
        width: 100%;
        border-radius: 8px;
        border: 1px solid #ddd;
    }

    /* Maintenance insights styling */
    .maintenance-insights {
        margin-top: 15px;
    }

    .insight-item {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 8px 0;
        border-bottom: 1px solid #f0f0f0;
    }

    .insight-item:last-child {
        border-bottom: none;
    }

    .trend-indicator.up {
        color: #d9534f;
        font-weight: bold;
    }

    .trend-indicator.down {
        color: #5cb85c;
        font-weight: bold;
    }

    .trend-indicator.stable {
        color: #f0ad4e;
        font-weight: bold;
    }

    /* Summary metrics styling */
    .summary-metric {
        text-align: center;
        padding: 8px;
    }

    .summary-metric strong {
        display: block;
        font-size: 18px;
        color: #333;
        margin-bottom: 2px;
    }

    .summary-metric small {
        font-size: 11px;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }

    .trend-positive {
        color: #5cb85c !important;
    }

    .trend-negative {
        color: #d9534f !important;
    }

    .trend-neutral {
        color: #f0ad4e !important;
    }

    /* Summary Cards */
    .summary-card {
        background: white;
        border-radius: 10px;
        padding: 20px;
        margin-bottom: 20px;
        box-shadow: 0 2px 15px rgba(0, 0, 0, 0.05);
    }

    .summary-card h5 {
        color: #a3a6b4;
        margin: 0;
        font-size: 14px;
    }

    .summary-card .value {
        font-size: 24px;
        font-weight: 600;
        margin: 10px 0;
    }

    /* Dark Mode Styles for Summary Cards */
    .dark-mode .summary-card {
        background: #1e1e2d;
        color: #ffffff;
    }

    /* Summary Cards */
    .summary-card {
        background: white;
        border-radius: 10px;
        padding: 20px;
        margin-bottom: 20px;
        box-shadow: 0 2px 15px rgba(0, 0, 0, 0.05);
    }

    .summary-card h5 {
        color: #a3a6b4;
        margin: 0;
        font-size: 14px;
    }

    .summary-card .value {
        font-size: 24px;
        font-weight: 600;
        margin: 10px 0;
    }

    .maintenance-stats .stat-item {
        margin-bottom: 15px;
    }

    .maintenance-stats .stat-number {
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 5px;
    }

    .maintenance-stats .stat-label {
        font-size: 12px;
        color: #777;
        text-transform: uppercase;
    }

    .list-group-item-danger {
        border-left: 4px solid #d9534f;
    }

    .maintenance-priority-critical {
        background-color: #f2dede;
        border-left: 4px solid #d9534f;
    }

    .maintenance-priority-high {
        background-color: #fcf8e3;
        border-left: 4px solid #f0ad4e;
    }
    
    /* Location panel styles */
    .location-item, .category-item {
        transition: all 0.2s ease;
    }
    
    .location-item:hover, .category-item:hover {
        background-color: #f5f5f5;
    }
    
    .location-item.active, .category-item.active {
        background-color: #eaf4fd;
        border-left: 3px solid #3388ff;
    }
    
    .location-filter {
        margin-bottom: 10px;
    }
    
    .nav-tabs.nav-justified > li > a {
        border-radius: 0;
        border-bottom: none;
        color: #555;
        font-weight: 600;
        padding: 8px 0;
    }
    
    .nav-tabs.nav-justified > li.active > a {
        border-bottom: 2px solid #337ab7;
        color: #337ab7;
    }
    
    .coverage-legend {
        font-size: 11px;
        display: flex;
        justify-content: space-between;
    }
    
    .coverage-legend i {
        margin-right: 4px;
    }
</style>

<div class="row" style="margin-bottom: 10px;">
    <div class="col-sm-12">
        <div class="panel-heading">
            <div class="btn-group pull-right">
                <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#addAssetModal">
                    <i class="fa fa-plus"></i> {Lang::T('Add Asset')}
                </button>
            </div>
        </div>

    </div>
</div>

<!-- Enhanced Statistics Dashboard -->
<div class="dashboard-stats">
    <div class="row">
        <div class="col-md-12">
            <h3 style="margin-top: 0;"><i class="fa fa-tachometer"></i> {Lang::T('Asset Overview Dashboard')}</h3>
            <p>{Lang::T('Real-time monitoring of your assets and infrastructure')}</p>
        </div>
    </div>
</div>

<!-- Statistics Cards -->
<div class="row">
    <div class="col-lg-3 col-md-6">
        <div class="panel asset-stats-card">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-xs-3">
                        <i class="fa fa-server fa-3x"></i>
                    </div>
                    <div class="col-xs-9 text-right">
                        <div class="huge" id="totalAssets">0</div>
                        <div>{Lang::T('Total Assets')}</div>
                    </div>
                </div>
            </div>
            <div class="panel-footer">
                <span class="pull-left">{Lang::T('View Details')}</span>
                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>

    <div class="col-lg-3 col-md-6">
        <div class="panel asset-stats-card">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-xs-3">
                        <i class="fa fa-check-circle fa-3x"></i>
                    </div>
                    <div class="col-xs-9 text-right">
                        <div class="huge" id="activeAssets">0</div>
                        <div>{Lang::T('Active Assets')}</div>
                    </div>
                </div>
            </div>
            <div class="panel-footer">
                <span class="pull-left">{Lang::T('View Details')}</span>
                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>

    <div class="col-lg-3 col-md-6">
        <div class="panel asset-stats-card">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-xs-3">
                        <i class="fa fa-wrench fa-3x"></i>
                    </div>
                    <div class="col-xs-9 text-right">
                        <div class="huge" id="maintenanceAssets">0</div>
                        <div>{Lang::T('Under Maintenance')}</div>
                    </div>
                </div>
            </div>
            <div class="panel-footer">
                <span class="pull-left">{Lang::T('View Details')}</span>
                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>

    <div class="col-lg-3 col-md-6">
        <div class="panel asset-stats-card">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-xs-3">
                        <i class="fa fa-exclamation-triangle fa-3x"></i>
                    </div>
                    <div class="col-xs-9 text-right">
                        <div class="huge" id="criticalAssets">0</div>
                        <div>{Lang::T('Critical Status')}</div>
                    </div>
                </div>
            </div>
            <div class="panel-footer">
                <span class="pull-left">{Lang::T('View Details')}</span>
                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>

<!-- Additional Metrics Row -->
<div class="row">
    <div class="col-md-3">
        <div class="summary-card">
            <div class="row">
                <div class="col-xs-4">
                    <div class="progress-circle" style="background-color: #3498db;" id="utilizationCircle">0%</div>
                </div>
                <div class="col-xs-8">
                    <h4>{Lang::T('Asset Utilization')}</h4>
                    <p class="text-muted">{Lang::T('Overall efficiency rate')}</p>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="summary-card">
            <div class="text-center">
                <h3 style="color: #27ae60; margin: 0px 0;" id="totalValue">{$_c['currency_code']}0</h3>
                <h4>{Lang::T('Total Asset Value')}</h4>
                <p class="text-muted">{Lang::T('Current market value')}</p>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="summary-card">
            <div class="text-center">
                <h3 style="color: #e74c3c; margin: 0px 0;" id="monthlyMaintenanceCost">{$_c['currency_code']}0</h3>
                <h4>{Lang::T('Monthly Maintenance')}</h4>
                <p class="text-muted">{Lang::T('This month costs')}</p>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="summary-card">
            <div class="text-center">
                <h3 style="color: #f39c12; margin: 0px 0;" id="avgUptime">0%</h3>
                <h4>{Lang::T('Average Uptime')}</h4>
                <p class="text-muted">{Lang::T('Last 30 days')}</p>
            </div>
        </div>
    </div>
</div>
<!-- Asset Categories Tabs -->
<div class="row">
    <div class="col-sm-12">
        <div class="panel panel-hovered mb20 panel-primary">
            <div class="panel-heading">
                <div class="panel-title">{Lang::T('Asset Categories')}</div>
            </div>
            <div class="panel-body">
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active">
                        <a href="#dashboard" aria-controls="dashboard" role="tab" data-toggle="tab">
                            <i class="fa fa-tachometer"></i> {Lang::T('Dashboard')}
                        </a>
                    </li>
                    <li role="presentation">
                        <a href="#network-equipment" aria-controls="network-equipment" role="tab" data-toggle="tab">
                            <i class="fa fa-wifi"></i> {Lang::T('Network Equipment')}
                        </a>
                    </li>
                    <li role="presentation">
                        <a href="#customer-equipment" aria-controls="customer-equipment" role="tab" data-toggle="tab">
                            <i class="fa fa-desktop"></i> {Lang::T('Customer Equipment')}
                        </a>
                    </li>
                    <li role="presentation">
                        <a href="#infrastructure" aria-controls="infrastructure" role="tab" data-toggle="tab">
                            <i class="fa fa-building"></i> {Lang::T('Infrastructure')}
                        </a>
                    </li>
                    <li role="presentation">
                        <a href="#vehicles" aria-controls="vehicles" role="tab" data-toggle="tab">
                            <i class="fa fa-truck"></i> {Lang::T('Vehicles')}
                        </a>
                    </li>
                    <li role="presentation">
                        <a href="#tools" aria-controls="tools" role="tab" data-toggle="tab">
                            <i class="fa fa-wrench"></i> {Lang::T('Tools & Equipment')}
                        </a>
                    </li>
                    <li role="presentation">
                        <a href="#location-view" aria-controls="location-view" role="tab" data-toggle="tab">
                            <i class="fa fa-map-marker"></i> {Lang::T('Location View')}
                        </a>
                    </li>

                    <!-- Maintenance Schedule Tab -->
                    <li role="presentation">
                        <a href="#maintenance-schedule" aria-controls="maintenance-schedule" role="tab"
                            data-toggle="tab">
                            <i class="fa fa-calendar"></i> {Lang::T('Maintenance Schedule')}
                        </a>
                    </li>
                    

                    <!-- Reports Tab -->
                    <li role="presentation">
                        <a href="#reports" aria-controls="reports" role="tab" data-toggle="tab">
                            <i class="fa fa-file-text"></i> {Lang::T('Reports')}
                        </a>
                    </li>
                </ul>

                <div class="tab-content" style="margin-top: 20px;">
                    <!-- Dashboard Tab -->
                    <div role="tabpanel" class="tab-pane active" id="dashboard">
                        <div class="row">
                            <div class="col-md-8">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4><i class="fa fa-line-chart"></i> {Lang::T('Asset Health Trends')}</h4>
                                        <p class="help-text" style="margin: 5px 0 0 0; font-size: 12px; color: #777;">
                                            {Lang::T('Monthly tracking of operational assets vs maintenance
                                            activities')}
                                        </p>
                                    </div>
                                    <div class="panel-body">
                                        <div class="performance-metrics-info" style="margin-bottom: 15px;">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="metric-info">
                                                        <span class="metric-label" style="color: #5cb85c;">●
                                                            {Lang::T('Active Assets')}:</span>
                                                        <small>{Lang::T('Assets in operational status')}</small>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="metric-info">
                                                        <span class="metric-label" style="color: #f0ad4e;">●
                                                            {Lang::T('Maintenance Activities')}:</span>
                                                        <small>{Lang::T('Monthly maintenance records')}</small>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="chart-container">
                                            <canvas id="performanceChart"></canvas>
                                        </div>
                                        <div class="chart-summary"
                                            style="margin-top: 15px; padding-top: 15px; border-top: 1px solid #eee;">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="summary-metric">
                                                        <strong id="currentActiveAssets">-</strong>
                                                        <small class="text-muted">{Lang::T('Current Active
                                                            Assets')}</small>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="summary-metric">
                                                        <strong id="monthlyMaintenance">-</strong>
                                                        <small class="text-muted">{Lang::T('This Month
                                                            Maintenance')}</small>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="summary-metric">
                                                        <strong id="healthTrend" class="trend-neutral">-</strong>
                                                        <small class="text-muted">{Lang::T('Asset Health
                                                            Trend')}</small>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="panel panel-info">
                                    <div class="panel-heading">
                                        <h4><i class="fa fa-pie-chart"></i> {Lang::T('Asset Distribution')}</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="chart-container">
                                            <canvas id="distributionChart"></canvas>
                                        </div>
                                    </div>
                                    <div class="panel-body">
                                        <div class="forecast-list">
                                            <strong>{Lang::T('Maintenance Forecast')}:</strong>
                                            <div class="alert alert-warning">
                                                <div class="maintenance-insights">
                                                    <div class="insight-item">
                                                        <strong>{Lang::T('Current Quarter')}:</strong>
                                                        <span id="currentQuarterCost">{$_c['currency_code']}0</span>
                                                    </div>
                                                    <div class="insight-item">
                                                        <strong>{Lang::T('Planned vs Emergency Ratio')}:</strong>
                                                        <span id="maintenanceRatio">-</span>
                                                    </div>
                                                    <div class="insight-item">
                                                        <strong>{Lang::T('Cost Trend')}:</strong>
                                                        <span id="costTrend" class="trend-indicator">-</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="panel panel-primary">
                                    <div class="panel-heading">
                                        <h4><i class="fa fa-bar-chart"></i> {Lang::T('Asset Utilization Trends')}</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="chart-container">
                                            <canvas id="utilizationTrendChart"></canvas>
                                            <div id="utilizationNoData"
                                                style="display:none; text-align:center; padding:50px;">
                                                <i class="fa fa-info-circle fa-3x text-muted"></i>
                                                <h4 class="text-muted">No Utilization Data Available</h4>
                                                <p class="text-muted">Asset utilization trends will appear here once you
                                                    have assets with usage history.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="panel panel-success">
                                    <div class="panel-heading">
                                        <h4><i class="fa fa-line-chart"></i> {Lang::T('Maintenance Cost Analysis')}</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="chart-container">
                                            <canvas id="maintenanceCostChart"></canvas>
                                            <div id="maintenanceNoData"
                                                style="display:none; text-align:center; padding:50px;">
                                                <i class="fa fa-info-circle fa-3x text-muted"></i>
                                                <h4 class="text-muted">{Lang::T('No Maintenance Cost Data Available')}
                                                </h4>
                                                <p class="text-muted">{Lang::T('Maintenance cost trends will appear here
                                                    once you have maintenance records with cost information.')}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="panel panel-warning">
                                    <div class="panel-heading">
                                        <h4><i class="fa fa-clock-o"></i> {Lang::T('Asset Lifecycle')}</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="chart-container">
                                            <canvas id="lifecycleChart"></canvas>
                                            <div id="lifecycleNoData"
                                                style="display:none; text-align:center; padding:50px;">
                                                <i class="fa fa-info-circle fa-3x text-muted"></i>
                                                <h4 class="text-muted">{Lang::T('No Asset Lifecycle Data Available')}
                                                </h4>
                                                <p class="text-muted">{Lang::T('Asset lifecycle distribution will appear
                                                    here once
                                                    you have assets with different ages and statuses.')}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Network Equipment Tab -->
                    <div role="tabpanel" class="tab-pane" id="network-equipment">
                        <div class="table-responsive">
                            <div class="row mb-3" style="margin-bottom: 10px;">
                                <div class="col-md-6">
                                    <input type="text" class="form-control" id="searchNetworkEquipment"
                                        placeholder="Search network equipment...">
                                </div>
                                <div class="col-md-6">
                                    <select class="form-control" id="filterNetworkStatus">
                                        <option value="">{Lang::T('All Status')}</option>
                                        <option value="active">{Lang::T('Active')}</option>
                                        <option value="maintenance">{Lang::T('Maintenance')}</option>
                                        <option value="offline">{Lang::T('Offline')}</option>
                                        <option value="decommissioned">{Lang::T('Decommissioned')}</option>
                                    </select>
                                </div>
                            </div>
                            <table class="table table-bordered table-striped" id="networkEquipmentTable">
                                <thead>
                                    <tr>
                                        <th>{Lang::T('Asset')} ID</th>
                                        <th>{Lang::T('Equipment Type')}</th>
                                        <th>{Lang::T('Brand/Model')}</th>
                                        <th>{Lang::T('Serial Number')}</th>
                                        <th>{Lang::T('Location')}</th>
                                        <th>{Lang::T('Status')}</th>
                                        <th>{Lang::T('IP Address')}</th>
                                        <th>{Lang::T('Last Maintenance')}</th>
                                        <th>{Lang::T('Assigned To')}</th>
                                        <th>{Lang::T('Actions')}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td colspan="10" class="text-center">{Lang::T('Loading network equipment...')}
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- Customer Equipment Tab -->
                    <div role="tabpanel" class="tab-pane" id="customer-equipment">
                        <div class="table-responsive">
                            <div class="row mb-3" style="margin-bottom: 10px;">
                                <div class="col-md-6">
                                    <input type="text" class="form-control" id="searchCustomerEquipment"
                                        placeholder="{Lang::T('Search customer equipment...')}">
                                </div>
                                <div class="col-md-6">
                                    <select class="form-control" id="filterCustomerStatus">
                                        <option value="">{Lang::T('All Status')}</option>
                                        <option value="deployed">{Lang::T('Deployed')}</option>
                                        <option value="available">{Lang::T('Available')}</option>
                                        <option value="defective">{Lang::T('Defective')}</option>
                                        <option value="returned">{Lang::T('Returned')}</option>
                                    </select>
                                </div>
                            </div>
                            <table class="table table-bordered table-striped" id="customerEquipmentTable">
                                <thead>
                                    <tr>
                                        <th>{Lang::T('Asset')} ID</th>
                                        <th>{Lang::T('Equipment Type')}</th>
                                        <th>{Lang::T('Brand/Model')}</th>
                                        <th>{Lang::T('Serial Number')}</th>
                                        <th>{Lang::T('Location')}</th>
                                        <th>{Lang::T('Customer')}</th>
                                        <th>{Lang::T('Status')}</th>
                                        <th>{Lang::T('Deployed Date')}</th>
                                        <th>{Lang::T('Warranty Expiry')}</th>
                                        <th>{Lang::T('Actions')}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td colspan="10" class="text-center">{Lang::T('Loading customer equipment...')}
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- Infrastructure Tab -->
                    <div role="tabpanel" class="tab-pane" id="infrastructure">
                        <div class="table-responsive">
                            <table class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>{Lang::T('Asset ID')}</th>
                                        <th>{Lang::T('Type')}</th>
                                        <th>{Lang::T('Location')}</th>
                                        <th>{Lang::T('Description')}</th>
                                        <th>{Lang::T('Installation Date')}</th>
                                        <th>{Lang::T('Status')}</th>
                                        <th>{Lang::T('Last Inspection')}</th>
                                        <th>{Lang::T('Actions')}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td colspan="10" class="text-center">{Lang::T('Loading infrastructure...')}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- Vehicles Tab -->
                    <div role="tabpanel" class="tab-pane" id="vehicles">
                        <div class="table-responsive">
                            <table class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>{Lang::T('Vehicle ID')}</th>
                                        <th>{Lang::T('Type')}</th>
                                        <th>{Lang::T('Make/Model')}</th>
                                        <th>{Lang::T('Registration')}</th>
                                        <th>{Lang::T('Assigned To')}</th>
                                        <th>{Lang::T('Status')}</th>
                                        <th>{Lang::T('Actions')}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td colspan="10" class="text-center">{Lang::T('Loading vehicles...')}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- Tools & Equipment Tab -->
                    <div role="tabpanel" class="tab-pane" id="tools">
                        <div class="table-responsive">
                            <table class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>{Lang::T('Tool ID')}</th>
                                        <th>{Lang::T('Tool Name')}</th>
                                        <th>{Lang::T('Brand/Model')}</th>
                                        <th>{Lang::T('Current Location')}</th>
                                        <th>{Lang::T('Assigned To')}</th>
                                        <th>{Lang::T('Status')}</th>
                                        <th>{Lang::T('Actions')}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td colspan="10" class="text-center">{Lang::T('Loading tools and equipment...')}
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- Location View Tab -->
                    <div role="tabpanel" class="tab-pane" id="location-view">
                        <div class="row">
                            <div class="col-md-8">
                                <div class="panel panel-default">
                                    <div class="panel-heading" style="background-color: #f8f8f8; padding: 10px 15px;">
                                        <h4><i class="fa fa-map"></i> {Lang::T('Asset Location Map')}</h4>
                                        <div class="btn-group btn-group-sm pull-right" style="margin-top: -25px;">
                                            <button id="layer-all" class="btn btn-default map-layer-btn active" onclick="toggleMapLayer('all')">
                                                <i class="fa fa-globe"></i> {Lang::T('All')}
                                            </button>
                                            <button id="layer-network" class="btn btn-default map-layer-btn" onclick="toggleMapLayer('network')">
                                                <i class="fa fa-wifi"></i> {Lang::T('Network')}
                                            </button>
                                            <button id="layer-infrastructure" class="btn btn-default map-layer-btn" 
                                                onclick="toggleMapLayer('infrastructure')">
                                                <i class="fa fa-building"></i> {Lang::T('Infrastructure')}
                                            </button>
                                            <button id="layer-vehicles" class="btn btn-default map-layer-btn" onclick="toggleMapLayer('vehicles')">
                                                <i class="fa fa-truck"></i> {Lang::T('Vehicles')}
                                            </button>
                                            <button id="reset-map" class="btn btn-default" onclick="resetMapView()" title="{Lang::T('Reset View')}">
                                                <i class="fa fa-refresh"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="panel-body" style="padding: 0;">
                                        <div id="assetMap" class="map-container" style="height: 600px; width: 100%;"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="panel panel-default">
                                    <div class="panel-heading" style="background-color: #f8f8f8;">
                                        <h4><i class="fa fa-map-signs"></i> {Lang::T('Location Summary')}</h4>
                                    </div>
                                    <div class="panel-body" style="padding: 0;">
                                        <!-- Search location filter -->
                                        <div class="location-filter" style="padding: 15px 15px 5px;">
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="locationSearchInput" placeholder="{Lang::T('Filter locations...')}">
                                                <span class="input-group-btn">
                                                    <button class="btn btn-default" type="button" onclick="filterLocations()">
                                                        <i class="fa fa-search"></i>
                                                    </button>
                                                </span>
                                            </div>
                                        </div>
                                        
                                        <!-- Location Stats -->
                                        <div class="location-stats">
                                            <ul class="nav nav-tabs nav-justified">
                                                <li class="active"><a data-toggle="tab" href="#locations-tab"><i class="fa fa-building-o"></i> {Lang::T('Locations')}</a></li>
                                                <li><a data-toggle="tab" href="#categories-tab"><i class="fa fa-tags"></i> {Lang::T('Categories')}</a></li>
                                            </ul>
                                            
                                            <div class="tab-content" style="padding: 0;">
                                                <div id="locations-tab" class="tab-pane fade in active">
                                                    <div class="list-group" id="locationsList" style="margin-bottom: 0; max-height: 300px; overflow-y: auto;">
                                                        <!-- Location items will be dynamically populated -->
                                                        <div class="list-group-item text-center">
                                                            <i class="fa fa-spinner fa-spin"></i> {Lang::T('Loading locations...')}
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="categories-tab" class="tab-pane fade">
                                                    <div class="list-group" id="categoriesList" style="margin-bottom: 0; max-height: 300px; overflow-y: auto;">
                                                        <!-- Category items will be dynamically populated -->
                                                        <div class="list-group-item text-center">
                                                            <i class="fa fa-spinner fa-spin"></i> {Lang::T('Loading categories...')}
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <!-- Coverage Area Card -->
                                        <div class="card" style="margin: 0; padding: 15px; border-top: 1px solid #ddd; background-color: #f9f9f9;">
                                            <h5 style="margin-top: 0; font-weight: bold; color: #333;">
                                                <i class="fa fa-globe"></i> {Lang::T('Coverage Areas')}
                                            </h5>
                                            <div class="progress" style="height: 10px; margin-bottom: 10px;" id="coverage-progress">
                                                <div class="progress-bar progress-bar-success" style="width: 0%" title="Zone A"></div>
                                                <div class="progress-bar progress-bar-warning" style="width: 0%" title="Zone B"></div>
                                                <div class="progress-bar progress-bar-danger" style="width: 0%" title="Zone C"></div>
                                            </div>
                                            <div class="coverage-legend" style="display: flex; justify-content: space-between; font-size: 12px;" id="coverage-legend">
                                                <span><i class="fa fa-circle text-success"></i> Zone A: 0%</span>
                                                <span><i class="fa fa-circle text-warning"></i> Zone B: 0%</span>
                                                <span><i class="fa fa-circle text-danger"></i> Zone C: 0%</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Maintenance Schedule Tab -->
                    <div role="tabpanel" class="tab-pane" id="maintenance-schedule">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="btn-group pull-right" style="margin-bottom: 15px;">
                                    <button type="button" class="btn btn-primary btn-sm" data-toggle="modal"
                                        data-target="#scheduleMaintenanceModal">
                                        <i class="fa fa-plus"></i> {Lang::T('Schedule Maintenance')}
                                    </button>
                                    <button type="button" class="btn btn-info btn-sm"
                                        onclick="loadUpcomingMaintenance()">
                                        <i class="fa fa-clock-o"></i> {Lang::T('Upcoming')}
                                    </button>
                                    <button type="button" class="btn btn-success btn-sm"
                                        onclick="loadMaintenanceHistory()">
                                        <i class="fa fa-history"></i> {Lang::T('History')}
                                    </button>
                                </div>
                            </div>
                        </div>

                        <!-- Maintenance Alerts -->
                        <div class="row" id="maintenanceAlerts">
                            <div class="col-md-12">
                                <div class="alert alert-info">
                                    <i class="fa fa-info-circle"></i> Loading maintenance schedule...
                                </div>
                            </div>
                        </div>

                        <!-- Maintenance Calendar View -->
                        <div class="row">
                            <div class="col-md-8">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4><i class="fa fa-calendar"></i> {Lang::T('Maintenance Calendar')}</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <table class="table table-bordered table-striped"
                                                id="maintenanceScheduleTable">
                                                <thead>
                                                    <tr>
                                                        <th>{Lang::T('Asset')}</th>
                                                        <th>{Lang::T('Type')}</th>
                                                        <th>{Lang::T('Scheduled Date')}</th>
                                                        <th>{Lang::T('Priority')}</th>
                                                        <th>{Lang::T('Technician')}</th>
                                                        <th>{Lang::T('Estimated Cost')}</th>
                                                        <th>{Lang::T('Status')}</th>
                                                        <th>{Lang::T('Actions')}</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td colspan="10" class="text-center">{Lang::T('Loading
                                                            maintenance schedule...')}
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="panel panel-warning">
                                    <div class="panel-heading">
                                        <h4><i class="fa fa-exclamation-triangle"></i> {Lang::T('Overdue Maintenance')}
                                        </h4>
                                    </div>
                                    <div class="panel-body" id="overdueMaintenance">
                                        <div class="text-center text-muted">
                                            <i class="fa fa-clock-o fa-2x"></i>
                                            <p>{Lang::T('Loading overdue items...')}</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="panel panel-info">
                                    <div class="panel-heading">
                                        <h4><i class="fa fa-line-chart"></i> {Lang::T('Maintenance Stats')}</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="maintenance-stats">
                                            <div class="stat-item">
                                                <h5>{Lang::T('This Month')}</h5>
                                                <div class="row">
                                                    <div class="col-xs-6">
                                                        <div class="stat-number" id="scheduledThisMonth">0</div>
                                                        <div class="stat-label">{Lang::T('Scheduled')}</div>
                                                    </div>
                                                    <div class="col-xs-6">
                                                        <div class="stat-number" id="completedThisMonth">0</div>
                                                        <div class="stat-label">{Lang::T('Completed')}</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="stat-item">
                                                <h5>{Lang::T('Next 7 Days')}</h5>
                                                <div class="stat-number text-warning" id="upcomingWeek">0</div>
                                                <div class="stat-label">{Lang::T('Upcoming Tasks')}</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Reports Tab -->
                    <div role="tabpanel" class="tab-pane" id="reports">
                        <div class="row">
                            <div class="col-md-3">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4><i class="fa fa-file-text"></i> {Lang::T('Report Types')}</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="list-group">
                                            <a href="#" class="list-group-item active" data-report="inventory" onclick="changeReport('inventory')">
                                                <i class="fa fa-list"></i> {Lang::T('Asset Inventory Report')}
                                            </a>
                                            <a href="#" class="list-group-item" data-report="value" onclick="changeReport('value')">
                                                <i class="fa fa-money"></i> {Lang::T('Asset Value Report')}
                                            </a>
                                            <a href="#" class="list-group-item" data-report="maintenance" onclick="changeReport('maintenance')">
                                                <i class="fa fa-wrench"></i> {Lang::T('Maintenance History Report')}
                                            </a>
                                            <a href="#" class="list-group-item" data-report="depreciation" onclick="changeReport('depreciation')">
                                                <i class="fa fa-line-chart"></i> {Lang::T('Depreciation Report')}
                                            </a>
                                            <a href="#" class="list-group-item" data-report="status" onclick="changeReport('status')">
                                                <i class="fa fa-check-circle"></i> {Lang::T('Asset Status Report')}
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-md-9">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 id="report-title"><i class="fa fa-list"></i> {Lang::T('Asset Inventory Report')}</h4>
                                        <div class="btn-group btn-group-sm pull-right" style="margin-top: -25px;">
                                            <button class="btn btn-default" onclick="exportReportPDF()">
                                                <i class="fa fa-file-pdf-o"></i> PDF
                                            </button>
                                            <button class="btn btn-default" onclick="exportReportCSV()">
                                                <i class="fa fa-file-excel-o"></i> CSV
                                            </button>
                                            <button class="btn btn-default" onclick="printReport()">
                                                <i class="fa fa-print"></i> {Lang::T('Print')}
                                            </button>
                                        </div>
                                    </div>
                                    <div class="panel-body">
                                        <!-- Report Filters -->
                                        <div class="row" style="margin-bottom: 15px;">
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>{Lang::T('Date Range')}</label>
                                                    <select class="form-control" id="report-date-range">
                                                        <option value="all">{Lang::T('All Time')}</option>
                                                        <option value="today">{Lang::T('Today')}</option>
                                                        <option value="week">{Lang::T('This Week')}</option>
                                                        <option value="month">{Lang::T('This Month')}</option>
                                                        <option value="year">{Lang::T('This Year')}</option>
                                                        <option value="custom">{Lang::T('Custom Range')}</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>{Lang::T('Category')}</label>
                                                    <select class="form-control" id="report-category">
                                                        <option value="all">{Lang::T('All Categories')}</option>
                                                        <option value="network">{Lang::T('Network Equipment')}</option>
                                                        <option value="customer">{Lang::T('Customer Equipment')}</option>
                                                        <option value="infrastructure">{Lang::T('Infrastructure')}</option>
                                                        <option value="vehicle">{Lang::T('Vehicles')}</option>
                                                        <option value="tool">{Lang::T('Tools')}</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>{Lang::T('Location')}</label>
                                                    <select class="form-control" id="report-location">
                                                        <option value="all">{Lang::T('All Locations')}</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>{Lang::T('Status')}</label>
                                                    <select class="form-control" id="report-status">
                                                        <option value="all">{Lang::T('All Statuses')}</option>
                                                        <option value="active">{Lang::T('Active')}</option>
                                                        <option value="maintenance">{Lang::T('Under Maintenance')}</option>
                                                        <option value="retired">{Lang::T('Retired/Disposed')}</option>
                                                        <option value="storage">{Lang::T('In Storage')}</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="row custom-date-range" style="display:none; margin-bottom: 15px;">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>{Lang::T('Start Date')}</label>
                                                    <input type="date" class="form-control" id="report-start-date">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>{Lang::T('End Date')}</label>
                                                    <input type="date" class="form-control" id="report-end-date">
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="row" style="margin-bottom: 15px;">
                                            <div class="col-md-12">
                                                <button class="btn btn-primary" onclick="generateReport()">
                                                    <i class="fa fa-refresh"></i> {Lang::T('Generate Report')}
                                                </button>
                                            </div>
                                        </div>
                                        
                                        <!-- Report Content -->
                                        <div class="report-content">
                                            <div id="report-visualization" style="height: 300px; margin-bottom: 20px;">
                                                <!-- Charts will be rendered here -->
                                                <canvas id="reportChart"></canvas>
                                            </div>
                                            
                                            <div class="table-responsive">
                                                <table class="table table-striped table-bordered" id="report-table">
                                                    <thead id="report-table-head">
                                                        <!-- Table headers will be dynamically populated -->
                                                    </thead>
                                                    <tbody id="report-table-body">
                                                        <!-- Table data will be dynamically populated -->
                                                    </tbody>
                                                </table>
                                            </div>
                                            
                                            <div id="report-summary" class="well well-sm" style="margin-top: 20px;">
                                                <!-- Summary information will be displayed here -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Add Asset Modal -->
<div class="modal fade" id="addAssetModal" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">{Lang::T('Add New Asset')}</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form id="addAssetForm">
                    <div class="row">
                        <div class="col-md-6">
                            <label>{Lang::T('Asset Category')}</label>
                            <div class="form-group">
                                <select class="form-control" id="assetCategory" required>
                                    <option value="">{Lang::T('Select Category')}</option>
                                    <option value="network">{Lang::T('Network Equipment')}</option>
                                    <option value="customer">{Lang::T('Customer Equipment')}</option>
                                    <option value="infrastructure">{Lang::T('Infrastructure')}</option>
                                    <option value="vehicle">{Lang::T('Vehicle')}</option>
                                    <option value="tool">{Lang::T('Tool &amp; Equipment')}</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label>{Lang::T('Asset')} ID</label>
                            <div class="form-group">
                                <input type="text" class="form-control" id="assetId" placeholder="Auto-generated"
                                    readonly>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <label>{Lang::T('Asset Name/Type')}</label>
                            <div class="form-group">
                                <input type="text" class="form-control" id="assetName" required
                                    placeholder="Router, Tower, Vehicle, CPE, etc.">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label>{Lang::T('Brand/Model')}</label>
                            <div class="form-group">
                                <input type="text" class="form-control" id="brandModel"
                                    placeholder="Brand Name or Model" required>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <label>{Lang::T('Serial Number')}</label>
                            <div class="form-group">
                                <input type="text" class="form-control" id="serialNumber" placeholder="1234567890">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label>{Lang::T('Purchase Date')}</label>
                            <div class="form-group">
                                <input type="date" class="form-control" id="purchaseDate">
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <label>{Lang::T('Purchase Cost')}</label>
                            <div class="form-group">
                                <input type="number" class="form-control" id="purchaseCost" step="0.01" min="0"
                                    placeholder="0.00">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label>{Lang::T('Supplier/Vendor')}</label>
                            <div class="form-group">
                                <input type="text" class="form-control" id="supplier"
                                    placeholder="{Lang::T('Supplier/Vendor')}">
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <label>{Lang::T('Location')}</label>
                            <div class="form-group">
                                <input type="text" class="form-control" id="location"
                                    placeholder="{Lang::T('Location/Address')}">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label>{Lang::T('Status')}</label>
                            <div class="form-group">
                                <select class="form-control" id="status">
                                    <option value="active">{Lang::T('Active')}</option>
                                    <option value="inactive">{Lang::T('Inactive')}</option>
                                    <option value="maintenance">{Lang::T('Under Maintenance')}</option>
                                    <option value="decommissioned">{Lang::T('Decommissioned')}</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <label>{Lang::T('Latitude')}</label>
                            <div class="form-group">
                                <input type="number" class="form-control" id="lat" step="0.000001"
                                    placeholder="7.123456">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label>{Lang::T('Longitude')}</label>
                            <div class="form-group">
                                <input type="text" class="form-control" id="lng" step="0.000001" placeholder="8.123456">
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <label>{Lang::T('Warranty Expiry')}</label>
                            <div class="form-group">
                                <input type="date" class="form-control" id="warrantyExpiry">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label>{Lang::T('Assigned To')}</label>
                            <div class="form-group">
                                <input type="text" class="form-control" id="assignedTo"
                                    placeholder="{Lang::T('Employee/Department/Customer')}">
                            </div>
                        </div>
                    </div>
                    <label>{Lang::T('Deployed Date')}</label>
                    <div class="form-group">
                        <input type="date" class="form-control" id="deployedDate">
                    </div>
                    <label>{Lang::T('Description/Notes')}</label>
                    <div class="form-group">
                        <textarea class="form-control" id="description" rows="3"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">{Lang::T('Cancel')}</button>
                <button type="button" class="btn btn-primary" onclick="saveAsset()">{Lang::T('Save Asset')}</button>
            </div>
        </div>
    </div>
</div>

<!-- Asset Details Modal -->
<div class="modal fade" id="assetDetailsModal" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">{Lang::T('Asset Details')}</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body" id="assetDetailsContent">
                <!-- Asset details will be loaded here -->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">{Lang::T('Close')}</button>
            </div>
        </div>
    </div>
</div>

<!-- Map Modal -->
<div class="modal fade" id="mapModal" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">{Lang::T('Asset Location')}</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div id="mapContainer"></div>
            </div>
        </div>
    </div>
</div>

<!-- Schedule Maintenance Modal -->
<div class="modal fade" id="scheduleMaintenanceModal" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">{Lang::T('Schedule Maintenance')}</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form id="scheduleMaintenanceForm">
                    <div class="row">
                        <div class="col-md-6">
                            <label>{Lang::T('Asset')}</label>
                            <div class="form-group">
                                <select class="form-control" id="maintenanceAssetId" required>
                                    <option value="">{Lang::T('Select Asset')}</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label>{Lang::T('Maintenance Type')}</label>
                            <div class="form-group">
                                <select class="form-control" id="maintenanceType" required>
                                    <option value="">{Lang::T('Select Type')}</option>
                                    <option value="preventive">{Lang::T('Preventive Maintenance')}</option>
                                    <option value="corrective">{Lang::T('Corrective Maintenance')}</option>
                                    <option value="emergency">{Lang::T('Emergency Repair')}</option>
                                    <option value="inspection">{Lang::T('Inspection')}</option>
                                    <option value="calibration">{Lang::T('Calibration')}</option>
                                    <option value="upgrade">{Lang::T('Upgrade')}</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <label>{Lang::T('Scheduled Date')}</label>
                            <div class="form-group">
                                <input type="date" class="form-control" id="scheduledDate" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label>{Lang::T('Priority')}</label>
                            <div class="form-group">
                                <select class="form-control" id="maintenancePriority">
                                    <option value="low">{Lang::T('Low')}</option>
                                    <option value="medium" selected>{Lang::T('Medium')}</option>
                                    <option value="high">{Lang::T('High')}</option>
                                    <option value="critical">{Lang::T('Critical')}</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <label>{Lang::T('Assigned Technician')}</label>
                            <div class="form-group">
                                <input type="text" class="form-control" id="maintenanceTechnician"
                                    placeholder="{Lang::T('Technician name or ID')}">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label>{Lang::T('Estimated Cost')}</label>
                            <div class="form-group">
                                <input type="number" class="form-control" id="estimatedCost" step="0.01" min="0"
                                    placeholder="0.00">
                            </div>
                        </div>
                    </div>

                    <label>{Lang::T('Description/Notes')}</label>
                    <div class="form-group">
                        <textarea class="form-control" id="maintenanceDescription" rows="3"
                            placeholder="{Lang::T('Describe the maintenance work to be performed...')}"
                            required></textarea>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">{Lang::T('Cancel')}</button>
                <button type="button" class="btn btn-primary" onclick="saveMaintenanceSchedule()">{Lang::T('Schedule
                    Maintenance')}</button>
            </div>
        </div>
    </div>
</div>

<!-- Complete Maintenance Modal -->
<div class="modal fade" id="completeMaintenanceModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">{Lang::T('Complete Maintenance')}</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form id="completeMaintenanceForm">
                    <input type="hidden" id="completeMaintenanceId">
                    <label>{Lang::T('Completion Date')}</label>
                    <div class="form-group">
                        <input type="date" class="form-control" id="completionDate" required>
                    </div>
                    <label>{Lang::T('Actual Cost')}</label>
                    <div class="form-group">
                        <input type="number" class="form-control" id="actualCost" step="0.01" min="0">
                    </div>
                    <label>{Lang::T('Technician')}</label>
                    <div class="form-group">
                        <input type="text" class="form-control" id="completionTechnician">
                    </div>
                    <label>{Lang::T('Completion Notes')}</label>
                    <div class="form-group">
                        <textarea class="form-control" id="completionNotes" rows="3"
                            placeholder="{Lang::T('Notes about the completed maintenance...')}"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">{Lang::T('Cancel')}</button>
                <button type="button" class="btn btn-success" onclick="completeMaintenanceTask()">{Lang::T('Mark
                    Complete')}</button>
            </div>
        </div>
    </div>
</div>

{if $_c.welcome_message_viewed neq 'yes'}
<div class="modal fade" id="welcomeAssetManagerModal" tabindex="-1" role="dialog" aria-labelledby="welcomeModalLabel"
    aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title" id="welcomeModalLabel"><i class="fa fa-cubes"></i> {Lang::T('Welcome to Asset Manager!')}
                </h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="text-center mb-4">
                    <img src="https://shop.focuslinkstech.com.ng/public/storage/settings/172805218211.png" alt="Logo" style="max-height: 80px;" class="mb-3">
                    <h4>{Lang::T('Thank you for installing the Asset Manager plugin')}</h4>
                    <p class="text-muted">{Lang::T('Manage your organization\'s assets with ease')}</p>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="card mb-3">
                            <div class="card-header bg-light">
                                <h5 class="mb-0"><i class="fa fa-star"></i> {Lang::T('Key Features')}</h5>
                            </div>
                            <div class="card-body">
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item"><i class="fa fa-check text-success"></i> {Lang::T('Track all your physical assets')}</li>
                                    <li class="list-group-item"><i class="fa fa-check text-success"></i> {Lang::T('Schedule and manage maintenance')}</li>
                                    <li class="list-group-item"><i class="fa fa-check text-success"></i> {Lang::T('Generate detailed reports')}</li>
                                    <li class="list-group-item"><i class="fa fa-check text-success"></i> {Lang::T('Export data to PDF')}</li>
                                    <li class="list-group-item"><i class="fa fa-check text-success"></i> {Lang::T('Track assignments and warranties')}</li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header bg-light">
                                <h5 class="mb-0"><i class="fa fa-rocket"></i> {Lang::T('Getting Started')}</h5>
                            </div>
                            <div class="card-body">
                                <ol class="pl-3">
                                    <li class="mb-2">{Lang::T('Add your first asset by clicking the')} <strong>{Lang::T('Add Asset')}</strong> {Lang::T('button')}</li>
                                    <li class="mb-2">{Lang::T('View your assets by clicking the')} <strong>{Lang::T('View Assets')}</strong> {Lang::T('button')}</li>
                                    <li class="mb-2">{Lang::T('Categorize your assets')} (Network, Infrastructure, etc.)</li>
                                    <li class="mb-2">{Lang::T('Set up locations to track where assets are deployed')}</li>
                                    <li class="mb-2">{Lang::T('Schedule maintenance for important equipment')}</li>
                                    <li class="mb-2">{Lang::T('Generate your first report to see the system in action')}</li>
                                    <li class="mb-2">{Lang::T('Please don\'t forget to donate to support the development')} <a href="https://www.paypal.com/paypalme/focuslinkstech" target="_blank">{Lang::T('Donate Now')}</a></li> 
                                    <li class="mb-2">{Lang::T('Click on Get Started to continue')}</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <a href="https://www.paypal.com/paypalme/focuslinkstech" target="_blank" class="btn btn-primary"><i class="fa fa-paypal"></i> {Lang::T('Donate')}</a>
                <button type="button" class="btn btn-success" data-dismiss="modal"><i class="fa fa-check-circle"></i> {Lang::T('Get Started')}</button>
            </div>
        </div>
    </div>
</div>
{/if}
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<script>
    $(document).ready(function () {
        $("#welcomeAssetManagerModal").modal({
            backdrop: "static",
            keyboard: false
        });

        // Handle welcome message acknowledgment
        $("#welcomeAssetManagerModal .btn-success").on("click", function () {
            $.post("?_route=plugin/asset_welcome_seen", {}, function (data) {
                console.log("Welcome message acknowledged");
            });
        });
    });

    // Asset Management JavaScript Functions
    let currentAssets = [];
    let filteredAssets = [];
    let assetMap = null;
    let charts = {};
    let assetStatistics = {};
    let currencyCode = '{$_c['currency_code']}';

    // Initialize the dashboard
    $(document).ready(function () {
        // Load assets first
        loadAssets();
        generateAssetId();
        loadAssetList();
        loadMaintenanceSchedule();
        loadAssetStatistics();

        // Initialize map when location tab is clicked
        $('a[href="#location-view"]').on('shown.bs.tab', function () {
            if (!assetMap) {
                initializeMap();
            }
            // Make sure location counts are updated whenever we show the location view
            updateLocationCounts();
        });

        // Initialize dashboard charts when dashboard tab is active
        $('a[href="#dashboard"]').on('shown.bs.tab', function () {
            initializeDashboardCharts();
        });

        // Load data for specific tabs when clicked
        $('a[href="#network-equipment"]').on('shown.bs.tab', function () {
            loadAssetsByCategory('network');
        });

        $('a[href="#customer-equipment"]').on('shown.bs.tab', function () {
            loadAssetsByCategory('customer');
        });

        $('a[href="#infrastructure"]').on('shown.bs.tab', function () {
            loadAssetsByCategory('infrastructure');
        });

        $('a[href="#vehicles"]').on('shown.bs.tab', function () {
            loadAssetsByCategory('vehicle');
        });

        $('a[href="#tools"]').on('shown.bs.tab', function () {
            loadAssetsByCategory('tool');
        });
    });

    // Initialize all charts
    function initializeCharts() {
        // Initialize dashboard charts if dashboard tab is active
        if ($('#dashboard').hasClass('active')) {
            initializeDashboardCharts();
        }
    }

    // Initialize dashboard charts
    function initializeDashboardCharts() {
        // Asset Health Trends Chart - showing monthly registrations and maintenance
        const performanceCtx = document.getElementById('performanceChart');
        if (performanceCtx && !charts.performance) {
            // Use performance history data if available
            const performanceHistory = assetStatistics.performance_history || {};
            const labels = performanceHistory.labels || ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
            const registeredData = performanceHistory.registered || [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
            const maintenanceData = performanceHistory.maintenance || [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

            // console.log('Asset Health Trends Data:', { labels, registeredData, maintenanceData });

            charts.performance = new Chart(performanceCtx, {
                type: 'line',
                data: {
                    labels: labels,
                    datasets: [{
                        label: 'New Devices Registered',
                        data: registeredData,
                        borderColor: '#5cb85c',
                        backgroundColor: 'rgba(92, 184, 92, 0.1)',
                        tension: 0.3,
                        fill: true,
                        pointRadius: 4,
                        pointHoverRadius: 6
                    }, {
                        label: 'Maintenance Activities',
                        data: maintenanceData,
                        borderColor: '#f0ad4e',
                        backgroundColor: 'rgba(240, 173, 78, 0.1)',
                        tension: 0.3,
                        fill: true,
                        pointRadius: 4,
                        pointHoverRadius: 6
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    interaction: {
                        intersect: false,
                        mode: 'index'
                    },
                    plugins: {
                        title: {
                            display: true,
                            text: 'Monthly Device Registration & Maintenance Trends',
                            font: {
                                size: 14,
                                weight: 'bold'
                            }
                        },
                        legend: {
                            position: 'top',
                            labels: {
                                usePointStyle: true,
                                padding: 20
                            }
                        },
                        tooltip: {
                            backgroundColor: 'rgba(0, 0, 0, 0.8)',
                            titleColor: '#fff',
                            bodyColor: '#fff',
                            borderColor: '#ddd',
                            borderWidth: 1,
                            callbacks: {
                                title: function (context) {
                                    return 'Month: ' + context[0].label;
                                },
                                label: function (context) {
                                    const label = context.dataset.label;
                                    const value = context.parsed.y;
                                    if (label === 'New Devices Registered') {
                                        return label + ': ' + value + ' new devices added';
                                    } else {
                                        return label + ': ' + value + ' maintenance activities';
                                    }
                                }
                            }
                        }
                    },
                    scales: {
                        y: {
                            beginAtZero: true,
                            title: {
                                display: true,
                                text: 'Count',
                                font: {
                                    size: 12,
                                    weight: 'bold'
                                }
                            },
                            grid: {
                                color: 'rgba(0, 0, 0, 0.1)'
                            },
                            ticks: {
                                stepSize: 1
                            }
                        },
                        x: {
                            title: {
                                display: true,
                                text: 'Month (Last 12 Months)',
                                font: {
                                    size: 12,
                                    weight: 'bold'
                                }
                            },
                            grid: {
                                color: 'rgba(0, 0, 0, 0.1)'
                            }
                        }
                    }
                }
            });
        }

        // Distribution Chart
        const distributionCtx = document.getElementById('distributionChart');
        if (distributionCtx && !charts.distribution) {
            const categoryData = assetStatistics.by_category || [];
            const labels = [];
            const data = [];
            const colors = ['#337ab7', '#5cb85c', '#d9534f', '#f0ad4e', '#5bc0de'];

            categoryData.forEach(function (category, index) {
                labels.push(category.category.charAt(0).toUpperCase() + category.category.slice(1));
                data.push(category.count);
            });

            // Add default data if no categories exist
            if (labels.length === 0) {
                labels.push('Network', 'Customer', 'Infrastructure', 'Vehicles', 'Tools');
                data.push(0, 0, 0, 0, 0);
            }

            charts.distribution = new Chart(distributionCtx, {
                type: 'doughnut',
                data: {
                    labels: labels,
                    datasets: [{
                        data: data,
                        backgroundColor: colors.slice(0, labels.length)
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: {
                            position: 'bottom',
                        }
                    }
                }
            });
        }
    }

    // Initialize analytics charts
    function initializeAnalyticsCharts() {
        // Utilization Trend Chart 
        const utilizationCtx = document.getElementById('utilizationTrendChart');

        if (utilizationCtx && !charts.utilization) {
            const utilizationTrends = assetStatistics.utilization_trends || {};
            const labels = utilizationTrends.labels || ['Week 1', 'Week 2', 'Week 3', 'Week 4'];
            const data = utilizationTrends.data || [0, 0, 0, 0];

            // The data might be legitimately zero during initial weeks
            $('#utilizationNoData').hide();
            $('#utilizationTrendChart').show();

            charts.utilization = new Chart(utilizationCtx, {
                type: 'bar',
                data: {
                    labels: labels,
                    datasets: [{
                        label: 'Utilization %',
                        data: data,
                        backgroundColor: data.map(value => {
                            if (value >= 90) return 'rgba(92, 184, 92, 0.8)'; // Green for high utilization
                            if (value >= 70) return 'rgba(240, 173, 78, 0.8)'; // Orange for medium
                            return 'rgba(217, 83, 79, 0.8)'; // Red for low utilization
                        }),
                        borderColor: data.map(value => {
                            if (value >= 90) return '#5cb85c';
                            if (value >= 70) return '#f0ad4e';
                            return '#d9534f';
                        }),
                        borderWidth: 1
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        title: {
                            display: true,
                            text: 'Asset Utilization Trends (Last 4 Weeks)'
                        },
                        legend: {
                            display: false
                        }
                    },
                    scales: {
                        y: {
                            beginAtZero: true,
                            max: 100,
                            title: {
                                display: true,
                                text: 'Utilization %'
                            }
                        },
                        x: {
                            title: {
                                display: true,
                                text: 'Time Period'
                            }
                        }
                    }
                }
            });
        }

        // Maintenance Cost Chart
        const maintenanceCtx = document.getElementById('maintenanceCostChart');
        if (maintenanceCtx && !charts.maintenance) {
            const maintenanceAnalysis = assetStatistics.maintenance_cost_analysis || {};
            const labels = maintenanceAnalysis.labels || ['Q1', 'Q2', 'Q3', 'Q4'];
            const plannedData = maintenanceAnalysis.planned || [0, 0, 0, 0];
            const emergencyData = maintenanceAnalysis.emergency || [0, 0, 0, 0];

            // Check if we have meaningful maintenance cost data
            const hasPlannedData = plannedData.some(value => value > 0);
            const hasEmergencyData = emergencyData.some(value => value > 0);
            const hasMeaningfulData = hasPlannedData || hasEmergencyData;

            if (!hasMeaningfulData) {
                // Clear the loading state from canvas
                const ctx = maintenanceCtx.getContext('2d');
                ctx.clearRect(0, 0, maintenanceCtx.width, maintenanceCtx.height);

                // Show no data message
                $('#maintenanceCostChart').hide();
                $('#maintenanceNoData').show();
                // console.log('No maintenance cost data available, showing fallback message');
                // Create a placeholder chart to mark it as initialized
                charts.maintenance = { isPlaceholder: true };
            } else {
                // Hide no data message and show chart
                $('#maintenanceNoData').hide();
                $('#maintenanceCostChart').show();

                charts.maintenance = new Chart(maintenanceCtx, {
                    type: 'line',
                    data: {
                        labels: labels,
                        datasets: [{
                            label: 'Planned Maintenance',
                            data: plannedData,
                            borderColor: '#5cb85c',
                            backgroundColor: 'rgba(92, 184, 92, 0.1)',
                            tension: 0.4,
                            fill: true
                        }, {
                            label: 'Emergency Repairs',
                            data: emergencyData,
                            borderColor: '#d9534f',
                            backgroundColor: 'rgba(217, 83, 79, 0.1)',
                            tension: 0.4,
                            fill: true
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        plugins: {
                            title: {
                                display: true,
                                text: 'Maintenance Cost Analysis (Last 4 Quarters)'
                            },
                            legend: {
                                position: 'top'
                            }
                        },
                        scales: {
                            y: {
                                beginAtZero: true,
                                title: {
                                    display: true,
                                    text: 'Cost (' + currencyCode + ')'
                                },
                                ticks: {
                                    callback: function (value) {
                                        return currencyCode + value.toLocaleString();
                                    }
                                }
                            },
                            x: {
                                title: {
                                    display: true,
                                    text: 'Quarter'
                                }
                            }
                        },
                        elements: {
                            point: {
                                radius: 6,
                                hoverRadius: 8
                            }
                        }
                    }
                });
            }
        }

        // Asset Lifecycle Chart
        const lifecycleCtx = document.getElementById('lifecycleChart');
        if (lifecycleCtx && !charts.lifecycle) {
            // Try to get lifecycle data from backend
            const lifecycleData = assetStatistics.lifecycle_distribution || null;
            let labels, data, chartTitle;

            if (lifecycleData && lifecycleData.data && lifecycleData.data.some(v => v > 0)) {
                // Use data if available
                labels = lifecycleData.labels;
                data = lifecycleData.data;
                chartTitle = 'Asset Age Distribution';
                $('#lifecycleNoData').hide();
                $('#lifecycleChart').show();

                // console.log('Using lifecycle data:', lifecycleData);
            } else {
                // Check if we have any assets at all
                const totalAssets = assetStatistics.total || 0;
                if (totalAssets === 0) {
                    // Clear the loading state from canvas
                    const ctx = lifecycleCtx.getContext('2d');
                    ctx.clearRect(0, 0, lifecycleCtx.width, lifecycleCtx.height);

                    // Show no data message
                    $('#lifecycleChart').hide();
                    $('#lifecycleNoData').show();
                    // console.log('No assets available for lifecycle chart, showing fallback message');
                    charts.lifecycle = { isPlaceholder: true };
                    return; // Exit early to avoid creating chart
                } else {
                    // Fallback to zero if no data available
                    labels = ['New (0-1yr)', 'Good (1-3yr)', 'Aging (3-5yr)', 'End of Life (5yr+)'];
                    data = [
                        Math.floor(0),
                        Math.floor(0),
                        Math.floor(0),
                        Math.floor(0)
                    ];
                    chartTitle = 'Asset Age Distribution';
                    $('#lifecycleNoData').hide();
                    $('#lifecycleChart').show();

                    // console.log('Using demo lifecycle data for', totalAssets, 'assets');
                }
            }

            // Create the chart
            charts.lifecycle = new Chart(lifecycleCtx, {
                type: 'pie',
                data: {
                    labels: labels,
                    datasets: [{
                        data: data,
                        backgroundColor: [
                            '#5cb85c', // Green for New
                            '#5bc0de', // Light Blue for Good
                            '#f0ad4e', // Orange for Aging
                            '#d9534f'  // Red for End of Life
                        ],
                        borderWidth: 2,
                        borderColor: '#fff'
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        title: {
                            display: true,
                            text: chartTitle,
                            font: {
                                size: 14,
                                weight: 'bold'
                            }
                        },
                        legend: {
                            position: 'bottom',
                            labels: {
                                padding: 15,
                                usePointStyle: true,
                                font: {
                                    size: 12
                                }
                            }
                        },
                        tooltip: {
                            callbacks: {
                                label: function (context) {
                                    const label = context.label || '';
                                    const value = context.parsed;
                                    const total = context.dataset.data.reduce((a, b) => a + b, 0);
                                    const percentage = total > 0 ? Math.round((value / total) * 100) : 0;
                                    return label + ': ' + value + ' assets (' + percentage + '%)';
                                }
                            }
                        }
                    }
                }
            });

            console.log('Asset Lifecycle chart created successfully');
        }
    }

    // Initialize map
    function initializeMap() {
        if (!document.getElementById('assetMap')) return;

        // Initialize Leaflet map if not already initialized
        if (!assetMap) {
            assetMap = L.map('assetMap').setView([40.7128, -74.0060], 10); // Default to NYC

            // Add tile layer
            var s = String.fromCharCode(123) + 's' + String.fromCharCode(125);
            var z = String.fromCharCode(123) + 'z' + String.fromCharCode(125);
            var x = String.fromCharCode(123) + 'x' + String.fromCharCode(125);
            var y = String.fromCharCode(123) + 'y' + String.fromCharCode(125);
            var tileUrl = 'https://' + s + '.tile.openstreetmap.org/' + z + '/' + x + '/' + y + '.png';
            L.tileLayer(tileUrl, {
                attribution: '© OpenStreetMap contributors'
            }).addTo(assetMap);
        }

        // Load asset locations from database using currentAssets
        loadAssetLocations();
    }

    // Load asset locations from database
    function loadAssetLocations() {
        // Use currentAssets array instead of making a separate AJAX call
        let hasLocations = false;
        
        // Check if we have assets in the currentAssets array
        if (Array.isArray(currentAssets) && currentAssets.length > 0) {
            currentAssets.forEach(function (asset) {
                // Check if we have real lat/lng values
                if (asset.lat && asset.lng && !isNaN(parseFloat(asset.lat)) && !isNaN(parseFloat(asset.lng))) {
                    hasLocations = true;
                    const statusClass = asset.status === 'active' ? 'success' :
                        asset.status === 'maintenance' ? 'warning' : 'danger';

                    // Use actual lat/lng from the asset data
                    const marker = L.marker([parseFloat(asset.lat), parseFloat(asset.lng)]).addTo(assetMap);
                    marker.bindPopup(
                        '<div class="location-info">' +
                        '<h5>' + asset.name + '</h5>' +
                        '<p><strong>ID:</strong> ' + asset.asset_id + '</p>' +
                        '<p><strong>Type:</strong> ' + asset.category + '</p>' +
                        '<p><strong>Location:</strong> ' + (asset.location || '-') + '</p>' +
                        '<p><strong>Status:</strong> <span class="label label-' + statusClass + '">' + asset.status + '</span></p>' +
                        '</div>'
                    );
                }
            });
        }
    }

    // Load asset statistics
    function loadAssetStatistics() {
        // Show loading state
        $.ajax({
            url: '?_route=plugin/asset_statistics',
            method: 'GET',
            timeout: 10000, // 10 second timeout
            success: function (response) {
                // console.log('Asset statistics response:', response);
                if (response.success && response.data) {
                    const stats = response.data;
                    assetStatistics = stats; // Store globally for use in charts
                    console.log('Utilization trends data:', stats.utilization_trends);

                    $('#totalAssets').text(stats.total || 0);
                    $('#activeAssets').text(stats.active || 0);
                    $('#maintenanceAssets').text(stats.maintenance || 0);
                    $('#criticalAssets').text(stats.critical || 0);

                    // Update additional metrics
                    $('#totalValue').text(currencyCode + (stats.total_value || 0).toLocaleString());
                    $('#monthlyMaintenanceCost').text(currencyCode + (stats.monthly_maintenance || 0).toLocaleString());
                    $('#avgUptime').text((stats.avg_uptime || 0) + '%');

                    // Update utilization circle
                    const utilization = stats.utilization || 0;
                    $('#utilizationCircle').text(utilization + '%');
                    updateUtilizationColor(utilization);

                    // Refresh charts with new data if they exist
                    destroyExistingCharts();

                    // Initialize all charts with real data
                    initializeCharts();
                    initializeAnalyticsCharts();

                    // Re-initialize dashboard charts if dashboard is active
                    if ($('#dashboard').hasClass('active')) {
                        initializeDashboardCharts();
                    }

                    // Update maintenance insights
                    updateMaintenanceInsights();

                    // Update performance chart summary
                    updatePerformanceChartSummary();
                } else {
                    handleStatisticsError('Invalid response format');
                }
            },
            error: function (xhr, status, error) {
                console.error('Asset statistics error:', error);
                handleStatisticsError(error);
            }
        });
    }

    // Handle statistics loading errors
    function handleStatisticsError(error) {
        // console.error('Failed to load asset statistics:', error);

        // Show error in charts
        $('.chart-container canvas').each(function () {
            const ctx = this.getContext('2d');
            ctx.fillStyle = '#f8f9fa';
            ctx.fillRect(0, 0, this.width, this.height);
            ctx.fillStyle = '#dc3545';
            ctx.font = '14px Arial';
            ctx.textAlign = 'center';
            ctx.fillText('Error loading data', this.width / 2, this.height / 2 - 10);
            ctx.fillText('Click to retry', this.width / 2, this.height / 2 + 10);
        });

        // Set fallback data
        $('#totalAssets').text('0');
        $('#activeAssets').text('0');
        $('#maintenanceAssets').text('0');
        $('#criticalAssets').text('0');
        $('#totalValue').text(currencyCode + '0');
        $('#monthlyMaintenanceCost').text(currencyCode + '0');
        $('#avgUptime').text('0%');
        $('#utilizationCircle').text('0%');

        assetStatistics = {
            total: 0,
            active: 0,
            maintenance: 0,
            critical: 0,
            total_value: 0,
            monthly_maintenance: 0,
            utilization: 0,
            avg_uptime: 0,
            by_category: [],
            by_location: [],
            by_status: [],
            performance_history: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                active: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                maintenance: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
            },
            utilization_trends: {
                labels: ['Week 1', 'Week 2', 'Week 3', 'Week 4'],
                data: [0, 0, 0, 0]
            },
            maintenance_cost_analysis: {
                labels: ['Q1', 'Q2', 'Q3', 'Q4'],
                planned: [0, 0, 0, 0],
                emergency: [0, 0, 0, 0]
            }
        };
    }

    // Destroy existing charts
    function destroyExistingCharts() {
        Object.keys(charts).forEach(function (key) {
            if (charts[key]) {
                charts[key].destroy();
                charts[key] = null;
            }
        });
    }

    // Update maintenance insights with real data
    function updateMaintenanceInsights() {
        const analysis = assetStatistics.maintenance_cost_analysis || {};
        const plannedData = analysis.planned || [0, 0, 0, 0];
        const emergencyData = analysis.emergency || [0, 0, 0, 0];

        // Current quarter cost (last quarter in the data)
        const currentPlanned = plannedData[plannedData.length - 1] || 0;
        const currentEmergency = emergencyData[emergencyData.length - 1] || 0;
        const currentQuarterTotal = currentPlanned + currentEmergency;

        $('#currentQuarterCost').text(currencyCode + currentQuarterTotal.toLocaleString());

        // Planned vs Emergency ratio
        let ratio = '-';
        if (currentQuarterTotal > 0) {
            const plannedPercentage = Math.round((currentPlanned / currentQuarterTotal) * 100);
            ratio = plannedPercentage + '% Planned / ' + (100 - plannedPercentage) + '% Emergency';
        }
        $('#maintenanceRatio').text(ratio);

        // Cost trend (compare current quarter with previous)
        let trend = '-';
        let trendClass = 'stable';
        if (plannedData.length >= 2 && emergencyData.length >= 2) {
            const previousTotal = (plannedData[plannedData.length - 2] || 0) + (emergencyData[emergencyData.length - 2] || 0);
            if (currentQuarterTotal > previousTotal) {
                trend = '↑ Increasing';
                trendClass = 'up';
            } else if (currentQuarterTotal < previousTotal) {
                trend = '↓ Decreasing';
                trendClass = 'down';
            } else {
                trend = '→ Stable';
                trendClass = 'stable';
            }
        }

        const trendElement = $('#costTrend');
        trendElement.removeClass('up down stable').addClass(trendClass);
        trendElement.text(trend);
    }

    // Update performance chart summary with contextual data
    function updatePerformanceChartSummary() {
        const stats = assetStatistics;
        const performanceHistory = stats.performance_history || {};
        const activeData = performanceHistory.registered || [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        const maintenanceData = performanceHistory.maintenance || [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

        // Current active assets
        const currentActive = stats.active || 0;
        $('#currentActiveAssets').text(currentActive);

        // This month's maintenance activities
        const currentMonth = new Date().getMonth();
        const thisMonthMaintenance = maintenanceData[currentMonth] || 0;
        $('#monthlyMaintenance').text(thisMonthMaintenance + ' activities');

        // Asset health trend (compare last 2 months)
        let healthTrend = 'Stable';
        let trendClass = 'trend-neutral';

        if (activeData.length >= 2 && maintenanceData.length >= 2) {
            const currentActiveCount = activeData[activeData.length - 1];
            const previousActiveCount = activeData[activeData.length - 2];
            const currentMaintenanceCount = maintenanceData[maintenanceData.length - 1];
            const previousMaintenanceCount = maintenanceData[maintenanceData.length - 2];

            // Health improves if more assets are active and less maintenance is needed
            const activeChange = currentActiveCount - previousActiveCount;
            const maintenanceChange = currentMaintenanceCount - previousMaintenanceCount;

            if (activeChange > 0 && maintenanceChange <= 0) {
                healthTrend = '↗ Improving';
                trendClass = 'trend-positive';
            } else if (activeChange < 0 || maintenanceChange > 0) {
                healthTrend = '↘ Declining';
                trendClass = 'trend-negative';
            } else {
                healthTrend = '→ Stable';
                trendClass = 'trend-neutral';
            }
        }

        const healthElement = $('#healthTrend');
        healthElement.removeClass('trend-positive trend-negative trend-neutral').addClass(trendClass);
        healthElement.text(healthTrend);
    }

    // Update utilization circle color based on percentage
    function updateUtilizationColor(percentage) {
        const circle = $('#utilizationCircle');
        if (percentage >= 90) {
            circle.css('background-color', '#5cb85c'); // Green
        } else if (percentage >= 70) {
            circle.css('background-color', '#f0ad4e'); // Orange
        } else {
            circle.css('background-color', '#d9534f'); // Red
        }
    }

    // Generate unique asset ID based on category
    function generateAssetId() {
        $('#assetCategory').change(function () {
            const category = $(this).val();
            const prefixes = {
                'network': 'NET',
                'customer': 'CPE',
                'infrastructure': 'INF',
                'vehicle': 'VEH',
                'tool': 'TL'
            };

            if (category && prefixes[category]) {
                const timestamp = Date.now().toString().slice(-6);
                const assetId = prefixes[category] + '-' + timestamp;
                $('#assetId').val(assetId);
            } else {
                $('#assetId').val('');
            }
        });
    }

    // Save new asset
    function saveAsset() {
        const assetData = {
            asset_id: $('#assetId').val().trim(),
            category: $('#assetCategory').val(),
            name: $('#assetName').val().trim(),
            brand_model: $('#brandModel').val().trim(),
            serial_number: $('#serialNumber').val().trim(),
            purchase_date: $('#purchaseDate').val(),
            purchase_cost: $('#purchaseCost').val(),
            supplier: $('#supplier').val().trim(),
            location: $('#location').val().trim(),
            lat: $('#lat').val(),
            lng: $('#lng').val(),
            status: $('#status').val(),
            warranty_expiry: $('#warrantyExpiry').val(),
            assigned_to: $('#assignedTo').val().trim(),
            deployed_date: $('#deployedDate').val() || 'null',
            description: $('#description').val().trim()
        };

        // Validate required fields
        if (!assetData.category) {
            Swal.fire({
                title: "{Lang::T('Validation Error')}",
                text: "{Lang::T('Please select an asset category')}",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: "{Lang::T('Try Again')}",
                cancelButtonText: 'Cancel'
            });
            $('#assetCategory').focus();
            return;
        }

        if (!assetData.name) {
            Swal.fire({
                title: "{Lang::T('Validation Error')}",
                text: "{Lang::T('Please enter an asset name')}",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: "{Lang::T('Try Again')}",
                cancelButtonText: 'Cancel'
            });
            $('#assetName').focus();
            return;
        }

        if (!assetData.asset_id) {
            Swal.fire({
                title: "{Lang::T('Validation Error')}",
                text: "{Lang::T('Asset ID is required. Please select a category first to generate an ID.')}",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: "{Lang::T('Try Again')}",
                cancelButtonText: 'Cancel'
            });
            $('#assetCategory').focus();
            return;
        }

        // Show loading indicator
        const saveButton = $('button[onclick="saveAsset()"]');
        const originalText = saveButton.text();
        saveButton.text('Saving...').prop('disabled', true);

        // console.log('Sending asset data:', assetData);

        // Send data to server
        $.ajax({
            url: '?_route=plugin/asset_add',
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(assetData),
            dataType: 'json',
            success: function (response) {
                console.log('Server response:', response);

                if (response && response.success) {
                    $('#addAssetModal').modal('hide');
                    Swal.fire({
                        title: "{Lang::T('Successful')}",
                        text: "{Lang::T('Asset saved successfully!')}",
                        icon: 'success',
                        showCancelButton: true,
                        confirmButtonText: "{Lang::T('Done')}",
                        cancelButtonText: 'Cancel'
                    });
                    // alert('Asset saved successfully!');

                    // Reset form
                    $('#addAssetForm')[0].reset();
                    $('#assetId').val('');

                    // Reload data
                    loadAssetStatistics();
                    loadAssets();
                } else {
                    const errorMessage = response && response.message ? response.message : 'Unknown error occurred';
                    Swal.fire({
                        title: "{Lang::T('Error')}",
                        text: "{Lang::T('An error occurred while saving the asset. Error: ')}" + errorMessage,
                        icon: 'error',
                        showCancelButton: true,
                        confirmButtonText: "{Lang::T('Try Again')}",
                        cancelButtonText: 'Cancel'
                    });
                    // alert('Error: ' + errorMessage);
                }
            },
            error: function (xhr, status, error) {
                console.error('AJAX Error:', xhr, status, error);
                console.error('Response Text:', xhr.responseText);

                let errorMessage = '{Lang::T('An error occurred while saving the asset')}';

                if (xhr.responseText) {
                    try {
                        const errorResponse = JSON.parse(xhr.responseText);
                        if (errorResponse.message) {
                            errorMessage = errorResponse.message;
                        }
                    } catch (e) {
                        errorMessage = 'Server error: ' + xhr.responseText.substring(0, 100);
                    }
                }

                alert(errorMessage);
            },
            complete: function () {
                // Restore button state
                saveButton.text(originalText).prop('disabled', false);
            }
        });
    }

    // View asset details
    function viewAsset(assetId) {
        // console.log('Viewing asset:', assetId);
        $.ajax({
            url: '?_route=plugin/asset_view&asset_id=' + encodeURIComponent(assetId),
            method: 'GET',
            dataType: 'json',
            success: function (response) {
                console.log('Asset view response:', response);

                if (response && response.success) {
                    const asset = response.asset;
                    const maintenance = response.maintenance || [];
                    const assignments = response.assignments || [];

                    let maintenanceHTML = '';
                    if (maintenance.length > 0) {
                        maintenance.forEach(function (m) {
                            maintenanceHTML +=
                                '<tr>' +
                                '<td>' + (m.maintenance_date || '-') + '</td>' +
                                '<td>' + (m.maintenance_type || '-') + '</td>' +
                                '<td>' + (m.description || '-') + '</td>' +
                                '<td>' + (m.technician || '-') + '</td>' +
                                '<td>' + currencyCode + (m.cost || '0') + '</td>' +
                                '</tr>';
                        });
                    } else {
                        maintenanceHTML = '<tr><td colspan="5">' + '{Lang::T('No maintenance records found')}' + '</td></tr>';
                    }

                    const assetDetails =
                        '<div class="row">' +
                        '<div class="col-md-6">' +
                        '<h5>Basic Information</h5>' +
                        '<table class="table table-bordered">' +
                        '<tr><th>Asset ID:</th><td>' + (asset.asset_id || '-') + '</td></tr>' +
                        '<tr><th>Category:</th><td>' + (asset.category || '-') + '</td></tr>' +
                        '<tr><th>Name:</th><td>' + (asset.name || '-') + '</td></tr>' +
                        '<tr><th>Brand/Model:</th><td>' + (asset.brand_model || '-') + '</td></tr>' +
                        '<tr><th>Serial Number:</th><td>' + (asset.serial_number || '-') + '</td></tr>' +
                        '<tr><th>Status:</th><td><span class="label label-' + (asset.status === 'active' ? 'success' : 'warning') + '">' + (asset.status || '-') + '</span></td></tr>' +
                        '</table>' +
                        '</div>' +
                        '<div class="col-md-6">' +
                        '<h5>Location & Assignment</h5>' +
                        '<table class="table table-bordered">' +
                        '<tr><th>Location:</th><td>' + (asset.location || '-') + '</td></tr>' +
                        '<tr><th>IP Address:</th><td>' + (asset.ip_address || '-') + '</td></tr>' +
                        '<tr><th>Assigned To:</th><td>' + (asset.assigned_to || '-') + '</td></tr>' +
                        '<tr><th>Purchase Date:</th><td>' + (asset.purchase_date || '-') + '</td></tr>' +
                        '<tr><th>Purchase Cost:</th><td>' + currencyCode + (asset.purchase_cost || '0') + '</td></tr>' +
                        '<tr><th>Warranty Expiry:</th><td>' + (asset.warranty_expiry || '-') + '</td></tr>' +
                        '</table>' +
                        '</div>' +
                        '</div>' +
                        '<div class="row">' +
                        '<div class="col-md-12">' +
                        '<h5>Maintenance History</h5>' +
                        '<table class="table table-striped">' +
                        '<thead>' +
                        '<tr>' +
                        '<th>Date</th>' +
                        '<th>Type</th>' +
                        '<th>Description</th>' +
                        '<th>Technician</th>' +
                        '<th>Cost</th>' +
                        '</tr>' +
                        '</thead>' +
                        '<tbody>' +
                        maintenanceHTML +
                        '</tbody>' +
                        '</table>' +
                        '</div>' +
                        '</div>';

                    $('#assetDetailsContent').html(assetDetails);
                    $('#assetDetailsModal').modal('show');
                } else {
                    const errorMessage = response && response.message ? response.message : 'Unknown error occurred';
                    Swal.fire({
                        title: '{Lang::T('Error')}',
                        text: '{Lang::T('Error loading asset details: ')}' + errorMessage,
                        icon: 'error',
                        confirmButtonText: '{Lang::T('OK')}'
                    });
                }
            },
            error: function (xhr, status, error) {
                console.error('Asset view AJAX error:', xhr, status, error);
                console.error('Response text:', xhr.responseText);

                Swal.fire({
                    title: '{Lang::T('Error')}',
                    text: '{Lang::T('An error occurred while loading asset details')}',
                    icon: 'error',
                    confirmButtonText: '{Lang::T('OK')}'
                });
            }
        });
    }

    // Edit asset
    function editAsset(assetId) {
        // Fetch asset data and prefill modal for editing
        $.ajax({
            url: '?_route=plugin/asset_view&asset_id=' + encodeURIComponent(assetId),
            method: 'GET',
            dataType: 'json',
            success: function (response) {
                if (response && response.success) {
                    const asset = response.asset;
                    // Prefill modal fields
                    $('#assetCategory').val(asset.category).prop('disabled', true);
                    $('#assetId').val(asset.asset_id).prop('readonly', true);
                    $('#assetName').val(asset.name);
                    $('#brandModel').val(asset.brand_model);
                    $('#serialNumber').val(asset.serial_number);
                    $('#purchaseDate').val(asset.purchase_date);
                    $('#purchaseCost').val(asset.purchase_cost);
                    $('#supplier').val(asset.supplier);
                    $('#location').val(asset.location);
                    $('#lat').val(asset.lat);
                    $('#lng').val(asset.lng);
                    $('#status').val(asset.status);
                    $('#warrantyExpiry').val(asset.warranty_expiry);
                    $('#assignedTo').val(asset.assigned_to);
                    $('#deployedDate').val(asset.deployed_date);
                    $('#description').val(asset.description);

                    // Change modal title and button for edit (escape translation curly braces)
                    $('#addAssetModal .modal-title').text("{Lang::T('Edit Asset')}");
                    $('#addAssetModal .btn-primary').text("{Lang::T('Update Asset')}").attr('onclick', 'updateAsset()');

                    // Show modal
                    $('#addAssetModal').modal('show');
                } else {
                    Swal.fire({
                        title: "{Lang::T('Error')}",
                        text: "{Lang::T('Failed to load asset data for editing')}",
                        icon: 'error',
                        confirmButtonText: "{Lang::T('OK')}"
                    });
                }
            },
            error: function () {
                Swal.fire({
                    title: "{Lang::T('Error')}",
                    text: "{Lang::T('An error occurred while loading asset data')}",
                    icon: 'error',
                    confirmButtonText: "{Lang::T('OK')}"
                });
            }
        });
    }

    // Update asset (edit mode)
    function updateAsset() {
        const assetData = {
            asset_id: $('#assetId').val().trim(),
            category: $('#assetCategory').val(),
            name: $('#assetName').val().trim(),
            brand_model: $('#brandModel').val().trim(),
            serial_number: $('#serialNumber').val().trim(),
            purchase_date: $('#purchaseDate').val(),
            purchase_cost: $('#purchaseCost').val(),
            supplier: $('#supplier').val().trim(),
            location: $('#location').val().trim(),
            lat: $('#lat').val(),
            lng: $('#lng').val(),
            status: $('#status').val(),
            warranty_expiry: $('#warrantyExpiry').val(),
            assigned_to: $('#assignedTo').val().trim(),
            deployed_date: $('#deployedDate').val() || 'null',
            description: $('#description').val().trim()
        };

        // Validate required fields
        if (!assetData.category) {
            Swal.fire({
                title: "{Lang::T('Validation Error')}",
                text: "{Lang::T('Please select an asset category')}",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: "{Lang::T('Try Again')}",
                cancelButtonText: 'Cancel'
            });
            $('#assetCategory').focus();
            return;
        }
        if (!assetData.name) {
            Swal.fire({
                title: "{Lang::T('Validation Error')}",
                text: "{Lang::T('Please enter an asset name')}",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: "{Lang::T('Try Again')}",
                cancelButtonText: 'Cancel'
            });
            $('#assetName').focus();
            return;
        }
        if (!assetData.asset_id) {
            Swal.fire({
                title: "{Lang::T('Validation Error')}",
                text: "{Lang::T('Asset ID is required. Please select a category first to generate an ID.')}",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: "{Lang::T('Try Again')}",
                cancelButtonText: 'Cancel'
            });
            $('#assetCategory').focus();
            return;
        }

        // Show loading indicator
        const updateButton = $('#addAssetModal .btn-primary');
        const originalText = updateButton.text();
        updateButton.text('Updating...').prop('disabled', true);

        // Send update to backend
        $.ajax({
            url: '?_route=plugin/asset_edit',
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(assetData),
            dataType: 'json',
            success: function (response) {
                if (response && response.success) {
                    $('#addAssetModal').modal('hide');
                    Swal.fire({
                        title: "{Lang::T('Successful')}",
                        text: "{Lang::T('Asset updated successfully!')}",
                        icon: 'success',
                        showCancelButton: true,
                        confirmButtonText: "{Lang::T('Done')}",
                        cancelButtonText: 'Cancel'
                    });
                    // Reset form and reload data
                    $('#addAssetForm')[0].reset();
                    $('#assetId').val('');
                    // Restore modal to add mode
                    $('#addAssetModal .modal-title').text('{Lang::T('Add New Asset')}');
                    $('#addAssetModal .btn-primary').text('{Lang::T('Save Asset')}').attr('onclick', 'saveAsset()');
                    $('#assetCategory').prop('disabled', false);
                    $('#assetId').prop('readonly', true);
                    loadAssetStatistics();
                    loadAssets();
                    refresh();
                } else {
                    const errorMessage = response && response.message ? response.message : 'Unknown error occurred';
                    Swal.fire({
                        title: "{Lang::T('Error')}",
                        text: "{Lang::T('An error occurred while updating the asset. Error: ')}" + errorMessage,
                        icon: 'error',
                        showCancelButton: true,
                        confirmButtonText: "{Lang::T('Try Again')}",
                        cancelButtonText: 'Cancel'
                    });
                }
            },
            error: function (xhr, status, error) {
                let errorMessage = '{Lang::T('An error occurred while updating the asset')}';
                if (xhr.responseText) {
                    try {
                        const errorResponse = JSON.parse(xhr.responseText);
                        if (errorResponse.message) {
                            errorMessage = errorResponse.message;
                        }
                    } catch (e) {
                        errorMessage = 'Server error: ' + xhr.responseText.substring(0, 100);
                    }
                }
                Swal.fire({
                    title: '{Lang::T('Error')}',
                    text: errorMessage,
                    icon: 'error',
                    showCancelButton: true,
                    confirmButtonText: '{Lang::T('Try Again')}',
                    cancelButtonText: 'Cancel'
                });
            },
            complete: function () {
                updateButton.text(originalText).prop('disabled', false);
            }
        });
    }

    // Delete asset
    function deleteAsset(assetId) {
        Swal.fire({
            title: '{Lang::T('Are you sure?')}',
            text: '{Lang::T('This will permanently delete the asset from the system.')}',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            cancelButtonColor: '#3085d6',
            confirmButtonText: '{Lang::T('Yes, delete it!')}',
            cancelButtonText: '{Lang::T('Cancel')}'
        }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        url: '?_route=plugin/asset_delete',
                        method: 'POST',
                        data: { asset_id: assetId },
                        success: function (response) {
                            if (response.success) {
                                Swal.fire({
                                    title: '{Lang::T('Successful')}',
                                    text: '{Lang::T('Asset deleted successfully!')}',
                                    icon: 'success',
                                    showCancelButton: true,
                                    confirmButtonText: '{Lang::T('Done')}',
                                    cancelButtonText: 'Cancel'
                                });
                                //alert('Asset deleted successfully!');
                                loadAssetStatistics();
                                loadAssetsByCategory(currentCategory);
                            } else {
                                Swal.fire({
                                    title: '{Lang::T('Error')}',
                                    text: '{Lang::T('Error: ')} ' + response.message,
                                    icon: 'error',
                                    confirmButtonText: '{Lang::T('OK')}'
                                });
                                // alert('Error: ' + response.message);
                            }
                        },
                        error: function () {
                            Swal.fire({
                                title: '{Lang::T('Error')}',
                                text: '{Lang::T('An error occurred while deleting the asset')}',
                                icon: 'error',
                                confirmButtonText: '{Lang::T('OK')}'
                            });
                            //alert('An error occurred while deleting the asset');
                        }
                    });
                }
            });
    }

    // Return customer equipment
    function returnEquipment(assetId) {
                    if (confirm('Mark this equipment as returned?')) {
                        alert('Equipment ' + assetId + ' marked as returned');
                        loadAssets();
                    }
                }

    // Export assets
    function exportAssets() {
                    window.location.href = '?_route=plugin/asset_export';
                }

    // Load assets data
    function loadAssets() {
        $.ajax({
            url: '?_route=plugin/asset_list',
            method: 'GET',
            success: function (response) {
                if (response.success) {
                    currentAssets = response.data;
                    //console.log('Loaded ' + currentAssets.length + ' assets from database');
                    
                    // Update location and category counts
                    updateLocationCounts();
                    
                    // Refresh the map if it's initialized
                    if (assetMap) {
                        // Clear existing markers
                        assetMap.eachLayer(function (layer) {
                            if (layer instanceof L.Marker) {
                                assetMap.removeLayer(layer);
                            }
                        });
                        
                        // Reload asset locations on the map
                        loadAssetLocations();
                    }
                }
            },
            error: function () {
                //console.log('Error loading assets data');
                currentAssets = [];
            }
        });
    }
    
    // Calculate and update location counts
    function updateLocationCounts() {
        // Skip if no assets loaded
        if (!currentAssets || !currentAssets.length) return;
        
        // Count assets by location
        const locationCounts = {};
        const categoryCounts = {
            'network': 0,
            'customer': 0,
            'infrastructure': 0,
            'vehicles': 0,
            'tools': 0
        };
        
        // Coverage zone tracking
        const coverageZones = {
            'zoneA': { count: 0, uptime: 0 },
            'zoneB': { count: 0, uptime: 0 },
            'zoneC': { count: 0, uptime: 0 }
        };
        
        // Group the standard locations for display
        const locationMapping = {
            'main office': 'main-office',
            'headquarters': 'main-office',
            'hq': 'main-office',
            'office': 'main-office',
            'tower': 'tower',
            'tower site': 'tower',
            'tower a': 'tower-a',
            'tower b': 'tower-b',
            'tower c': 'tower-c',
            'customer': 'customer',
            'customer premises': 'customer',
            'client site': 'customer',
            'mobile': 'mobile',
            'mobile units': 'mobile',
            'vehicle': 'mobile'
        };
        
        // Map for determining coverage zones based on location
        const coverageMapping = {
            'main-office': 'zoneA',
            'tower-a': 'zoneA',
            'tower-b': 'zoneB',
            'tower-c': 'zoneB',
            'customer': 'zoneC',
            'mobile': 'zoneB'
        };
        
        // Process each asset
        currentAssets.forEach(function(asset) {
            // Count by category
            let category = asset.category || 'other';
            if (category === 'network') categoryCounts['network']++;
            else if (category === 'customer') categoryCounts['customer']++;
            else if (category === 'infrastructure') categoryCounts['infrastructure']++;
            else if (category === 'vehicle') categoryCounts['vehicles']++;
            else if (category === 'tool') categoryCounts['tools']++;
            
            // Count by location
            if (asset.location) {
                const location = asset.location.toLowerCase();
                let locationKey = 'other'; // default
                
                // Check if this location maps to one of our standard locations
                for (const [keyword, key] of Object.entries(locationMapping)) {
                    if (location.includes(keyword)) {
                        locationKey = key;
                        break;
                    }
                }
                
                // Initialize if not exist
                if (!locationCounts[locationKey]) {
                    locationCounts[locationKey] = {
                        count: 0,
                        name: asset.location,
                        key: locationKey
                    };
                }
                
                // Increment count
                locationCounts[locationKey].count++;
                
                // Use the most frequent name variation as the display name
                if (!locationCounts[locationKey].names) {
                    locationCounts[locationKey].names = {};
                }
                
                if (!locationCounts[locationKey].names[asset.location]) {
                    locationCounts[locationKey].names[asset.location] = 1;
                } else {
                    locationCounts[locationKey].names[asset.location]++;
                }
                
                // Find the most frequent name
                let maxCount = 0;
                for (const [name, count] of Object.entries(locationCounts[locationKey].names)) {
                    if (count > maxCount) {
                        locationCounts[locationKey].name = name;
                        maxCount = count;
                    }
                }
                
                // Count for coverage zones
                let zone = coverageMapping[locationKey] || 'zoneC';
                coverageZones[zone].count++;
                
                if (asset.status === 'active') {
                    coverageZones[zone].uptime++;
                }
            } else {
                // For assets with no location
                if (!locationCounts['unknown']) {
                    locationCounts['unknown'] = {
                        count: 0,
                        name: 'Unknown Location',
                        key: 'unknown'
                    };
                }
                locationCounts['unknown'].count++;
            }
        });
        
        // Calculate coverage percentages
        const totalAssets = currentAssets.length;
        const zoneAPercentage = coverageZones.zoneA.count > 0 ? 
            Math.round((coverageZones.zoneA.uptime / coverageZones.zoneA.count) * 100) : 0;
        const zoneBPercentage = coverageZones.zoneB.count > 0 ? 
            Math.round((coverageZones.zoneB.uptime / coverageZones.zoneB.count) * 100) : 0;
        const zoneCPercentage = coverageZones.zoneC.count > 0 ? 
            Math.round((coverageZones.zoneC.uptime / coverageZones.zoneC.count) * 100) : 0;
        
        // Calculate distribution percentages for the progress bar
        const zoneADistribution = totalAssets > 0 ? (coverageZones.zoneA.count / totalAssets) * 100 : 0;
        const zoneBDistribution = totalAssets > 0 ? (coverageZones.zoneB.count / totalAssets) * 100 : 0;
        const zoneCDistribution = totalAssets > 0 ? (coverageZones.zoneC.count / totalAssets) * 100 : 0;
        
        // Update the coverage progress bar
        $('#coverage-progress .progress-bar-success').css('width', zoneADistribution + '%').attr('title', 'Zone A: ' + coverageZones.zoneA.count + ' assets');
        $('#coverage-progress .progress-bar-warning').css('width', zoneBDistribution + '%').attr('title', 'Zone B: ' + coverageZones.zoneB.count + ' assets');
        $('#coverage-progress .progress-bar-danger').css('width', zoneCDistribution + '%').attr('title', 'Zone C: ' + coverageZones.zoneC.count + ' assets');
        
        // Update coverage legend
        $('#coverage-legend').html(
            '<span><i class="fa fa-circle text-success"></i> Zone A: ' + zoneAPercentage + '%</span>' +
            '<span><i class="fa fa-circle text-warning"></i> Zone B: ' + zoneBPercentage + '%</span>' +
            '<span><i class="fa fa-circle text-danger"></i> Zone C: ' + zoneCPercentage + '%</span>'
        );
        
        // Generate HTML for locations
        let locationsHTML = '';
        
        // Add standard locations first in a specific order
        const standardLocations = [
            { key: 'main-office', icon: 'building', color: 'primary', name: 'Main Office' },
            { key: 'tower-a', icon: 'signal', color: 'info', name: 'Tower Site A' },
            { key: 'tower-b', icon: 'signal', color: 'info', name: 'Tower Site B' },
            { key: 'customer', icon: 'users', color: 'success', name: 'Customer Premises' },
            { key: 'mobile', icon: 'truck', color: 'warning', name: 'Mobile Units' }
        ];
        
        // Add standard locations with counts
        standardLocations.forEach(function(loc) {
            const count = locationCounts[loc.key] ? locationCounts[loc.key].count : 0;
            const name = locationCounts[loc.key] && locationCounts[loc.key].name ? locationCounts[loc.key].name : loc.name;
            
            locationsHTML += 
                '<div class="list-group-item location-item" data-location="' + loc.key + '" style="cursor: pointer;">' +
                    '<div class="row">' +
                        '<div class="col-xs-8">' +
                            '<i class="fa fa-' + loc.icon + ' text-' + loc.color + '"></i> ' + name +
                        '</div>' +
                        '<div class="col-xs-4 text-right">' +
                            '<span class="badge">' + count + '</span>' +
                        '</div>' +
                    '</div>' +
                '</div>';
        });
        
        // Add any other locations found in the data
        for (const [key, location] of Object.entries(locationCounts)) {
            // Skip already added standard locations
            if (standardLocations.some(std => std.key === key)) continue;
            
            // Skip unknown for now
            if (key === 'unknown') continue;
            
            locationsHTML += 
                '<div class="list-group-item location-item" data-location="' + location.key + '" style="cursor: pointer;">' +
                    '<div class="row">' +
                        '<div class="col-xs-8">' +
                            '<i class="fa fa-map-marker text-muted"></i> ' + location.name +
                        '</div>' +
                        '<div class="col-xs-4 text-right">' +
                            '<span class="badge">' + location.count + '</span>' +
                        '</div>' +
                    '</div>' +
                '</div>';
        }
        
        // Add unknown location at the end if it exists
        if (locationCounts['unknown']) {
            locationsHTML += 
                '<div class="list-group-item location-item" data-location="unknown" style="cursor: pointer;">' +
                    '<div class="row">' +
                        '<div class="col-xs-8">' +
                            '<i class="fa fa-question-circle text-muted"></i> ' + locationCounts['unknown'].name +
                        '</div>' +
                        '<div class="col-xs-4 text-right">' +
                            '<span class="badge">' + locationCounts['unknown'].count + '</span>' +
                        '</div>' +
                    '</div>' +
                '</div>';
        }
        
        // No locations case
        if (locationsHTML === '') {
            locationsHTML = '<div class="list-group-item text-center">' + '{Lang::T("No locations found")}' + '</div>';
        }
        
        // Update locations list
        $('#locationsList').html(locationsHTML);
        
        // Generate HTML for categories
        let categoriesHTML = 
            '<div class="list-group-item category-item" data-category="network">' +
                '<div class="row">' +
                    '<div class="col-xs-8">' +
                        '<i class="fa fa-wifi text-primary"></i> {Lang::T("Network Equipment")}' +
                    '</div>' +
                    '<div class="col-xs-4 text-right">' +
                        '<span class="badge">' + categoryCounts['network'] + '</span>' +
                    '</div>' +
                '</div>' +
            '</div>' +
            '<div class="list-group-item category-item" data-category="infrastructure">' +
                '<div class="row">' +
                    '<div class="col-xs-8">' +
                        '<i class="fa fa-building text-success"></i> {Lang::T("Infrastructure")}' +
                    '</div>' +
                    '<div class="col-xs-4 text-right">' +
                        '<span class="badge">' + categoryCounts['infrastructure'] + '</span>' +
                    '</div>' +
                '</div>' +
            '</div>' +
            '<div class="list-group-item category-item" data-category="vehicles">' +
                '<div class="row">' +
                    '<div class="col-xs-8">' +
                        '<i class="fa fa-truck text-warning"></i> {Lang::T("Vehicles")}' +
                    '</div>' +
                    '<div class="col-xs-4 text-right">' +
                        '<span class="badge">' + categoryCounts['vehicles'] + '</span>' +
                    '</div>' +
                '</div>' +
            '</div>' +
            '<div class="list-group-item category-item" data-category="tools">' +
                '<div class="row">' +
                    '<div class="col-xs-8">' +
                        '<i class="fa fa-wrench text-danger"></i> {Lang::T("Tools")}' +
                    '</div>' +
                    '<div class="col-xs-4 text-right">' +
                        '<span class="badge">' + categoryCounts['tools'] + '</span>' +
                    '</div>' +
                '</div>' +
            '</div>';
        
        // Update categories list
        $('#categoriesList').html(categoriesHTML);
    }

    // Load assets by category
    function loadAssetsByCategory(category) {
                    $.ajax({
                        url: '?_route=plugin/asset_list_by_category&category=' + category,
                        method: 'GET',
                        success: function (response) {
                            if (response.success) {
                                const assets = response.data;
                                populateAssetTable(category, assets);
                            }
                        },
                        error: function () {
                            console.log('Error loading assets for category: ' + category);
                        }
                    });
                }

    // Populate asset table based on category
    function populateAssetTable(category, assets) {
                    let tableId = '';
                    let tableBodyHtml = '';

                    switch (category) {
                        case 'network':
                            tableId = '#networkEquipmentTable tbody';
                            assets.forEach(function (asset) {
                                const statusClass = asset.status === 'active' ? 'success' :
                                    asset.status === 'maintenance' ? 'warning' : 'danger';
                                tableBodyHtml +=
                                    '<tr>' +
                                    '<td>' + asset.asset_id + '</td>' +
                                    '<td>' + asset.name + '</td>' +
                                    '<td>' + (asset.brand_model || '-') + '</td>' +
                                    '<td>' + (asset.serial_number || '-') + '</td>' +
                                    '<td>' + (asset.location || '-') + '</td>' +
                                    '<td><span class="label label-' + statusClass + '">' + asset.status + '</span></td>' +
                                    '<td>' + (asset.ip_address || '-') + '</td>' +
                                    '<td>' + (asset.maintenance || '-') + '</td>' +
                                    '<td>' + (asset.assignments || '-') + '</td>' +
                                    '<td>' +
                                    '<button class="btn btn-xs btn-info" onclick="viewAsset(\'' + asset.asset_id + '\')">{Lang::T('View')}</button> ' +
                                    '<button class="btn btn-xs btn-primary" onclick = "showMap(\'' + asset.asset_id + '\')" ><i class="fa fa-map-marker" aria-hidden="true"></i></button >' +
                                    '<button class="btn btn-xs btn-warning" onclick="editAsset(\'' + asset.asset_id + '\')">{Lang::T('Edit')}</button> ' +
                                    '<button class="btn btn-xs btn-danger" onclick="deleteAsset(\'' + asset.asset_id + '\')">{Lang::T('Delete')}</button>' +
                                    '</td>' +
                                    '</tr>';
                            });
                            break;

                        case 'customer':
                            tableId = '#customerEquipmentTable tbody';
                            assets.forEach(function (asset) {
                                const statusClass = asset.status === 'active' ? 'success' :
                                    asset.status === 'maintenance' ? 'warning' : 'danger';
                                tableBodyHtml +=
                                    '<tr>' +
                                    '<td>' + asset.asset_id + '</td>' +
                                    '<td>' + asset.name + '</td>' +
                                    '<td>' + (asset.assigned_to || '-') + '</td>' +
                                    '<td>' + (asset.serial_number || '-') + '</td>' +
                                    '<td>' + (asset.location || '-') + '</td>' +
                                    '<td>' + (asset.assignments || '-') + '</td>' +
                                    '<td><span class="label label-' + statusClass + '">' + asset.status + '</span></td>' +
                                    '<td>' + (asset.deployed_date || '-') + '</td>' +
                                    '<td>' + (asset.warranty_expiry || '-') + '</td>' +
                                    '<td>' +
                                    '<button class="btn btn-xs btn-info" onclick="viewAsset(\'' + asset.asset_id + '\')">{Lang::T('View')}</button> ' +
                                    '<button class="btn btn-xs btn-warning" onclick="editAsset(\'' + asset.asset_id + '\')">{Lang::T('Edit')}</button> ' +
                                    '<button class="btn btn-xs btn-danger" onclick="deleteAsset(\'' + asset.asset_id + '\')">{Lang::T('Delete')}</button>' +
                                    '<button class="btn btn-xs btn-primary" onclick = "showMap(\'' + asset.asset_id + '\')" ><i class="fa fa-map-marker" aria-hidden="true"></i></button >' +
                                    '</td>' +
                                    '</tr>';
                            });
                            break;

                        case 'infrastructure':
                            tableId = '#infrastructure tbody';
                            assets.forEach(function (asset) {
                                const statusClass = asset.status === 'active' ? 'success' :
                                    asset.status === 'maintenance' ? 'warning' : 'danger';
                                tableBodyHtml +=
                                    '<tr>' +
                                    '<td>' + asset.asset_id + '</td>' +
                                    '<td>' + asset.name + '</td>' +
                                    '<td>' + (asset.location || '-') + '</td>' +
                                    '<td>' + (asset.description || '-') + '</td>' +
                                    '<td>' + (asset.purchase_date || '-') + '</td>' +
                                    '<td><span class="label label-' + statusClass + '">' + asset.status + '</span></td>' +
                                    '<td>' + (asset.maintenance || '-') + '</td>' +
                                    '<td>' +
                                    '<button class="btn btn-xs btn-info" onclick="viewAsset(\'' + asset.asset_id + '\')">View</button> ' +
                                    '<button class="btn btn-xs btn-primary" onclick = "showMap(\'' + asset.asset_id + '\')" ><i class="fa fa-map-marker" aria-hidden="true"></i></button >' +
                                    '<button class="btn btn-xs btn-warning" onclick="editAsset(\'' + asset.asset_id + '\')">{Lang::T('Edit')}</button> ' +
                                    '<button class="btn btn-xs btn-danger" onclick="deleteAsset(\'' + asset.asset_id + '\')">{Lang::T('Delete')}</button>' +
                                    '<button class="btn btn-xs btn-warning" data-toggle="modal" data-target="#scheduleMaintenanceModal">{Lang::T('Schedule Inspection')}</button>' +
                                    '</td>' +
                                    '</tr>';
                            });
                            break;

                        case 'vehicle':
                            tableId = '#vehicles tbody';
                            assets.forEach(function (asset) {
                                const statusClass = asset.status === 'active' ? 'success' :
                                    asset.status === 'maintenance' ? 'warning' : 'danger';
                                tableBodyHtml +=
                                    '<tr>' +
                                    '<td>' + asset.asset_id + '</td>' +
                                    '<td>' + asset.name + '</td>' +
                                    '<td>' + (asset.brand_model || '-') + '</td>' +
                                    '<td>' + (asset.assigned_to || '-') + '</td>' +
                                    '<td>' + (asset.location || '-') + '</td>' +
                                    '<td><span class="label label-' + statusClass + '">' + asset.status + '</span></td>' +
                                    '<td>' +
                                    '<button class="btn btn-xs btn-info" onclick="viewAsset(\'' + asset.asset_id + '\')">{Lang::T('View')}</button> ' +
                                    '<button class="btn btn-xs btn-primary" onclick = "showMap(\'' + asset.asset_id + '\')" ><i class="fa fa-map-marker" aria-hidden="true"></i></button >' +
                                    '<button class="btn btn-xs btn-warning" onclick="editAsset(\'' + asset.asset_id + '\')">{Lang::T('Edit')}</button> ' +
                                    '<button class="btn btn-xs btn-danger" onclick="deleteAsset(\'' + asset.asset_id + '\')">{Lang::T('Delete')}</button>' +
                                    '<button class="btn btn-xs btn-warning" data-toggle="modal" data-target="#scheduleMaintenanceModal">{Lang::T('Schedule Maintenance')}</button>' +
                                    '</td>' +
                                    '</tr>';
                                });
                            break;

                        case 'tool':
                            tableId = '#tools tbody';
                            assets.forEach(function (asset) {
                                const statusClass = asset.status === 'active' ? 'success' :
                                    asset.status === 'maintenance' ? 'warning' : 'danger';
                                tableBodyHtml +=
                                    '<tr>' +
                                    '<td>' + asset.asset_id + '</td>' +
                                    '<td>' + asset.name + '</td>' +
                                    '<td>' + (asset.brand_model || '-') + '</td>' +
                                    '<td>' + (asset.location || '-') + '</td>' +
                                    '<td>' + (asset.assigned_to || '-') + '</td>' +
                                    '<td><span class="label label-' + statusClass + '">' + asset.status + '</span></td>' +
                                    '<td>' +
                                    '<button class="btn btn-xs btn-info" onclick="viewAsset(\'' + asset.asset_id + '\')">View</button> ' +
                                    '<button class="btn btn-xs btn-warning" onclick="editAsset(\'' + asset.asset_id + '\')">{Lang::T('Edit')}</button> ' +
                                        '<button class="btn btn-xs btn-danger" onclick="deleteAsset(\'' + asset.asset_id + '\')">{Lang::T('Delete')}</button>' +
                                            '</td>' +
                                            '</tr>';
                            });
                            break;
                    }

                    if (tableId) {
                        if (assets.length === 0) {
                            tableBodyHtml = '<tr><td colspan="10" class="text-center">' + '{Lang::T('No assets found in this category')}' + '</td></tr>';
                        }
                        $(tableId).html(tableBodyHtml);
                    }
                }

    // Search functionality
    $('#searchNetworkEquipment').on('keyup', function () {
                    const searchTerm = $(this).val().toLowerCase();
                    $('#networkEquipmentTable tbody tr').filter(function () {
                        $(this).toggle($(this).text().toLowerCase().indexOf(searchTerm) > -1);
                    });
                });

        $('#searchCustomerEquipment').on('keyup', function () {
            const searchTerm = $(this).val().toLowerCase();
            $('#customerEquipmentTable tbody tr').filter(function () {
                $(this).toggle($(this).text().toLowerCase().indexOf(searchTerm) > -1);
            });
        });

        // Filter functionality
        $('#filterNetworkStatus').on('change', function () {
            const status = $(this).val();
            if (status === '') {
                $('#networkEquipmentTable tbody tr').show();
            } else {
                $('#networkEquipmentTable tbody tr').hide();
                $('#networkEquipmentTable tbody tr').filter(function () {
                    return $(this).find('.label').text().toLowerCase().indexOf(status) > -1;
                }).show();
            }
        });

        $('#filterCustomerStatus').on('change', function () {
            const status = $(this).val();
            if (status === '') {
                $('#customerEquipmentTable tbody tr').show();
            } else {
                $('#customerEquipmentTable tbody tr').hide();
                $('#customerEquipmentTable tbody tr').filter(function () {
                    return $(this).find('.label').text().toLowerCase().indexOf(status) > -1;
                }).show();
            }
        });

        var map;
        var marker;

        function showMap(assetId) {
            // Find the asset by ID in the currentAssets array
            const asset = currentAssets.find(a => a.asset_id === assetId);
            
            if (!asset) {
                Swal.fire({
                    title: "{Lang::T('Error')}",
                    text: "{Lang::T('Asset not found')}",
                    icon: 'error',
                    confirmButtonText: "{Lang::T('OK')}"
                });
                return;
            }
            
            // Convert to numbers and validate
            const lat = parseFloat(asset.lat);
            const lng = parseFloat(asset.lng);
            
            if (isNaN(lat) || isNaN(lng)) {
                Swal.fire({
                    title: "{Lang::T('Error')}",
                    text: "{Lang::T('Invalid coordinates for this asset')}",
                    icon: 'error',
                    confirmButtonText: "{Lang::T('OK')}"
                });
                return;
            }

            if ($('#mapModal').length > 0) {
                // Show modal first
                $('#mapModal').modal('show').on('shown.bs.modal', function () {
                    // Cleanup previous map
                    if (map) {
                        map.remove();
                        map = null;
                    }
                    // Initialize new map
                    map = L.map('mapContainer').setView([lat, lng], 13);
    
                    var s = String.fromCharCode(123) + 's' + String.fromCharCode(125);
                    var z = String.fromCharCode(123) + 'z' + String.fromCharCode(125);
                    var x = String.fromCharCode(123) + 'x' + String.fromCharCode(125);
                    var y = String.fromCharCode(123) + 'y' + String.fromCharCode(125);
                    var tileUrl = 'https://' + s + '.tile.openstreetmap.org/' + z + '/' + x + '/' + y + '.png';
    
                    L.tileLayer(tileUrl, {
                        maxZoom: 19,
                        attribution: '© OpenStreetMap contributors'
                    }).addTo(map);
            
                    // Add the marker for this asset
                    L.marker([lat, lng]).addTo(map);
                });
            } else {
                    // Switch to location tab
                    $('a[href="#location-view"]').tab('show');
                    
                    // If the map is already initialized, just pan to the location
                    if (assetMap) {
                        assetMap.setView([lat, lng], 15);
                        
                        // Flash the marker by creating a temporary highlighted marker
                        const highlightMarker = L.marker([lat, lng], {
                            icon: L.divIcon({
                                className: 'highlight-marker',
                                html: '<div style="animation: pulse 1.5s infinite; background-color: #ff7800; border-radius: 50%; width: 16px; height: 16px;"></div>',
                                iconSize: [16, 16],
                                iconAnchor: [8, 8]
                            })
                        }).addTo(assetMap);
                        
                        // Remove the highlight after 3 seconds
                        setTimeout(function() {
                            assetMap.removeLayer(highlightMarker);
                        }, 3000);
                    }
                }
            }
        

        // Maintenance scheduling functions
        function loadMaintenanceSchedule() {
            $.ajax({
                url: '?_route=plugin/asset_maintenance_list',
                method: 'GET',
                data: { status: 'all' },
                success: function (response) {
                    console.log('Maintenance schedule loaded: ' + response);
                    if (response.success) {
                        populateMaintenanceTable(response.data);
                        updateMaintenanceStats();
                        loadMaintenanceAlerts();
                    } else {
                        console.error('Error loading maintenance schedule:', response.message);
                    }
                },
                error: function () {
                    console.error('Failed to load maintenance schedule');
                }
            });
        }

        function populateMaintenanceTable(maintenanceData) {
            let tableHtml = '';

            if (maintenanceData.length === 0) {
                tableHtml = '<tr><td colspan="8" class="text-center">' + '{Lang::T('No scheduled maintenance found')}' + '</td></tr>';
            } else {
                maintenanceData.forEach(function (maintenance) {
                    const priorityClass = {
                        'low': 'info',
                        'medium': 'warning',
                        'high': 'danger',
                        'critical': 'danger'
                    };

                    const statusClass = {
                        'scheduled': 'warning',
                        'in_progress': 'info',
                        'completed': 'success',
                        'overdue': 'danger'
                    };

                    const isOverdue = new Date(maintenance.scheduled_date) < new Date() && maintenance.status === 'scheduled';
                    const currentStatus = isOverdue ? 'overdue' : maintenance.status;

                    tableHtml +=
                        '<tr class="' + (isOverdue ? 'danger' : '') + '">' +
                        '<td>' +
                        '<strong>' + maintenance.asset_id + '</strong><br>' +
                        '<small class="text-muted">' + (maintenance.asset_name || '') + '</small>' +
                        '</td>' +
                        '<td>' + maintenance.maintenance_type + '</td>' +
                        '<td>' + maintenance.scheduled_date + '</td>' +
                        '<td><span class="label label-' + (priorityClass[maintenance.priority] || 'default') + '">' +
                        maintenance.priority + '</span></td>' +
                        '<td>' + (maintenance.technician || '-') + '</td>' +
                        '<td>' + currencyCode + (maintenance.cost || '0') + '</td>' +
                        '<td><span class="label label-' + (statusClass[currentStatus] || 'default') + '">' +
                        (isOverdue ? 'Overdue' : maintenance.status) + '</span></td>' +
                        '<td>' +
                        '<div class="btn-group">' +
                        '<button class="btn btn-xs btn-info" onclick="viewMaintenanceDetails(' + maintenance.id + ')" title="View Details">' +
                        '<i class="fa fa-eye"></i>' +
                        '</button>';

                    if (maintenance.status === 'scheduled') {
                        tableHtml +=
                            '<button class="btn btn-xs btn-success" onclick="startMaintenance(' + maintenance.id + ')" title="Start">' +
                            '<i class="fa fa-play"></i>' +
                            '</button>' +
                            '<button class="btn btn-xs btn-primary" onclick="completeMaintenance(' + maintenance.id + ')" title="Complete">' +
                            '<i class="fa fa-check"></i>' +
                            '</button>' +
                            '<button class="btn btn-xs btn-warning" onclick="editMaintenanceSchedule(' + maintenance.id + ')" title="Edit">' +
                            '<i class="fa fa-edit"></i>' +
                            '</button>' +
                            '<button class="btn btn-xs btn-danger" onclick="deleteMaintenanceSchedule(' + maintenance.id + ')" title="Delete">' +
                            '<i class="fa fa-trash"></i>' +
                            '</button>';
                    }

                    tableHtml += '</div></td></tr>';
                });
            }

            $('#maintenanceScheduleTable tbody').html(tableHtml);
        }

        function loadMaintenanceAlerts() {
            $.ajax({
                url: '?_route=plugin/asset_upcoming_maintenance',
                method: 'GET',
                data: { days: 7 },
                success: function (response) {
                    console.log('Maintenance alerts loaded: ' + response.data);
                    if (response.success) {
                        displayMaintenanceAlerts(response.data);
                        loadOverdueMaintenance();
                    }
                },
                error: function () {
                    console.error('Failed to load maintenance alerts');
                }
            });
        }

        function displayMaintenanceAlerts(upcomingMaintenance) {
            let alertsHtml = '';

            if (upcomingMaintenance.length === 0) {
                alertsHtml =
                    '<div class="col-md-12">' +
                    '<div class="alert alert-success">' +
                    '<i class="fa fa-check-circle"></i> {Lang::T('No maintenance scheduled for the next 7 days')}' +
                        '</div>' +
                        '</div>';
            } else {
                // Group by urgency
                const today = new Date();
                const tomorrow = new Date(today);
                tomorrow.setDate(tomorrow.getDate() + 1);

                const urgent = upcomingMaintenance.filter(m => new Date(m.scheduled_date) <= tomorrow);
                const upcoming = upcomingMaintenance.filter(m => new Date(m.scheduled_date) > tomorrow);

                if (urgent.length > 0) {
                    alertsHtml +=
                        '<div class="col-md-6">' +
                        '<div class="alert alert-danger">' +
                        '<h5><i class="fa fa-exclamation-triangle"></i> {Lang::T('Upcoming Urgent Maintenance')}</h5>' +
                            '<ul>';
                    urgent.forEach(function (m) {
                        alertsHtml += '<li>' + m.asset_id + ' - ' + m.maintenance_type + ' (' + m.scheduled_date + ')</li>';
                    });
                    alertsHtml += '</ul></div></div>';
                }

                if (upcoming.length > 0) {
                    alertsHtml +=
                        '<div class="col-md-6">' +
                        '<div class="alert alert-warning">' +
                        '<h5><i class="fa fa-clock-o"></i> {Lang::T('Upcoming This Week')}</h5>' +
                            '<ul>';
                    upcoming.slice(0, 5).forEach(function (m) {
                        alertsHtml += '<li>' + m.asset_id + ' - ' + m.maintenance_type + ' (' + m.scheduled_date + ')</li>';
                    });
                    if (upcoming.length > 5) {
                        alertsHtml += '<li><em>... and ' + (upcoming.length - 5) + ' more</em></li>';
                    }
                    alertsHtml += '</ul></div></div>';
                }
            }

            $('#maintenanceAlerts').html(alertsHtml);
        }

        function loadOverdueMaintenance() {
            // Load overdue maintenance
            $.ajax({
                url: '?_route=plugin/asset_maintenance_list',
                method: 'GET',
                data: { status: 'scheduled' },
                success: function (response) {
                    if (response.success) {
                        const today = new Date();
                        const overdue = response.data.filter(m => new Date(m.scheduled_date) < today);
                        displayOverdueMaintenance(overdue);
                    }
                }
            });
        }

        function displayOverdueMaintenance(overdueItems) {
            let overdueHtml = '';

            if (overdueItems.length === 0) {
                overdueHtml =
                    '<div class="text-center text-success">' +
                    '<i class="fa fa-check-circle fa-2x"></i>' +
                    '<p>{Lang::T('No overdue maintenance!')}</p>' +
                        '</div>';
            } else {
                overdueHtml = '<div class="list-group">';
                overdueItems.forEach(function (item) {
                    const daysOverdue = Math.floor((new Date() - new Date(item.scheduled_date)) / (1000 * 60 * 60 * 24));
                    overdueHtml +=
                        '<div class="list-group-item list-group-item-danger">' +
                        '<h6>' + item.asset_id + '</h6>' +
                        '<p>' + item.maintenance_type + '</p>' +
                        '<small class="text-danger">' + daysOverdue + ' days overdue</small>' +
                        '</div>';
                });
                overdueHtml += '</div>';
            }

            $('#overdueMaintenance').html(overdueHtml);
        }

        function updateMaintenanceStats() {
            const currentMonth = new Date().getMonth() + 1;
            const currentYear = new Date().getFullYear();

            // Load this month's maintenance stats
            $.ajax({
                url: '?_route=plugin/asset_maintenance_list',
                method: 'GET',
                success: function (response) {
                    if (response.success) {
                        const allMaintenance = response.data;

                        // This month scheduled
                        const scheduledThisMonth = allMaintenance.filter(m => {
                            const date = new Date(m.scheduled_date);
                            return date.getMonth() + 1 === currentMonth &&
                                date.getFullYear() === currentYear &&
                                m.status === 'scheduled';
                        }).length;

                        // This month completed
                        const completedThisMonth = allMaintenance.filter(m => {
                            const date = new Date(m.maintenance_date || m.scheduled_date);
                            return date.getMonth() + 1 === currentMonth &&
                                date.getFullYear() === currentYear &&
                                m.status === 'completed';
                        }).length;

                        // Next 7 days
                        const nextWeek = new Date();
                        nextWeek.setDate(nextWeek.getDate() + 7);
                        const upcomingWeek = allMaintenance.filter(m => {
                            const date = new Date(m.scheduled_date);
                            return date >= new Date() &&
                                date <= nextWeek &&
                                m.status === 'scheduled';
                        }).length;

                        $('#scheduledThisMonth').text(scheduledThisMonth);
                        $('#completedThisMonth').text(completedThisMonth);
                        $('#upcomingWeek').text(upcomingWeek);
                    }
                }
            });
        }

        function saveMaintenanceSchedule() {
            const maintenanceData = {
                asset_id: $('#maintenanceAssetId').val(),
                maintenance_type: $('#maintenanceType').val(),
                scheduled_date: $('#scheduledDate').val(),
                priority: $('#maintenancePriority').val(),
                technician: $('#maintenanceTechnician').val(),
                estimated_cost: $('#estimatedCost').val() || 0,
                description: $('#maintenanceDescription').val()
            };

            // Validate required fields
            if (!maintenanceData.asset_id || !maintenanceData.maintenance_type ||
                !maintenanceData.scheduled_date || !maintenanceData.description) {
                Swal.fire({
                    title: '{Lang::T('Validation Error')}',
                    text: '{Lang::T('Please fill in all required fields')}',
                    icon: 'warning',
                    confirmButtonText: '{Lang::T('OK')}'
            });
                return;
            }

            $.ajax({
                url: '?_route=plugin/asset_schedule_maintenance',
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(maintenanceData),
                success: function (response) {
                    if (response.success) {
                        $('#scheduleMaintenanceModal').modal('hide');
                        Swal.fire({
                            title: '{Lang::T('Success')}',
                            text: '{Lang::T('Maintenance scheduled successfully!')}',
                            icon: 'success',
                            confirmButtonText: '{Lang::T('OK')}'
                    });

                        // Reset form and reload data
                        $('#scheduleMaintenanceForm')[0].reset();
                        loadMaintenanceSchedule();
                    } else {
                        Swal.fire({
                            title: '{Lang::T('Error')}',
                            text: response.message,
                            icon: 'error',
                            confirmButtonText: '{Lang::T('OK')}'
                    });
                    }
                },
                error: function () {
                    Swal.fire({
                        title: '{Lang::T('Error')}',
                        text: '{Lang::T('An error occurred while scheduling maintenance')}',
                        icon: 'error',
                        confirmButtonText: '{Lang::T('OK')}'
                });
                }
            });
        }

        function completeMaintenance(maintenanceId) {
            $('#completeMaintenanceId').val(maintenanceId);
            $('#completionDate').val(new Date().toISOString().split('T')[0]);
            $('#completeMaintenanceModal').modal('show');
        }

        function completeMaintenanceTask() {
            const completionData = {
                maintenance_id: $('#completeMaintenanceId').val(),
                completion_date: $('#completionDate').val(),
                actual_cost: $('#actualCost').val(),
                technician: $('#completionTechnician').val(),
                completion_notes: $('#completionNotes').val()
            };

            $.ajax({
                url: '?_route=plugin/asset_complete_maintenance',
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(completionData),
                success: function (response) {
                    if (response.success) {
                        $('#completeMaintenanceModal').modal('hide');
                        Swal.fire({
                            title: '{Lang::T('Success')}',
                            text: '{Lang::T('Maintenance marked as completed!')}',
                            icon: 'success',
                            confirmButtonText: '{Lang::T('OK')}'
                    });

                        // Reset form and reload data
                        $('#completeMaintenanceForm')[0].reset();
                        loadMaintenanceSchedule();
                        loadAssetStatistics(); // Refresh overall stats
                    } else {
                        Swal.fire({
                            title: '{Lang::T('Error')}',
                            text: response.message,
                            icon: 'error',
                            confirmButtonText: '{Lang::T('OK')}'
                    });
                    }
                },
                error: function () {
                    Swal.fire({
                        title: '{Lang::T('Error')}',
                        text: '{Lang::T('An error occurred while completing maintenance')}',
                        icon: 'error',
                        confirmButtonText: '{Lang::T('OK')}'
                });
                }
            });
        }

        function loadAssetList(action = 'add') {

            if (action === 'edit') {
                return;
            }

            $.ajax({
                url: '?_route=plugin/asset_list',
                method: 'GET',
                success: function (response) {
                    if (response.success) {
                        let optionsHtml = '<option value="">' + '{Lang::T('Select Asset')}' + '</option>';
                        response.data.forEach(function (asset) {
                            optionsHtml += '<option value="' + asset.asset_id + '">' +
                                asset.asset_id + ' - ' + asset.name + ' (' + asset.category + ')</option>';
                        });
                        $('#maintenanceAssetId').html(optionsHtml);
                    }
                }
            });
        }

        function loadUpcomingMaintenance() {
            $.ajax({
                url: '?_route=plugin/asset_maintenance_list',
                method: 'GET',
                data: { status: 'scheduled' },
                success: function (response) {
                    if (response.success) {
                        console.log('Upcoming maintenance loaded:', response.data);
                        // Filter to only future dates
                        const upcoming = response.data.filter(m => new Date(m.scheduled_date) >= new Date());
                        populateMaintenanceTable(upcoming);
                    }
                }
            });
        }

        function loadMaintenanceHistory() {
            $.ajax({
                url: '?_route=plugin/asset_maintenance_list',
                method: 'GET',
                data: { status: 'completed' },
                success: function (response) {
                    if (response.success) {
                        populateMaintenanceTable(response.data);
                    }
                }
            });
        }

        // Add event listener for maintenance schedule tab
        $('a[href="#maintenance-schedule"]').on('shown.bs.tab', function () {
            loadMaintenanceSchedule();
            loadAssetList();
        });

        // Schedule maintenance from asset view
        function scheduleMaintenanceForAsset(assetId) {
            $('#maintenanceAssetId').val(assetId);
            $('#scheduleMaintenanceModal').modal('show');
            loadAssetList();
        }

        function viewMaintenanceDetails(maintenanceId) {
            $.ajax({
                url: '?_route=plugin/asset_maintenance_list',
                method: 'GET',
                success: function (response) {
                    if (response.success) {
                        const maintenance = response.data.find(m => m.id == maintenanceId);
                        if (maintenance) {
                            showMaintenanceDetailsModal(maintenance);
                        } else {
                            Swal.fire({
                                title: '{Lang::T('Error')}',
                                text: '{Lang::T('Maintenance record not found')}',
                                icon: 'error',
                                confirmButtonText: '{Lang::T('OK')}'
                        });
                        }
                    } else {
                        Swal.fire({
                            title: '{Lang::T('Error')}',
                            text: response.message,
                            icon: 'error',
                            confirmButtonText: '{Lang::T('OK')}'
                    });
                    }
                },
                error: function () {
                    Swal.fire({
                        title: '{Lang::T('Error')}',
                        text: '{Lang::T('Failed to load maintenance details')}',
                        icon: 'error',
                        confirmButtonText: '{Lang::T('OK')}'
                });
                }
            });
        }

        function showMaintenanceDetailsModal(maintenance) {
            const priorityBadge = {
                'low': 'info',
                'medium': 'warning',
                'high': 'danger',
                'critical': 'danger'
            };

            const statusBadge = {
                'scheduled': 'warning',
                'in_progress': 'info',
                'completed': 'success',
                'overdue': 'danger'
            };

            const isOverdue = new Date(maintenance.scheduled_date) < new Date() && maintenance.status === 'scheduled';
            const displayStatus = isOverdue ? 'overdue' : maintenance.status;

            let modalContent =
                '<div class="modal fade" id="maintenanceDetailsModal" tabindex="-1" role="dialog">' +
                '<div class="modal-dialog modal-lg" role="document">' +
                '<div class="modal-content">' +
                '<div class="modal-header">' +
                '<h4 class="modal-title">' +
                '<i class="fa fa-wrench"></i> {Lang::T('Maintenance Details')} - ' + maintenance.asset_id +
                    '</h4>' +
                    '<button type="button" class="close" data-dismiss="modal">&times;</button>' +
                    '</div>' +
                    '<div class="modal-body">' +
                    '<div class="row">' +
                    '<div class="col-md-6">' +
                    '<table class="table table-bordered">' +
                    '<tr>' +
                    '<th>{Lang::T('Asset ID')}</th>' +
                        '<td>' + maintenance.asset_id + '</td>' +
                        '</tr>' +
                        '<tr>' +
                        '<th>{Lang::T('Asset Name')}</th>' +
                            '<td>' + (maintenance.asset_name || '-') + '</td>' +
                            '</tr>' +
                            '<tr>' +
                            '<th>{Lang::T('Category')}</th>' +
                                '<td>' + (maintenance.asset_category || '-') + '</td>' +
                                '</tr>' +
                                '<tr>' +
                                '<th>{Lang::T('Maintenance Type')}</th>' +
                                    '<td>' + maintenance.maintenance_type + '</td>' +
                                    '</tr>' +
                                    '<tr>' +
                                    '<th>{Lang::T('Priority')}</th>' +
                                        '<td><span class="label label-' + (priorityBadge[maintenance.priority] || 'default') + '">' + maintenance.priority + '</span></td>' +
                                        '</tr>' +
                                        '<tr>' +
                                        '<th>{Lang::T('Status')}</th>' +
                                            '<td><span class="label label-' + (statusBadge[displayStatus] || 'default') + '">' + displayStatus + '</span></td>' +
                                            '</tr>' +
                                            '</table>' +
                                            '</div>' +
                                            '<div class="col-md-6">' +
                                            '<table class="table table-bordered">' +
                                            '<tr>' +
                                            '<th>{Lang::T('Scheduled Date')}</th>' +
                                                '<td>' + maintenance.scheduled_date + '</td>' +
                                                '</tr>' +
                                                '<tr>' +
                                                '<th>{Lang::T('Completion Date')}</th>' +
                                                    '<td>' + (maintenance.maintenance_date || '-') + '</td>' +
                                                    '</tr>' +
                                                    '<tr>' +
                                                    '<th>{Lang::T('Technician')}</th>' +
                                                        '<td>' + (maintenance.technician || '-') + '</td>' +
                                                        '</tr>' +
                                                        '<tr>' +
                                                        '<th>{Lang::T('Estimated Cost')}</th>' +
                                                            '<td>' + currencyCode + (maintenance.cost || '0') + '</td>' +
                                                            '</tr>' +
                                                            '<tr>' +
                                                            '<th>{Lang::T('Actual Cost')}</th>' +
                                                                '<td>' + currencyCode + (maintenance.actual_cost || '-') + '</td>' +
                                                                '</tr>' +
                                                                '<tr>' +
                                                                '<th>{Lang::T('Created')}</th>' +
                                                                    '<td>' + maintenance.created_at + '</td>' +
                                                                    '</tr>' +
                                                                    '</table>' +
                                                                    '</div>' +
                                                                    '</div>' +
                                                                    '<div class="row">' +
                                                                    '<div class="col-md-12">' +
                                                                    '<h5>{Lang::T('Description')}</h5>' +
                                                                        '<p class="well">' + (maintenance.description || '-') + '</p>';

            // Add completion notes if they exist
            if (maintenance.completion_notes) {
                modalContent +=
                    '<h5>{Lang::T('Completion Notes')}</h5>' +
                        '<p class="well">' + maintenance.completion_notes + '</p>';
            }

            modalContent +=
                '</div>' +
                '</div>' +
                '</div>' +
                '<div class="modal-footer">';

            // Add action buttons for scheduled maintenance
            if (maintenance.status === 'scheduled') {
                modalContent +=
                    '<button type="button" class="btn btn-success" onclick="completeMaintenance(' + maintenance.id + '); ' + "$('#maintenanceDetailsModal').modal('hide');" + '">' +
                    '<i class="fa fa-check"></i> {Lang::T('Mark Complete')}' +
                        '</button>' +
                        '<button type="button" class="btn btn-info" onclick="startMaintenance(' + maintenance.id + '); ' + "$('#maintenanceDetailsModal').modal('hide');" + '">' +
                        '<i class="fa fa-play"></i> {Lang::T('Start Work')}' +
                            '</button>';
            }

            modalContent +=
                '<button type="button" class="btn btn-default" data-dismiss="modal">{Lang::T('Close')}</button>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '</div>';

            // Remove existing modal if present
            $('#maintenanceDetailsModal').remove();

            // Add modal to body and show
            $('body').append(modalContent);
            $('#maintenanceDetailsModal').modal('show');
        }

        function startMaintenance(maintenanceId) {
            Swal.fire({
                title: '{Lang::T('Start Maintenance')}',
                text: '{Lang::T('Mark this maintenance as in progress?')}',
                icon: 'question',
                showCancelButton: true,
                confirmButtonText: '{Lang::T('Yes, Start')}',
                cancelButtonText: '{Lang::T('Cancel')}'
        }).then((result) => {
                    if (result.isConfirmed) {
                        // Update maintenance status to in_progress
                        $.ajax({
                            url: '?_route=plugin/asset_complete_maintenance',
                            method: 'POST',
                            contentType: 'application/json',
                            data: JSON.stringify({
                                maintenance_id: maintenanceId,
                                status: 'in_progress'
                            }),
                            success: function (response) {
                                if (response.success) {
                                    Swal.fire({
                                        title: '{Lang::T('Success')}',
                                        text: '{Lang::T('Maintenance started successfully!')}',
                                        icon: 'success',
                                        confirmButtonText: '{Lang::T('OK')}'
                            });
                                    loadMaintenanceSchedule();
                                } else {
                                    Swal.fire({
                                        title: '{Lang::T('Error')}',
                                        text: response.message,
                                        icon: 'error',
                                        confirmButtonText: '{Lang::T('OK')}'
                            });
                                }
                            },
                            error: function () {
                                Swal.fire({
                                    title: '{Lang::T('Error')}',
                                    text: '{Lang::T('An error occurred while starting maintenance')}',
                                    icon: 'error',
                                    confirmButtonText: '{Lang::T('OK')}'
                        });
                            }
                        });
                    }
                });
        }


        function editMaintenanceSchedule(maintenanceId) {
            // Load maintenance details and populate edit form
            $.ajax({
                url: '?_route=plugin/asset_maintenance_list',
                method: 'GET',
                success: function (response) {
                    if (response.success) {
                        const maintenance = response.data.find(m => m.id == maintenanceId);
                        if (maintenance) {
                            // Populate the schedule form with existing data
                            $('#maintenanceAssetId').val(maintenance.asset_id).prop('disabled', true);
                            $('#maintenanceType').val(maintenance.maintenance_type);
                            $('#scheduledDate').val(maintenance.scheduled_date);
                            $('#maintenancePriority').val(maintenance.priority);
                            $('#maintenanceTechnician').val(maintenance.technician);
                            $('#estimatedCost').val(maintenance.cost);
                            $('#maintenanceDescription').val(maintenance.description);

                            // Change modal title and button text for editing
                            $('#scheduleMaintenanceModal .modal-title').text('{Lang::T('Edit Maintenance Schedule')}');
                            $('#scheduleMaintenanceModal .btn-primary').text('{Lang::T('Update Schedule')}').attr('onclick', 'updateMaintenanceSchedule(' + maintenanceId + ')');

                            $('#scheduleMaintenanceModal').modal('show');
                            loadAssetList('edit');
                        }
                    }
                }
            });
        }

        function updateMaintenanceSchedule(maintenanceId) {
            const maintenanceData = {
                maintenance_id: maintenanceId,
                asset_id: $('#maintenanceAssetId').val(),
                maintenance_type: $('#maintenanceType').val(),
                scheduled_date: $('#scheduledDate').val(),
                priority: $('#maintenancePriority').val(),
                technician: $('#maintenanceTechnician').val(),
                cost: $('#estimatedCost').val() || 0,
                description: $('#maintenanceDescription').val()
            };

            // Validate required fields
            if (!maintenanceData.asset_id || !maintenanceData.maintenance_type ||
                !maintenanceData.scheduled_date || !maintenanceData.description) {
                Swal.fire({
                    title: '{Lang::T('Validation Error')}',
                    text: '{Lang::T('Please fill in all required fields')}',
                    icon: 'warning',
                    confirmButtonText: '{Lang::T('OK')}'
            });
                return;
            }

            $.ajax({
                url: '?_route=plugin/asset_update_maintenance',
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(maintenanceData),
                success: function (response) {
                    if (response.success) {
                        $('#scheduleMaintenanceModal').modal('hide');
                        Swal.fire({
                            title: '{Lang::T('Success')}',
                            text: '{Lang::T('Maintenance schedule updated successfully!')}',
                            icon: 'success',
                            confirmButtonText: '{Lang::T('OK')}'
                    });

                        // Reset form and reload data
                        resetMaintenanceForm();
                        loadMaintenanceSchedule();
                        refresh();
                    } else {
                        Swal.fire({
                            title: '{Lang::T('Error')}',
                            text: response.message,
                            icon: 'error',
                            confirmButtonText: '{Lang::T('OK')}'
                    });
                    }
                },
                error: function () {
                    Swal.fire({
                        title: '{Lang::T('Error')}',
                        text: '{Lang::T('An error occurred while updating maintenance')}',
                        icon: 'error',
                        confirmButtonText: '{Lang::T('OK')}'
                });
                }
            });
        }

        function resetMaintenanceForm() {
            // Reset form and modal for new entries
            $('#scheduleMaintenanceForm')[0].reset();
            $('#scheduleMaintenanceModal .modal-title').text('{Lang::T('Schedule Maintenance')}');
            $('#scheduleMaintenanceModal .btn-primary').text('{Lang::T('Schedule Maintenance')}').attr('onclick', 'saveMaintenanceSchedule()');
        }

        function deleteMaintenanceSchedule(maintenanceId) {
            Swal.fire({
                title: '{Lang::T('Are you sure?')}',
                text: '{Lang::T('This will permanently delete the maintenance schedule')}',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#d33',
                cancelButtonColor: '#3085d6',
                confirmButtonText: '{Lang::T('Yes, delete it!')}',
                cancelButtonText: '{Lang::T('Cancel')}'
        }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: '?_route=plugin/asset_delete_maintenance',
                            method: 'POST',
                            contentType: 'application/json',
                            data: JSON.stringify({ maintenance_id: maintenanceId }),
                            success: function (response) {
                                if (response.success) {
                                    Swal.fire({
                                        title: '{Lang::T('Deleted!')}',
                                        text: '{Lang::T('Maintenance schedule has been deleted')}',
                                        icon: 'success',
                                        confirmButtonText: '{Lang::T('OK')}'
                            });
                                    loadMaintenanceSchedule();
                                } else {
                                    Swal.fire({
                                        title: '{Lang::T('Error')}',
                                        text: response.message,
                                        icon: 'error',
                                        confirmButtonText: '{Lang::T('OK')}'
                            });
                                }
                            },
                            error: function () {
                                Swal.fire({
                                    title: '{Lang::T('Error')}',
                                    text: '{Lang::T('An error occurred while deleting maintenance')}',
                                    icon: 'error',
                                    confirmButtonText: '{Lang::T('OK')}'
                        });
                            }
                        });
                    }
                });
        }

        // Add to asset view modal - Schedule maintenance button
        function addScheduleButtonToAssetView(assetId) {
            const buttonHtml =
                '<button class="btn btn-primary btn-sm" onclick="scheduleMaintenanceForAsset(\'' + assetId + '\')">' +
                '<i class="fa fa-calendar-plus-o"></i> {Lang::T('Schedule Maintenance')}' +
                    '</button>';

            // Append button to asset view modal footer
            $('#assetViewModal .modal-footer').append(buttonHtml);
        }

        // Initialize maintenance schedule tab when shown
        $('a[href="#maintenance-schedule"]').on('shown.bs.tab', function () {
            if (!maintenanceScheduleInitialized) {
                loadMaintenanceSchedule();
                loadAssetList();
                maintenanceScheduleInitialized = true;
            }
        });

        // Reset maintenance form when modal is hidden
        $('#scheduleMaintenanceModal').on('hidden.bs.modal', function () {
            resetMaintenanceForm();
        });

        // Global variable to track initialization
        let maintenanceScheduleInitialized = false;

        function refresh() {
            location.reload();
        }

        // Function to filter location list
        function filterLocations() {
            const filterText = $('#locationSearchInput').val().toLowerCase();
            $('.location-item').each(function() {
                const locationName = $(this).find('.col-xs-8').text().toLowerCase();
                if (locationName.includes(filterText)) {
                    $(this).show();
                } else {
                    $(this).hide();
                }
            });
        }
        
        // Function to reset map view to show all markers
        function resetMapView() {
            if (!assetMap) return;
            
            // Find all markers and create a bounds object
            const bounds = L.latLngBounds([]);
            let hasValidMarkers = false;
            
            assetMap.eachLayer(function(layer) {
                if (layer instanceof L.Marker) {
                    bounds.extend(layer.getLatLng());
                    hasValidMarkers = true;
                }
            });
            
            // If we have markers, fit the map to show all of them
            if (hasValidMarkers) {
                assetMap.fitBounds(bounds, {
                    padding: [50, 50],
                    maxZoom: 15
                });
            } else {
                // If no markers, reset to default view
                assetMap.setView([40.7128, -74.0060], 10);
            }
        }
        
        // Function to toggle map layer visibility
        function toggleMapLayer(layerType) {
            // First, make all markers visible
            if (assetMap) {
                assetMap.eachLayer(function(layer) {
                    if (layer instanceof L.Marker) {
                        // Hide all markers first
                        assetMap.removeLayer(layer);
                    }
                });
                
                // Then reload only the markers for the selected category
                if (layerType === 'all') {
                    loadAssetLocations();
                } else {
                    // Filter currentAssets by category and add markers
                    const filteredAssets = currentAssets.filter(asset => asset.category === layerType);
                    addMarkersFromAssets(filteredAssets);
                }
                
                // Highlight the active button
                $('.map-layer-btn').removeClass('active');
                $('#layer-' + layerType).addClass('active');
            }
        }
        
        // Function to add markers from filtered assets
        function addMarkersFromAssets(assets) {
            if (!assetMap || !assets || !assets.length) return;
            
            assets.forEach(function(asset) {
                if (asset.lat && asset.lng && !isNaN(parseFloat(asset.lat)) && !isNaN(parseFloat(asset.lng))) {
                    const lat = parseFloat(asset.lat);
                    const lng = parseFloat(asset.lng);
                    
                    const statusClass = asset.status === 'active' ? 'success' :
                        asset.status === 'maintenance' ? 'warning' : 'danger';
                    
                    const marker = L.marker([lat, lng]).addTo(assetMap);
                    marker.bindPopup(
                        '<div class="location-info">' +
                        '<h5>' + asset.name + '</h5>' +
                        '<p><strong>ID:</strong> ' + asset.asset_id + '</p>' +
                        '<p><strong>Type:</strong> ' + asset.category + '</p>' +
                        '<p><strong>Location:</strong> ' + (asset.location || '-') + '</p>' +
                        '<p><strong>Status:</strong> <span class="label label-' + statusClass + '">' + asset.status + '</span></p>' +
                        '</div>'
                    );
                }
            });
        }
        
        // Initialize location panel interactivity
        $(document).ready(function() {
            // Event listener for location search input
            $('#locationSearchInput').on('keyup', function() {
                filterLocations();
            });
            
            // Make location items clickable to center map on location
            $(document).on('click', '.location-item', function() {
                const locationName = $(this).find('.col-xs-8').text().trim();
                
                // Find assets at this location
                const assetsAtLocation = currentAssets.filter(asset => 
                    asset.location && asset.location.toLowerCase().includes(locationName.toLowerCase())
                );
                
                // Switch to location tab if not already active
                $('a[href="#location-view"]').tab('show');
                
                // If we have assets with coordinates at this location
                if (assetsAtLocation.length > 0) {
                    // Try to find asset with valid coordinates
                    const assetWithCoords = assetsAtLocation.find(asset => 
                        asset.lat && asset.lng && !isNaN(parseFloat(asset.lat)) && !isNaN(parseFloat(asset.lng))
                    );
                    
                    if (assetWithCoords) {
                        const lat = parseFloat(assetWithCoords.lat);
                        const lng = parseFloat(assetWithCoords.lng);
                        
                        // Center map on this location
                        if (assetMap) {
                            assetMap.setView([lat, lng], 15);
                            
                            // Highlight the area
                            const highlightCircle = L.circle([lat, lng], {
                                color: '#3388ff',
                                fillColor: '#3388ff',
                                fillOpacity: 0.2,
                                radius: 500
                            }).addTo(assetMap);
                            
                            // Remove highlight after 3 seconds
                            setTimeout(function() {
                                assetMap.removeLayer(highlightCircle);
                            }, 3000);
                        }
                        
                        // Highlight the clicked location item
                        $('.location-item').removeClass('active');
                        $(this).addClass('active');
                    }
                }
            });
            
            // Make category items clickable to filter map
            $(document).on('click', '.category-item', function() {
                const category = $(this).data('category');
                toggleMapLayer(category);
                
                // Switch to location tab
                $('a[href="#location-view"]').tab('show');
                
                // Highlight the clicked category item
                $('.category-item').removeClass('active');
                $(this).addClass('active');
            });
        });
            // Variables to store report data and state
            let currentReportType = 'inventory';
            let reportChart = null;
            let reportInitialized = false;
            
            // Initialize reports tab
            function initializeReports() {
                if (!reportInitialized) {
                    // Populate location dropdown for reports
                    populateReportLocations();
                    
                    // Set up date range change event
                    $('#report-date-range').change(function() {
                        if ($(this).val() === 'custom') {
                            $('.custom-date-range').show();
                        } else {
                            $('.custom-date-range').hide();
                        }
                    });
                    
                    // Generate initial report
                    generateReport();
                    
                    reportInitialized = true;
                }
            }
            
            // Populate location dropdown with all locations from assets
            function populateReportLocations() {
                const locationSelect = $('#report-location');
                const locations = new Set();
                
                // Clear existing options except the first one
                locationSelect.find('option:not(:first)').remove();
                
                // Extract unique locations
                if (currentAssets && currentAssets.length > 0) {
                    currentAssets.forEach(function(asset) {
                        if (asset.location) {
                            locations.add(asset.location);
                        }
                    });
                    
                    // Add locations to dropdown
                    locations.forEach(function(location) {
                        locationSelect.append('<option value="' + location + '">' + location + '</option>');
                    });
                }
            }
            
            // Change report type
            function changeReport(reportType) {
                // Update active state in sidebar
                $('.list-group-item').removeClass('active');
                $('.list-group-item[data-report="' + reportType + '"]').addClass('active');
                
                // Update report title
                let title = '';
                let icon = '';
                
                switch(reportType) {
                    case 'inventory':
                        title = '{Lang::T("Asset Inventory Report")}';
                        icon = 'fa-list';
                        break;
                    case 'value':
                        title = '{Lang::T("Asset Value Report")}';
                        icon = 'fa-money';
                        break;
                    case 'maintenance':
                        title = '{Lang::T("Maintenance History Report")}';
                        icon = 'fa-wrench';
                        break;
                    case 'depreciation':
                        title = '{Lang::T("Depreciation Report")}';
                        icon = 'fa-line-chart';
                        break;
                    case 'status':
                        title = '{Lang::T("Asset Status Report")}';
                        icon = 'fa-check-circle';
                        break;
                }
                
                $('#report-title').html('<i class="fa ' + icon + '"></i> ' + title);
                currentReportType = reportType;
                
                // Generate the new report
                generateReport();
            }
            
            // Generate report based on current settings
            function generateReport() {
                // Show loading state
                $('#report-table-body').html('<tr><td colspan="10" class="text-center"><i class="fa fa-spinner fa-spin"></i> {Lang::T("Generating report...")}</td></tr>');
                
                // Get filter parameters
                const dateRange = $('#report-date-range').val();
                const category = $('#report-category').val();
                const location = $('#report-location').val();
                const status = $('#report-status').val();
                
                // Custom date range
                let startDate = null;
                let endDate = null;
                
                if (dateRange === 'custom') {
                    startDate = $('#report-start-date').val();
                    endDate = $('#report-end-date').val();
                }
                
                // Filter assets based on criteria
                let filteredAssets = filterAssets(currentAssets, dateRange, category, location, status, startDate, endDate);
                
                // Generate different report types
                switch (currentReportType) {
                    case 'inventory':
                        generateInventoryReport(filteredAssets);
                        break;
                    case 'value':
                        generateValueReport(filteredAssets);
                        break;
                    case 'maintenance':
                        generateMaintenanceReport(filteredAssets);
                        break;
                    case 'depreciation':
                        generateDepreciationReport(filteredAssets);
                        break;
                    case 'status':
                        generateStatusReport(filteredAssets);
                        break;
                }
            }
            
            // Filter assets based on criteria
            function filterAssets(assets, dateRange, category, location, status, startDate, endDate) {
                if (!assets) return [];
                
                return assets.filter(function(asset) {
                    // Category filter
                    if (category !== 'all' && asset.category !== category) {
                        return false;
                    }
                    
                    // Location filter
                    if (location !== 'all' && asset.location !== location) {
                        return false;
                    }
                    
                    // Status filter
                    if (status !== 'all' && asset.status !== status) {
                        return false;
                    }
                    
                    // Date filter
                    if (dateRange !== 'all') {
                        const purchaseDate = asset.purchase_date ? new Date(asset.purchase_date) : null;
                        
                        if (!purchaseDate) return false;
                        
                        const today = new Date();
                        const thisYear = today.getFullYear();
                        const thisMonth = today.getMonth();
                        
                        if (dateRange === 'today') {
                            // Check if purchase date is today
                            return (
                                purchaseDate.getDate() === today.getDate() &&
                                purchaseDate.getMonth() === today.getMonth() &&
                                purchaseDate.getFullYear() === today.getFullYear()
                            );
                        } else if (dateRange === 'week') {
                            // Get start of week (Sunday)
                            const startOfWeek = new Date(today);
                            startOfWeek.setDate(today.getDate() - today.getDay());
                            startOfWeek.setHours(0, 0, 0, 0);
                            
                            return purchaseDate >= startOfWeek;
                        } else if (dateRange === 'month') {
                            // Check if purchase date is this month
                            return (
                                purchaseDate.getMonth() === thisMonth &&
                                purchaseDate.getFullYear() === thisYear
                            );
                        } else if (dateRange === 'year') {
                            // Check if purchase date is this year
                            return purchaseDate.getFullYear() === thisYear;
                        } else if (dateRange === 'custom') {
                            // Check custom date range
                            if (startDate && endDate) {
                                const startDateObj = new Date(startDate);
                                const endDateObj = new Date(endDate);
                                endDateObj.setHours(23, 59, 59, 999); // Set to end of day
                                
                                return purchaseDate >= startDateObj && purchaseDate <= endDateObj;
                            }
                        }
                    }
                    
                    return true;
                });
            }
            
            // Generate Asset Inventory Report
            function generateInventoryReport(assets) {
                // Set up table headers
                $('#report-table-head').html(
                    '<tr>' +
                        '<th>' + '{Lang::T('Asset ID')}' + '</th>' +
                        '<th>' + '{Lang::T('Name')}' + '</th>' +
                        '<th>' + '{Lang::T('Category')}' + '</th>' +
                        '<th>' + '{Lang::T('Brand/Model')}' + '</th>' +
                        '<th>' + '{Lang::T('Serial Number')}' + '</th>' +
                        '<th>' + '{Lang::T('Location')}' + '</th>' +
                        '<th>' + '{Lang::T('Status')}' + '</th>' +
                        '<th>' + '{Lang::T('Purchase Date')}' + '</th>' +
                        '<th>' + '{Lang::T('Purchase Cost')}' + '</th>' +
                    '</tr>'
                );
                
                // Generate table rows
                let tableRows = '';
                
                if (assets.length === 0) {
                    tableRows = '<tr><td colspan="9" class="text-center">' + '{Lang::T('No assets found matching the criteria')}' + '</td></tr>';
                } else {
                    assets.forEach(function(asset) {
                        const purchaseDate = asset.purchase_date ? new Date(asset.purchase_date).toLocaleDateString() : '-';
                        const purchaseCost = asset.purchase_cost ? currencyCode + parseFloat(asset.purchase_cost).toFixed(2) : '-';
                        
                        tableRows += 
                            '<tr>' +
                                '<td>' + (asset.asset_id || '-') + '</td>' +
                                '<td>' + (asset.name || '-') + '</td>' +
                                '<td>' + (formatCategory(asset.category) || '-') + '</td>' +
                                '<td>' + (asset.brand_model || '-') + '</td>' +
                                '<td>' + (asset.serial_number || '-') + '</td>' +
                                '<td>' + (asset.location || '-') + '</td>' +
                                '<td>' + (formatStatus(asset.status) || '-') + '</td>' +
                                '<td>' + purchaseDate + '</td>' +
                                '<td>' + purchaseCost + '</td>' +
                            '</tr>';
                    });
                }
                
                $('#report-table-body').html(tableRows);
                
                // Generate summary
                const categoryCounts = countByCategory(assets);
                let categoryText = '';
                
                if (categoryCounts.network > 0) {
                    categoryText += '{Lang::T('Network')}' + ': ' + categoryCounts.network + ' | ';
                }
                if (categoryCounts.customer > 0) {
                    categoryText += '{Lang::T('Customer')}' + ': ' + categoryCounts.customer + ' | ';
                }
                if (categoryCounts.infrastructure > 0) {
                    categoryText += '{Lang::T('Infrastructure')}' + ': ' + categoryCounts.infrastructure + ' | ';
                }
                if (categoryCounts.vehicle > 0) {
                    categoryText += '{Lang::T('Vehicles')}' + ': ' + categoryCounts.vehicle + ' | ';
                }
                if (categoryCounts.tool > 0) {
                    categoryText += '{Lang::T('Tools')}' + ': ' + categoryCounts.tool;
                }
                
                $('#report-summary').html(
                    '<h4>' + '{Lang::T('Inventory Summary')}' + '</h4>' +
                    '<p><strong>' + '{Lang::T('Total Assets')}' + ':</strong> ' + assets.length + '</p>' +
                    '<p><strong>' + '{Lang::T('By Category')}' + ':</strong> ' + categoryText + '</p>'
                );
                
                // Create visualization
                createCategoryPieChart(categoryCounts);
            }
            
            // Generate Asset Value Report
            function generateValueReport(assets) {
                // Set up table headers
                $('#report-table-head').html(
                    '<tr>' +
                        '<th>' + '{Lang::T('Category')}' + '</th>' +
                        '<th>' + '{Lang::T('Total Assets')}' + '</th>' +
                        '<th>' + '{Lang::T('Total Purchase Value')}' + '</th>' +
                        '<th>' + '{Lang::T('Average Age (days)')}' + '</th>' +
                        '<th>' + '{Lang::T('Estimated Current Value')}' + '</th>' +
                        '<th>' + '{Lang::T('Depreciation')}' + '</th>' +
                    '</tr>'
                );
                
                // Calculate values by category
                const categories = ['network', 'customer', 'infrastructure', 'vehicle', 'tool'];
                const valueData = {};
                let totalPurchaseValue = 0;
                let totalCurrentValue = 0;
                let tableRows = '';
                
                categories.forEach(function(category) {
                    const categoryAssets = assets.filter(asset => asset.category === category);
                    
                    if (categoryAssets.length > 0) {
                        // Calculate purchase value
                        const purchaseValue = categoryAssets.reduce(function(sum, asset) {
                            return sum + (parseFloat(asset.purchase_cost) || 0);
                        }, 0);
                        
                        // Calculate average age in days
                        const today = new Date();
                        let totalAgeDays = 0;
                        
                        categoryAssets.forEach(function(asset) {
                            if (asset.purchase_date) {
                                const purchaseDate = new Date(asset.purchase_date);
                                const ageDays = Math.floor((today - purchaseDate) / (1000 * 60 * 60 * 24));
                                totalAgeDays += ageDays;
                            }
                        });
                        
                        const avgAgeDays = Math.round(totalAgeDays / categoryAssets.length);
                        
                        // Calculate estimated current value (simple linear depreciation)
                        // Network equipment: 20% per year
                        // Customer equipment: 30% per year
                        // Infrastructure: 10% per year
                        // Vehicles: 15% per year
                        // Tools: 25% per year
                        const depreciationRates = {
                            'network': 0.20,
                            'customer': 0.30,
                            'infrastructure': 0.10,
                            'vehicle': 0.15,
                            'tool': 0.25
                        };
                        
                        const depreciationRate = depreciationRates[category];
                        const avgAgeYears = avgAgeDays / 365;
                        
                        // Apply maximum 5 years of depreciation (assuming min 20% salvage value)
                        const depreciationFactor = Math.min(avgAgeYears * depreciationRate, 0.8);
                        const currentValue = purchaseValue * (1 - depreciationFactor);
                        const depreciation = purchaseValue - currentValue;
                        
                        // Store data for the chart
                        valueData[category] = {
                            purchaseValue: purchaseValue,
                            currentValue: currentValue,
                            depreciation: depreciation
                        };
                        
                        totalPurchaseValue += purchaseValue;
                        totalCurrentValue += currentValue;
                        
                        // Add table row
                        tableRows += 
                            '<tr>' +
                                '<td>' + formatCategory(category) + '</td>' +
                                '<td>' + categoryAssets.length + '</td>' +
                                '<td>' + currencyCode + purchaseValue.toFixed(2) + '</td>' +
                                '<td>' + avgAgeDays + '</td>' +
                                '<td>' + currencyCode + currentValue.toFixed(2) + '</td>' +
                                '<td>' + currencyCode + depreciation.toFixed(2) + ' (' + Math.round(depreciationFactor * 100) + '%)</td>' +
                            '</tr>';
                    }
                });
                
                if (tableRows === '') {
                    tableRows = '<tr><td colspan="6" class="text-center">' + '{Lang::T('No assets found with purchase value information')}' + '</td></tr>';
                } else {
                    // Add total row
                    const totalDepreciation = totalPurchaseValue - totalCurrentValue;
                    const totalDepreciationPercentage = totalPurchaseValue > 0 ? (totalDepreciation / totalPurchaseValue * 100) : 0;
                    
                    tableRows += 
                        '<tr class="info">' +
                            '<td><strong>' + '{Lang::T('Total')}' + '</strong></td>' +
                            '<td><strong>' + assets.length + '</strong></td>' +
                            '<td><strong>' + currencyCode + totalPurchaseValue.toFixed(2) + '</strong></td>' +
                            '<td>-</td>' +
                            '<td><strong>' + currencyCode + totalCurrentValue.toFixed(2) + '</strong></td>' +
                            '<td><strong>' + currencyCode + totalDepreciation.toFixed(2) + ' (' + Math.round(totalDepreciationPercentage) + '%)</strong></td>' +
                        '</tr>';
                }
                
                $('#report-table-body').html(tableRows);
                
                // Generate summary
                $('#report-summary').html(
                    '<h4>' + '{Lang::T('Value Summary')}' + '</h4>' +
                    '<p><strong>' + '{Lang::T('Total Purchase Value')}' + ':</strong> ' + currencyCode + totalPurchaseValue.toFixed(2) + '</p>' +
                    '<p><strong>' + '{Lang::T('Total Current Value')}' + ':</strong> ' + currencyCode + totalCurrentValue.toFixed(2) + '</p>' +
                    '<p><strong>' + '{Lang::T('Total Depreciation')}' + ':</strong> ' + currencyCode + (totalPurchaseValue - totalCurrentValue).toFixed(2) + '</p>'
                );
                
                // Create visualization
                createValueBarChart(valueData);
            }
            
            // Generate Maintenance History Report
            function generateMaintenanceReport(assets) {
                // Set up table headers
                $('#report-table-head').html(
                    '<tr>' +
                        '<th>' + '{Lang::T('Asset')}' + '</th>' +
                        '<th>' + '{Lang::T('Category')}' + '</th>' +
                        '<th>' + '{Lang::T('Maintenance Type')}' + '</th>' +
                        '<th>' + '{Lang::T('Date')}' + '</th>' +
                        '<th>' + '{Lang::T('Technician')}' + '</th>' +
                        '<th>' + '{Lang::T('Cost')}' + '</th>' +
                        '<th>' + '{Lang::T('Status')}' + '</th>' +
                    '</tr>'
                );
                
                // Request maintenance history from the server
                $.ajax({
                    url: '?_route=plugin/asset_maintenance_list',
                    method: 'GET',
                    success: function(response) {
                        if (response.success) {
                            const maintenanceRecords = response.data;
                            
                            // Filter maintenance records for the selected assets
                            const assetIds = assets.map(asset => asset.asset_id);
                            const filteredRecords = maintenanceRecords.filter(record => 
                                assetIds.includes(record.asset_id)
                            );
                            
                            // Generate table rows
                            let tableRows = '';
                            let totalCost = 0;
                            
                            if (filteredRecords.length === 0) {
                                tableRows = '<tr><td colspan="7" class="text-center">' + '{Lang::T('No maintenance records found for the selected assets')}' + '</td></tr>';
                            } else {
                                // Sort records by date (newest first)
                                filteredRecords.sort((a, b) => new Date(b.scheduled_date) - new Date(a.scheduled_date));
                                
                                filteredRecords.forEach(function(record) {
                                    // Find associated asset
                                    const asset = assets.find(a => a.asset_id === record.asset_id) || {};
                                    const recordCost = parseFloat(record.cost) || 0;
                                    totalCost += recordCost;
                                    
                                    tableRows += 
                                        '<tr>' +
                                            '<td>' + (asset.name || record.asset_id) + '</td>' +
                                            '<td>' + (formatCategory(asset.category) || '-') + '</td>' +
                                            '<td>' + formatMaintenanceType(record.maintenance_type) + '</td>' +
                                            '<td>' + new Date(record.scheduled_date).toLocaleDateString() + '</td>' +
                                            '<td>' + (record.technician || '-') + '</td>' +
                                            '<td>' + currencyCode + recordCost.toFixed(2) + '</td>' +
                                            '<td>' + formatMaintenanceStatus(record.status) + '</td>' +
                                        '</tr>';
                                });
                            }
                            
                            $('#report-table-body').html(tableRows);
                            
                            // Generate summary
                            if (filteredRecords.length > 0) {
                                // Count by maintenance type
                                const typeCounts = {};
                                filteredRecords.forEach(function(record) {
                                    const type = record.maintenance_type || 'unknown';
                                    typeCounts[type] = (typeCounts[type] || 0) + 1;
                                });
                                
                                // Count by status
                                const statusCounts = {};
                                filteredRecords.forEach(function(record) {
                                    const status = record.status || 'unknown';
                                    statusCounts[status] = (statusCounts[status] || 0) + 1;
                                });
                                
                                let typeCountsText = '';
                                for (const [type, count] of Object.entries(typeCounts)) {
                                    typeCountsText += formatMaintenanceType(type) + ': ' + count + ' | ';
                                }
                                typeCountsText = typeCountsText.substring(0, typeCountsText.length - 3);
                                
                                let statusCountsText = '';
                                for (const [status, count] of Object.entries(statusCounts)) {
                                    statusCountsText += formatMaintenanceStatus(status) + ': ' + count + ' | ';
                                }
                                statusCountsText = statusCountsText.substring(0, statusCountsText.length - 3);
                                
                                $('#report-summary').html(
                                    '<h4>' + '{Lang::T('Maintenance Summary')}' + '</h4>' +
                                    '<p><strong>' + '{Lang::T('Total Records')}' + ':</strong> ' + filteredRecords.length + '</p>' +
                                    '<p><strong>' + '{Lang::T('Total Cost')}' + ':</strong> ' + currencyCode + totalCost.toFixed(2) + '</p>' +
                                    '<p><strong>' + '{Lang::T('By Type')}' + ':</strong> ' + typeCountsText + '</p>' +
                                    '<p><strong>' + '{Lang::T('By Status')}' + ':</strong> ' + statusCountsText + '</p>'
                                );
                                
                                // Create visualization
                                createMaintenanceBarChart(filteredRecords);
                            } else {
                                $('#report-summary').html(
                                    '<h4>' + '{Lang::T("Maintenance Summary")}' + '</h4>' +
                                    '<p>' + '{Lang::T("No maintenance records found for the selected assets")}' + '</p>'
                                );
                                
                                // Clear chart
                                if (reportChart) {
                                    reportChart.destroy();
                                    reportChart = null;
                                }
                                $('#reportChart').hide();
                            }
                        } else {
                            $('#report-table-body').html('<tr><td colspan="7" class="text-center">{Lang::T('Error loading maintenance records')}</td></tr>');
                            
                            $('#report-summary').html(
                                '<h4>' + '{Lang::T("Maintenance Summary")}' + '</h4>' +
                                '<p>' + '{Lang::T("Error loading maintenance records")}' + '</p>'
                            );
                        }
                    },
                    error: function() {
                        $('#report-table-body').html('<tr><td colspan="7" class="text-center">{Lang::T('Error loading maintenance records')}</td></tr>');
                        
                        $('#report-summary').html(
                            '<h4>' + '{Lang::T("Maintenance Summary")}' + '</h4>' +
                            '<p>' + '{Lang::T("Error loading maintenance records")}' + '</p>'
                        );
                    }
                });
            }
            
            // Generate Depreciation Report
            function generateDepreciationReport(assets) {
                // Set up table headers
                $('#report-table-head').html(
                    '<tr>' +
                        '<th>' + '{Lang::T("Asset ID")}' + '</th>' +
                        '<th>' + '{Lang::T("Name")}' + '</th>' +
                        '<th>' + '{Lang::T("Category")}' + '</th>' +
                        '<th>' + '{Lang::T("Purchase Date")}' + '</th>' +
                        '<th>' + '{Lang::T("Age (days)")}' + '</th>' +
                        '<th>' + '{Lang::T("Purchase Cost")}' + '</th>' +
                        '<th>' + '{Lang::T("Current Value")}' + '</th>' +
                        '<th>' + '{Lang::T("Depreciation %")}' + '</th>' +
                    '</tr>'
                );
                
                // Only include assets with purchase cost and date
                const assetsWithCost = assets.filter(asset => 
                    asset.purchase_cost && 
                    parseFloat(asset.purchase_cost) > 0 && 
                    asset.purchase_date
                );
                
                // Calculate depreciation for each asset
                let tableRows = '';
                let totalPurchaseCost = 0;
                let totalCurrentValue = 0;
                const today = new Date();
                
                // Define depreciation rates by category (annual)
                const depreciationRates = {
                    'network': 0.20,      // 20% per year
                    'customer': 0.30,     // 30% per year
                    'infrastructure': 0.10, // 10% per year
                    'vehicle': 0.15,      // 15% per year
                    'tool': 0.25,         // 25% per year
                    'default': 0.20       // Default: 20% per year
                };
                
                if (assetsWithCost.length === 0) {
                    tableRows = '<tr><td colspan="8" class="text-center">' + '{Lang::T('No assets found with purchase cost and date information')}' + '</td></tr>';
                } else {
                    // Sort by highest depreciation first
                    assetsWithCost.sort((a, b) => {
                        const aAge = new Date() - new Date(a.purchase_date);
                        const bAge = new Date() - new Date(b.purchase_date);
                        return bAge - aAge; // Oldest first
                    });
                    
                    assetsWithCost.forEach(function(asset) {
                        const purchaseDate = new Date(asset.purchase_date);
                        const ageDays = Math.floor((today - purchaseDate) / (1000 * 60 * 60 * 24));
                        const ageYears = ageDays / 365;
                        
                        const purchaseCost = parseFloat(asset.purchase_cost);
                        const depreciationRate = depreciationRates[asset.category] || depreciationRates.default;
                        
                        // Apply maximum 5 years of depreciation (assuming min 20% salvage value)
                        const depreciationFactor = Math.min(ageYears * depreciationRate, 0.8);
                        const currentValue = purchaseCost * (1 - depreciationFactor);
                        const depreciationPercentage = depreciationFactor * 100;
                        
                        totalPurchaseCost += purchaseCost;
                        totalCurrentValue += currentValue;
                        
                        tableRows += 
                            '<tr>' +
                                '<td>' + (asset.asset_id || '-') + '</td>' +
                                '<td>' + (asset.name || '-') + '</td>' +
                                '<td>' + (formatCategory(asset.category) || '-') + '</td>' +
                                '<td>' + purchaseDate.toLocaleDateString() + '</td>' +
                                '<td>' + ageDays + '</td>' +
                                '<td>' + currencyCode + purchaseCost.toFixed(2) + '</td>' +
                                '<td>' + currencyCode + currentValue.toFixed(2) + '</td>' +
                                '<td>' + depreciationPercentage.toFixed(1) + '%</td>' +
                            '</tr>';
                    });
                    
                    // Add total row
                    const totalDepreciation = totalPurchaseCost - totalCurrentValue;
                    const totalDepreciationPercentage = (totalDepreciation / totalPurchaseCost) * 100;
                    
                    tableRows += 
                        '<tr class="info">' +
                            '<td colspan="5"><strong>' + '{Lang::T('Total')}' + '</strong></td>' +
                            '<td><strong>' + currencyCode + totalPurchaseCost.toFixed(2) + '</strong></td>' +
                            '<td><strong>' + currencyCode + totalCurrentValue.toFixed(2) + '</strong></td>' +
                            '<td><strong>' + totalDepreciationPercentage.toFixed(1) + '%</strong></td>' +
                        '</tr>';
                }
                
                $('#report-table-body').html(tableRows);
                
                // Generate summary
                if (assetsWithCost.length > 0) {
                    $('#report-summary').html(
                        '<h4>' + '{Lang::T('Depreciation Summary')}' + '</h4>' +
                        '<p><strong>' + '{Lang::T('Total Assets Analyzed')}' + ':</strong> ' + assetsWithCost.length + '</p>' +
                        '<p><strong>' + '{Lang::T('Total Purchase Cost')}' + ':</strong> ' + currencyCode + totalPurchaseCost.toFixed(2) + '</p>' +
                        '<p><strong>' + '{Lang::T('Total Current Value')}' + ':</strong> ' + currencyCode + totalCurrentValue.toFixed(2) + '</p>' +
                        '<p><strong>' + '{Lang::T('Total Depreciation')}' + ':</strong> ' + currencyCode + (totalPurchaseCost - totalCurrentValue).toFixed(2) + '</p>' +
                        '<p><small>' + '{Lang::T('Note: Depreciation calculated using standard rates: Network: 20%/year, Customer: 30%/year, Infrastructure: 10%/year, Vehicles: 15%/year, Tools: 25%/year')}' + '</small></p>'
                    );
                    
                    // Create visualization
                    createDepreciationChart(assetsWithCost);
                } else {
                    $('#report-summary').html(
                        '<h4>' + '{Lang::T("Depreciation Summary")}' + '</h4>' +
                        '<p>' + '{Lang::T("No assets found with purchase cost and date information")}' + '</p>'
                    );
                    
                    // Clear chart
                    if (reportChart) {
                        reportChart.destroy();
                        reportChart = null;
                    }
                    $('#reportChart').hide();
                }
            }
            
            // Generate Asset Status Report
            function generateStatusReport(assets) {
                // Set up table headers
                $('#report-table-head').html(
                    '<tr>' +
                        '<th>' + '{Lang::T("Status")}' + '</th>' +
                        '<th>' + '{Lang::T("Count")}' + '</th>' +
                        '<th>' + '{Lang::T("Percentage")}' + '</th>' +
                        '<th>' + '{Lang::T("Total Value")}' + '</th>' +
                        '<th>' + '{Lang::T("Categories")}' + '</th>' +
                    '</tr>'
                );
                
                // Count assets by status
                const statusCounts = {};
                const statusValues = {};
                const statusCategories = {};
                
                assets.forEach(function(asset) {
                    const status = asset.status || 'unknown';
                    
                    // Count
                    statusCounts[status] = (statusCounts[status] || 0) + 1;
                    
                    // Sum values
                    const cost = parseFloat(asset.purchase_cost) || 0;
                    statusValues[status] = (statusValues[status] || 0) + cost;
                    
                    // Categories
                    if (!statusCategories[status]) {
                        statusCategories[status] = {};
                    }
                    
                    const category = asset.category || 'unknown';
                    statusCategories[status][category] = (statusCategories[status][category] || 0) + 1;
                });
                
                // Generate table rows
                let tableRows = '';
                const totalAssets = assets.length;
                
                if (Object.keys(statusCounts).length === 0) {
                    tableRows = '<tr><td colspan="5" class="text-center">' + '{Lang::T('No assets found')}' + '</td></tr>';
                } else {
                    // Sort by count (highest first)
                    const sortedStatuses = Object.keys(statusCounts).sort((a, b) => statusCounts[b] - statusCounts[a]);
                    
                    sortedStatuses.forEach(function(status) {
                        const count = statusCounts[status];
                        const percentage = (count / totalAssets * 100).toFixed(1);
                        const value = statusValues[status] || 0;
                        
                        // Format categories
                        let categoryText = '';
                        const categories = statusCategories[status];
                        
                        if (categories) {
                            for (const [category, catCount] of Object.entries(categories)) {
                                if (catCount > 0) {
                                    categoryText += formatCategory(category) + ': ' + catCount + ', ';
                                }
                            }
                            categoryText = categoryText.substring(0, categoryText.length - 2); // Remove trailing comma and space
                        }
                        
                        tableRows += 
                            '<tr>' +
                                '<td>' + formatStatus(status) + '</td>' +
                                '<td>' + count + '</td>' +
                                '<td>' + percentage + '%</td>' +
                                '<td>' + currencyCode + value.toFixed(2) + '</td>' +
                                '<td>' + categoryText + '</td>' +
                            '</tr>';
                    });
                }
                
                $('#report-table-body').html(tableRows);
                
                // Generate summary
                $('#report-summary').html(
                    '<h4>' + '{Lang::T('Status Summary')}' + '</h4>' +
                    '<p><strong>' + '{Lang::T('Total Assets')}' + ':</strong> ' + totalAssets + '</p>' +
                    '<p><strong>' + '{Lang::T('Active Assets')}' + ':</strong> ' + (statusCounts['active'] || 0) + ' (' + (totalAssets > 0 ? ((statusCounts['active'] || 0) / totalAssets * 100).toFixed(1) : 0) + '%)</p>' +
                    '<p><strong>' + '{Lang::T('Maintenance Assets')}' + ':</strong> ' + (statusCounts['maintenance'] || 0) + ' (' + (totalAssets > 0 ? ((statusCounts['maintenance'] || 0) / totalAssets * 100).toFixed(1) : 0) + '%)</p>'
                );
                
                // Create visualization
                createStatusPieChart(statusCounts);
            }
            
            // Helper function to count assets by category
            function countByCategory(assets) {
                const counts = {
                    'network': 0,
                    'customer': 0,
                    'infrastructure': 0,
                    'vehicle': 0,
                    'tool': 0,
                    'unknown': 0
                };
                
                assets.forEach(function(asset) {
                    const category = asset.category || 'unknown';
                    counts[category] = (counts[category] || 0) + 1;
                });
                
                return counts;
            }
            
            // Create category pie chart
            function createCategoryPieChart(categoryCounts) {
                // Destroy previous chart if exists
                if (reportChart) {
                    reportChart.destroy();
                }
                
                const ctx = document.getElementById('reportChart').getContext('2d');
                $('#reportChart').show();
                
                reportChart = new Chart(ctx, {
                    type: 'pie',
                    data: {
                        labels: [
                            '{Lang::T("Network Equipment")}',
                            '{Lang::T("Customer Equipment")}',
                            '{Lang::T("Infrastructure")}',
                            '{Lang::T("Vehicles")}',
                            '{Lang::T("Tools")}',
                            '{Lang::T("Unknown")}'
                        ],
                        datasets: [{
                            data: [
                                categoryCounts.network || 0,
                                categoryCounts.customer || 0,
                                categoryCounts.infrastructure || 0,
                                categoryCounts.vehicle || 0,
                                categoryCounts.tool || 0,
                                categoryCounts.unknown || 0
                            ],
                            backgroundColor: [
                                '#5cb85c', // Network - Green
                                '#428bca', // Customer - Blue
                                '#f0ad4e', // Infrastructure - Orange
                                '#d9534f', // Vehicles - Red
                                '#5bc0de', // Tools - Light Blue
                                '#777777'  // Unknown - Gray
                            ]
                        }]
                    },
                    options: {
                        responsive: true,
                        plugins: {
                            legend: {
                                position: 'right',
                            },
                            title: {
                                display: true,
                                text: '{Lang::T("Assets by Category")}'
                            }
                        }
                    }
                });
            }
            
            // Create value bar chart
            function createValueBarChart(valueData) {
                // Destroy previous chart if exists
                if (reportChart) {
                    reportChart.destroy();
                }
                
                const ctx = document.getElementById('reportChart').getContext('2d');
                $('#reportChart').show();
                
                // Prepare data
                const categories = [
                    '{Lang::T("Network")}',
                    '{Lang::T("Customer")}',
                    '{Lang::T("Infrastructure")}',
                    '{Lang::T("Vehicles")}',
                    '{Lang::T("Tools")}'
                ];
                
                const purchaseValues = [
                    valueData.network ? valueData.network.purchaseValue : 0,
                    valueData.customer ? valueData.customer.purchaseValue : 0,
                    valueData.infrastructure ? valueData.infrastructure.purchaseValue : 0,
                    valueData.vehicle ? valueData.vehicle.purchaseValue : 0,
                    valueData.tool ? valueData.tool.purchaseValue : 0
                ];
                
                const currentValues = [
                    valueData.network ? valueData.network.currentValue : 0,
                    valueData.customer ? valueData.customer.currentValue : 0,
                    valueData.infrastructure ? valueData.infrastructure.currentValue : 0,
                    valueData.vehicle ? valueData.vehicle.currentValue : 0,
                    valueData.tool ? valueData.tool.currentValue : 0
                ];
                
                reportChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: categories,
                        datasets: [
                            {
                                label: '{Lang::T("Purchase Value")}',
                                data: purchaseValues,
                                backgroundColor: 'rgba(54, 162, 235, 0.7)',
                                borderColor: 'rgb(54, 162, 235)',
                                borderWidth: 1
                            },
                            {
                                label: '{Lang::T("Current Value")}',
                                data: currentValues,
                                backgroundColor: 'rgba(255, 99, 132, 0.7)',
                                borderColor: 'rgb(255, 99, 132)',
                                borderWidth: 1
                            }
                        ]
                    },
                    options: {
                        responsive: true,
                        scales: {
                            y: {
                                beginAtZero: true,
                                title: {
                                    display: true,
                                    text: '{Lang::T("Value")} (' + currencyCode + ')'
                                },
                                ticks: {
                                    callback: function(value) {
                                        return currencyCode + value;
                                    }
                                }
                            }
                        },
                        plugins: {
                            legend: {
                                position: 'top'
                            },
                            title: {
                                display: true,
                                text: '{Lang::T("Asset Values by Category")}'
                            }
                        }
                    }
                });
            }
            
            // Create maintenance bar chart
            function createMaintenanceBarChart(records) {
                // Destroy previous chart if exists
                if (reportChart) {
                    reportChart.destroy();
                }
                
                const ctx = document.getElementById('reportChart').getContext('2d');
                $('#reportChart').show();
                
                // Group by month and type
                const monthlyData = {};
                const maintenanceTypes = new Set();
                
                records.forEach(function(record) {
                    const date = new Date(record.scheduled_date);
                    const monthYear = (date.getMonth() + 1) + '/' + date.getFullYear();
                    
                    if (!monthlyData[monthYear]) {
                        monthlyData[monthYear] = {};
                    }
                    
                    const type = record.maintenance_type || 'unknown';
                    maintenanceTypes.add(type);
                    
                    monthlyData[monthYear][type] = (monthlyData[monthYear][type] || 0) + 1;
                });
                
                // Sort months chronologically
                const sortedMonths = Object.keys(monthlyData).sort((a, b) => {
                    const [aMonth, aYear] = a.split('/').map(Number);
                    const [bMonth, bYear] = b.split('/').map(Number);
                    
                    if (aYear !== bYear) {
                        return aYear - bYear;
                    }
                    return aMonth - bMonth;
                });
                
                // Prepare datasets
                const datasets = [];
                const colors = [
                    'rgba(54, 162, 235, 0.7)', // Blue
                    'rgba(255, 99, 132, 0.7)', // Red
                    'rgba(75, 192, 192, 0.7)', // Green
                    'rgba(255, 206, 86, 0.7)', // Yellow
                    'rgba(153, 102, 255, 0.7)' // Purple
                ];
                
                // Convert maintenance types to array and sort
                const typesArray = Array.from(maintenanceTypes);
                
                typesArray.forEach(function(type, index) {
                    const data = sortedMonths.map(month => monthlyData[month][type] || 0);
                    
                    datasets.push({
                        label: formatMaintenanceType(type),
                        data: data,
                        backgroundColor: colors[index % colors.length],
                        borderColor: colors[index % colors.length].replace('0.7', '1'),
                        borderWidth: 1
                    });
                });
                
                // Create the chart
                reportChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: sortedMonths,
                        datasets: datasets
                    },
                    options: {
                        responsive: true,
                        scales: {
                            y: {
                                beginAtZero: true,
                                title: {
                                    display: true,
                                    text: '{Lang::T("Number of Maintenance Records")}'
                                },
                                ticks: {
                                    stepSize: 1
                                }
                            }
                        },
                        plugins: {
                            legend: {
                                position: 'top'
                            },
                            title: {
                                display: true,
                                text: '{Lang::T("Maintenance Records by Month")}'
                            }
                        }
                    }
                });
            }
            
            // Create depreciation chart
            function createDepreciationChart(assets) {
                // Destroy previous chart if exists
                if (reportChart) {
                    reportChart.destroy();
                }
                
                const ctx = document.getElementById('reportChart').getContext('2d');
                $('#reportChart').show();
                
                // Group by age range
                const ageRanges = {
                    '<1': { purchase: 0, current: 0 },
                    '1-2': { purchase: 0, current: 0 },
                    '2-3': { purchase: 0, current: 0 },
                    '3-4': { purchase: 0, current: 0 },
                    '4+': { purchase: 0, current: 0 }
                };
                
                // Define depreciation rates by category (annual)
                const depreciationRates = {
                    'network': 0.20,      // 20% per year
                    'customer': 0.30,     // 30% per year
                    'infrastructure': 0.10, // 10% per year
                    'vehicle': 0.15,      // 15% per year
                    'tool': 0.25,         // 25% per year
                    'default': 0.20       // Default: 20% per year
                };
                
                const today = new Date();
                
                assets.forEach(function(asset) {
                    const purchaseDate = new Date(asset.purchase_date);
                    const ageYears = (today - purchaseDate) / (1000 * 60 * 60 * 24 * 365);
                    const purchaseCost = parseFloat(asset.purchase_cost);
                    
                    const depreciationRate = depreciationRates[asset.category] || depreciationRates.default;
                    const depreciationFactor = Math.min(ageYears * depreciationRate, 0.8);
                    const currentValue = purchaseCost * (1 - depreciationFactor);
                    
                    let rangeKey;
                    if (ageYears < 1) rangeKey = '<1';
                    else if (ageYears < 2) rangeKey = '1-2';
                    else if (ageYears < 3) rangeKey = '2-3';
                    else if (ageYears < 4) rangeKey = '3-4';
                    else rangeKey = '4+';
                    
                    ageRanges[rangeKey].purchase += purchaseCost;
                    ageRanges[rangeKey].current += currentValue;
                });
                
                // Prepare data
                const labels = Object.keys(ageRanges);
                const purchaseData = labels.map(key => ageRanges[key].purchase);
                const currentData = labels.map(key => ageRanges[key].current);
                
                // Create the chart
                reportChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: labels.map(l => l + ' {Lang::T("years")}'),
                        datasets: [
                            {
                                label: '{Lang::T("Purchase Value")}',
                                data: purchaseData,
                                backgroundColor: 'rgba(54, 162, 235, 0.7)',
                                borderColor: 'rgb(54, 162, 235)',
                                borderWidth: 1
                            },
                            {
                                label: '{Lang::T("Current Value")}',
                                data: currentData,
                                backgroundColor: 'rgba(255, 99, 132, 0.7)',
                                borderColor: 'rgb(255, 99, 132)',
                                borderWidth: 1
                            }
                        ]
                    },
                    options: {
                        responsive: true,
                        scales: {
                            y: {
                                beginAtZero: true,
                                title: {
                                    display: true,
                                    text: '{Lang::T("Value")} (' + currencyCode + ')'
                                },
                                ticks: {
                                    callback: function(value) {
                                        return currencyCode + value;
                                    }
                                }
                            },
                            x: {
                                title: {
                                    display: true,
                                    text: '{Lang::T("Asset Age")}'
                                }
                            }
                        },
                        plugins: {
                            legend: {
                                position: 'top'
                            },
                            title: {
                                display: true,
                                text: '{Lang::T("Asset Value Depreciation by Age")}'
                            }
                        }
                    }
                });
            }
            
            // Create status pie chart
            function createStatusPieChart(statusCounts) {
                // Destroy previous chart if exists
                if (reportChart) {
                    reportChart.destroy();
                }
                
                const ctx = document.getElementById('reportChart').getContext('2d');
                $('#reportChart').show();
                
                // Prepare data
                const statuses = Object.keys(statusCounts);
                const data = statuses.map(status => statusCounts[status]);
                const backgroundColors = statuses.map(status => {
                    switch (status) {
                        case 'active': return 'rgba(92, 184, 92, 0.7)'; // Green
                        case 'maintenance': return 'rgba(240, 173, 78, 0.7)'; // Orange
                        case 'retired': return 'rgba(217, 83, 79, 0.7)'; // Red
                        case 'storage': return 'rgba(91, 192, 222, 0.7)'; // Blue
                        default: return 'rgba(119, 119, 119, 0.7)'; // Gray
                    }
                });
                
                // Create the chart
                reportChart = new Chart(ctx, {
                    type: 'pie',
                    data: {
                        labels: statuses.map(status => formatStatus(status)),
                        datasets: [{
                            data: data,
                            backgroundColor: backgroundColors,
                            borderColor: backgroundColors.map(color => color.replace('0.7', '1')),
                            borderWidth: 1
                        }]
                    },
                    options: {
                        responsive: true,
                        plugins: {
                            legend: {
                                position: 'right'
                            },
                            title: {
                                display: true,
                                text: '{Lang::T("Assets by Status")}'
                            }
                        }
                    }
                });
            }
            
            // Helper function to format category names
            function formatCategory(category) {
                if (!category) return '{Lang::T("Unknown")}';
                
                switch (category) {
                    case 'network': return '{Lang::T("Network Equipment")}';
                    case 'customer': return '{Lang::T("Customer Equipment")}';
                    case 'infrastructure': return '{Lang::T("Infrastructure")}';
                    case 'vehicle': return '{Lang::T("Vehicle")}';
                    case 'tool': return '{Lang::T("Tool & Equipment")}';
                    default: return category;
                }
            }
            
            // Helper function to format status
            function formatStatus(status) {
                if (!status) return '{Lang::T("Unknown")}';
                
                switch (status) {
                    case 'active': return '{Lang::T("Active")}';
                    case 'maintenance': return '{Lang::T("Under Maintenance")}';
                    case 'retired': return '{Lang::T("Retired/Disposed")}';
                    case 'storage': return '{Lang::T("In Storage")}';
                    default: return status.charAt(0).toUpperCase() + status.slice(1);
                }
            }
            
            // Helper function to format maintenance type
            function formatMaintenanceType(type) {
                if (!type) return '{Lang::T("Unknown")}';
                
                switch (type) {
                    case 'preventive': return '{Lang::T("Preventive Maintenance")}';
                    case 'corrective': return '{Lang::T("Corrective Maintenance")}';
                    case 'emergency': return '{Lang::T("Emergency Repair")}';
                    case 'inspection': return '{Lang::T("Inspection")}';
                    case 'calibration': return '{Lang::T("Calibration")}';
                    case 'upgrade': return '{Lang::T("Upgrade")}';
                    default: return type.charAt(0).toUpperCase() + type.slice(1);
                }
            }
            
            // Helper function to format maintenance status
            function formatMaintenanceStatus(status) {
                if (!status) return '{Lang::T("Unknown")}';
                
                switch (status) {
                    case 'scheduled': return '{Lang::T("Scheduled")}';
                    case 'in_progress': return '{Lang::T("In Progress")}';
                    case 'completed': return '{Lang::T("Completed")}';
                    case 'cancelled': return '{Lang::T("Cancelled")}';
                    case 'overdue': return '{Lang::T("Overdue")}';
                    default: return status.charAt(0).toUpperCase() + status.slice(1).replace('_', ' ');
                }
            }
            
            // Export report as PDF
            function exportReportPDF() {
                // Show loading message
                Swal.fire({
                    title: '{Lang::T("Exporting Report")}',
                    text: '{Lang::T("Preparing PDF export...")}',
                    allowOutsideClick: false,
                    onBeforeOpen: () => {
                        Swal.showLoading();
                    }
                });
                
                // Collect report data
                const reportData = {
                    reportType: currentReportType, // Changed from type to reportType to match PHP backend expectations
                    title: $('#report-title').text(),
                    dateRange: $('#report-date-range').val(),
                    category: $('#report-category').val(),
                    location: $('#report-location').val(),
                    status: $('#report-status').val(),
                    filters: {
                        dateRange: $('#report-date-range option:selected').text(),
                        category: $('#report-category option:selected').text(),
                        location: $('#report-location option:selected').text(),
                        status: $('#report-status option:selected').text()
                    },
                    customDateRange: {
                        startDate: $('#report-start-date').val(),
                        endDate: $('#report-end-date').val()
                    },
                    tableHTML: (function() {
                        // Build a complete table including both head and body
                        let fullTableHtml = '<table border="1" cellpadding="8" cellspacing="0" width="100%">';
                        
                        // Get the header row
                        fullTableHtml += '<thead>';
                        fullTableHtml += $('#report-table-head').html();
                        fullTableHtml += '</thead>';
                        
                        // Get the body rows
                        fullTableHtml += '<tbody>';
                        fullTableHtml += $('#report-table-body').html();
                        fullTableHtml += '</tbody>';
                        
                        fullTableHtml += '</table>';
                        
                        return fullTableHtml;
                    })(),
                    summaryHTML: $('#report-summary').html()
                };
                
                // Send to server for PDF generation
                $.ajax({
                    url: '?_route=plugin/asset_report_export',
                    method: 'POST',
                    data: {
                        format: 'pdf',
                        reportData: JSON.stringify(reportData)
                    },
                    success: function(response) {
                        if (response.success) {
                            Swal.close();
                            
                            // Download the PDF
                            const link = document.createElement('a');
                            link.href = response.fileUrl;
                            link.download = response.fileName || 'asset-report.pdf';
                            link.click();
                        } else {
                            Swal.fire({
                                title: '{Lang::T("Export Failed")}',
                                text: response.message || '{Lang::T("Failed to generate PDF report")}',
                                icon: 'error',
                                confirmButtonText: '{Lang::T("OK")}'
                            });
                        }
                    },
                    error: function() {
                        Swal.fire({
                            title: '{Lang::T("Export Failed")}',
                            text: '{Lang::T("An error occurred while exporting to PDF")}',
                            icon: 'error',
                            confirmButtonText: '{Lang::T("OK")}'
                        });
                    }
                });
            }
            
            // Export report as CSV
            function exportReportCSV() {
                // Get table data
                const headers = [];
                const data = [];
                
                // Extract headers
                $('#report-table-head th').each(function() {
                    headers.push($(this).text());
                });
                
                // Extract rows
                $('#report-table-body tr').each(function() {
                    const row = [];
                    $(this).find('td').each(function() {
                        row.push($(this).text());
                    });
                    if (row.length > 0) {
                        data.push(row);
                    }
                });
                
                // Create CSV content
                let csvContent = headers.join(',') + '\n';
                
                data.forEach(function(row) {
                    let csvRow = row.map(function(cell) {
                        // Escape quotes and wrap in quotes if contains comma
                        const escaped = cell.replace(/"/g, '""');
                        return (cell.indexOf(',') > -1) ? '"' + escaped + '"' : escaped;
                    }).join(',');
                    
                    csvContent += csvRow + '\n';
                });
                
                // Create and trigger download
                const blob = new Blob([csvContent], { type: 'text/csv;charset=utf-8;' });
                const url = URL.createObjectURL(blob);
                
                const link = document.createElement('a');
                const timestamp = new Date().toISOString().slice(0, 10);
                const reportTypeText = currentReportType.charAt(0).toUpperCase() + currentReportType.slice(1);
                
                link.href = url;
                link.download = 'asset-' + currentReportType + '-report-' + timestamp + '.csv';
                link.click();
                
                // Clean up
                URL.revokeObjectURL(url);
            }
            
            // Print report
            function printReport() {
                // Clone the report content
                const reportTitle = $('#report-title').clone();
                const reportContent = $('.report-content').clone();
                
                // Add filters info
                const filtersInfo = $('<div class="report-filters"></div>');
                filtersInfo.append('<p><strong>{Lang::T("Filters")}:</strong> ' + 
                    '{Lang::T("Date Range")}: ' + $('#report-date-range option:selected').text() + ', ' +
                    '{Lang::T("Category")}: ' + $('#report-category option:selected').text() + ', ' +
                    '{Lang::T("Location")}: ' + $('#report-location option:selected').text() + ', ' +
                    '{Lang::T("Status")}: ' + $('#report-status option:selected').text() + '</p>'
                );
                
                // Create print window
                const printWindow = window.open('', '_blank');
                printWindow.document.write(
                    '<html>' +
                    '<head>' +
                        '<title>' + reportTitle.text() + '</title>' +
                        '<style>' +
                            'body { font-family: Arial, sans-serif; padding: 20px; }' +
                            'h1 { color: #337ab7; }' +
                            'table { border-collapse: collapse; width: 100%; margin-bottom: 20px; }' +
                            '{literal}th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }{/literal}' +
                            '{literal}th { background-color: #f5f5f5; }{/literal}' +
                            '{literal}.report-filters { margin-bottom: 20px; font-size: 12px; color: #777; }{/literal}' +
                            '{literal}.report-summary { background-color: #f9f9f9; padding: 15px; border: 1px solid #ddd; }{/literal}' +
                            '{literal}canvas { max-width: 100%; height: auto !important; }{/literal}' +
                            '{literal}@media print {{/literal}' +
                                '{literal}.no-print { display: none; }{/literal}' +
                                '{literal}body { padding: 0; }{/literal}' +
                            '{literal}}{/literal}' +
                        '</style>' +
                    '</head>' +
                    '<body>' +
                        '<h1>' + reportTitle.html() + '</h1>' +
                        '<div {literal}class="no-print"{/literal}>' +
                            '<p>This report has been prepared for printing. Use your browser\'s print function to print this report.</p>' +
                            '<button {literal}onclick="window.print()"{/literal}>Print</button>' +
                            '<button {literal}onclick="window.close()"{/literal}>Close</button>' +
                            '<hr>' +
                        '</div>' +
                        filtersInfo.prop('outerHTML') +
                        reportContent.html() +
                        '<div {literal}class="no-print"{/literal}>' +
                            '<hr>' +
                            '<p>Generated on: ' + new Date().toLocaleString() + '</p>' +
                        '</div>' +
                    '</body>' +
                    '</html>'
                );
                
                // Add the chart
                if (reportChart) {
                    const canvas = printWindow.document.createElement('canvas');
                    canvas.id = 'printChart';
                    printWindow.document.body.querySelector('.report-content').insertBefore(canvas, printWindow.document.body.querySelector('.table-responsive'));
                    
                    // Clone the chart in the print window
                    const printCtx = canvas.getContext('2d');
                    const printChart = new Chart(printCtx, {
                        type: reportChart.config.type,
                        data: JSON.parse(JSON.stringify(reportChart.data)),
                        options: JSON.parse(JSON.stringify(reportChart.options))
                    });
                }
                
                // Focus the print window
                printWindow.focus();
            }


</script>
<script>
    window.addEventListener('DOMContentLoaded', function () {
        const portalLink = "https://t.me/focuslinkstech";
        const donateLink = "https://www.paypal.com/paypalme/focuslinkstech";
        const updateLink = "{$updateLink}";
        const productName = "Asset Manager";
        const version = "{$version}";
        $('#version').html(productName + ' | Ver: ' + version + ' | by: <a href="' + portalLink + '">Focuslinks Tech</a> | <a href="' + donateLink + '">Donate</a>' );
        
    });
</script>

{include file="sections/footer.tpl"}