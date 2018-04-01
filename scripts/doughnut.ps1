
$DoughnutCollection = [LiveCharts.SeriesCollection]::new()

$chartvalue1 = [LiveCharts.ChartValues[LiveCharts.Defaults.ObservableValue]]::new()
$pieSeries = [LiveCharts.Wpf.PieSeries]::new()
$chartvalue1.Add([LiveCharts.Defaults.ObservableValue]::new(8))
$pieSeries.Values = $chartvalue1
$pieSeries.Title = "Chrome"
$pieSeries.DataLabels = $true

$DoughnutCollection.Add($pieSeries)


$chartvalue2 = [LiveCharts.ChartValues[LiveCharts.Defaults.ObservableValue]]::new()
$pieSeries = [LiveCharts.Wpf.PieSeries]::new()
$chartvalue2.Add([LiveCharts.Defaults.ObservableValue]::new(6))
$pieSeries.Values = $chartvalue2
$pieSeries.Title = "Mozilla"
$pieSeries.DataLabels = $true

$DoughnutCollection.Add($pieSeries)


$chartvalue3 = [LiveCharts.ChartValues[LiveCharts.Defaults.ObservableValue]]::new()
$pieSeries = [LiveCharts.Wpf.PieSeries]::new()
$chartvalue3.Add([LiveCharts.Defaults.ObservableValue]::new(10))
$pieSeries.Values = $chartvalue3
$pieSeries.Title = "Opera"
$pieSeries.DataLabels = $true


$DoughnutCollection.Add($pieSeries)

$chartvalue4 = [LiveCharts.ChartValues[LiveCharts.Defaults.ObservableValue]]::new()
$pieSeries = [LiveCharts.Wpf.PieSeries]::new()
$chartvalue4.Add([LiveCharts.Defaults.ObservableValue]::new(4))
$pieSeries.Values = $chartvalue4
$pieSeries.Title = "Explorer"
$pieSeries.DataLabels = $true


$DoughnutCollection.Add($pieSeries)