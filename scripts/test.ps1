

# =============
# DATA
# =============


$lifeSpanBuild = $(Get-LifeSpanPerBuild)


# ===========
# TEST
# ===========

$values = $lifeSpanBuild.LifeCycle
# Convert to List type
[Collections.Generic.List[Object]]$lst = $values



$chrtValues = [LiveCharts.ChartValues[double]]::new()
 

# Cast Lifecycle to ChartValues type
[LiveCharts.ChartValues[Double]]$val = ($lifeSpanBuild | Select-Object -Property Lifecycle).LifeCycle


# TO DO Labels


# ============
# VIEW
# ============


$stackRowSeries = [LiveCharts.Wpf.StackedRowSeries]::new()
# using splatting
$stackRowSeries = @{
    DataLabels = $true

}
#============================================



