
 $seriesCollection = [LiveCharts.SeriesCollection]::new()

#== Serie 1 ===
$lineserie1 = [LiveCharts.Wpf.LineSeries]::new()
    $lineserie1.Title = "serie 1"
    $chartValues = [LiveCharts.ChartValues[double]]::new( )
    $chartValues.Add(7)
    $chartValues.Add(5)
    $chartValues.Add(6)
    $chartValues.Add(3)
    $lineserie1.Values  = $chartValues

#== Serie 2 ===

$lineserie2 = [LiveCharts.Wpf.LineSeries]::new()
    $lineserie2.Title = "serie 2"
    $chartValues = [LiveCharts.ChartValues[double]]::new( )
    $chartValues.Add(3)
    $chartValues.Add(6)
    $chartValues.Add(5)
    $chartValues.Add(9)
    $lineserie2.Values  = $chartValues


#== Serie 3 ===
$lineserie3 = [LiveCharts.Wpf.LineSeries]::new()
    $lineserie3.Title = "serie 3"
    $chartValues = [LiveCharts.ChartValues[double]]::new( )
    $chartValues.Add(7)
    $chartValues.Add(2)
    $chartValues.Add(6)
    $chartValues.Add(5)
    $lineserie3.Values  = $chartValues


$seriesCollection.Add($lineserie1)
$seriesCollection.Add($lineserie2)
$seriesCollection.Add($lineserie3)