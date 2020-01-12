# ===================================================
# Script To list In-Place Upgrade performed on a computer
# Dev4sys
# ===================================================


Function Convert-BuildInstallDate()
{
    Param(
        [int]$InstallDate
    )
    (Get-Date "1970-01-01 00:00:00.000Z") + ([TimeSpan]::FromSeconds($InstallDate))

}


# Get the release ID form a refitry Path
Function Get-BuildInstallDate()
{
    Param(
        [string]$RegKeyPath
    )
    try
    {
        $releaseID = (Get-ItemProperty -Path $RegKeyPath | Select-Object -ExpandProperty "InstallDate" -ErrorAction Stop)
    }
    catch{
        $releaseID = ""
    }

    return $releaseID

}


# Get the release ID form a refitry Path
Function Get-ReleaseID()
{
    Param(
        [string]$RegKeyPath
    )
    try
    {
        $releaseID = (Get-ItemProperty -Path $RegKeyPath | Select-Object -ExpandProperty "ReleaseID" -ErrorAction Stop)
    }
    catch{
        $releaseID = "0000"
    }

    return $releaseID

}


Function Get-CurrentReleaseId()
{
    # return releaseID of current OS build
    $ReleaseID = Get-ReleaseID -RegKeyPath 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion'
    return $ReleaseID
}


Function Get-CurrentBuildInstallTime()
{
    $InstallTime = $(Convert-BuildInstallDate -InstallDate $(Get-BuildInstallDate -RegKeyPath 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion'))
    return $InstallTime
}


Function Get-InplaceUpgradeList()
{
    $InstallDates = @()
    [uint16]$Count = 0

    # Check all registry value for all previous version
    If (Test-Path 'HKLM:\SYSTEM\Setup\Source OS*') {

        $SubKeys = Get-ItemProperty -Path 'HKLM:\SYSTEM\Setup\Source OS*' -Name "InstallDate" | Sort-Object InstallDate
 
        ForEach ($SubKey in $SubKeys) {
       
            $temp = New-Object -TypeName PSObject
            $temp | Add-Member -Type NoteProperty -Name Index -Value $Count
            $temp | Add-Member -Type NoteProperty -Name ReleaseId -Value $(Get-ReleaseID -RegKeyPath $SubKey.PSPath)
            $temp | Add-Member -Type NoteProperty -Name InstallDate -Value $(Convert-BuildInstallDate -InstallDate $(Get-BuildInstallDate -RegKeyPath $SubKey.PSPath))
                   
            $InstallDates += $temp
            $count++

        }
    }


    $temp = New-Object -TypeName PSObject
    $temp | Add-Member -Type NoteProperty -Name InstallDate -Value $(Get-CurrentBuildInstallTime)
    $temp | Add-Member -Type NoteProperty -Name ReleaseId -Value $(Get-CurrentReleaseId)
    $temp | Add-Member -Type NoteProperty -Name Index -Value $Count
    $InstallDates += $temp


    return $InstallDates

}


Function Get-ReleaseLifespan()
{
    Param(
        [Datetime]$Start,
        [Datetime]$End
    )
    $timeStamp = New-TimeSpan -Start $Start -End $End
    return $timeStamp
}



Function Get-LifeSpanPerBuild()
{

    $upgradeList = Get-InplaceUpgradeList
    $Count = 0
    $length = $upgradeList.Length
 
    ForEach ($upgrade in $upgradeList) {
       
        if($Count -lt $length-1){
            $Lifespan = Get-ReleaseLifespan -Start $upgrade.InstallDate -End $upgradeList[$Count+1].InstallDate
        }
        else
        {
            $Lifespan = Get-ReleaseLifespan -Start $upgrade.InstallDate -End $(Get-Date)
        }

        $upgrade | Add-Member -Type NoteProperty -Name LifeCycle -Value $Lifespan.Days
        $count++
    }

    return $upgradeList

}


# ==============================
# End Script Upgrade
# ==============================