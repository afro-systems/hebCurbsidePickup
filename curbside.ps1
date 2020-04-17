#!/bin/pwsh
function Get-HEBCurbSideTimes {
    param (
        [string]$ZipCode,
        [int]$Radius
    )

    # H-E-B REST API
    $Url = "https://www.heb.com/commerce-api/v1/store/locator/address"
    $ContentType = 'application/json'
    $Body = @{
        address                   =   $ZipCode
        curbsideOnly              =   $true
        radius                    =   $radius
        nextAvailableTimeslot     =   $true
        includeMedical            =   $false
    } | ConvertTo-Json

    # Retrieve Data
    $times = Invoke-RestMethod -Method Post -Uri $Url -Body $body -ContentType $ContentType
    $list = @()    

    # Parse and Return List
    foreach ($time in $times.stores){
        if ($time.storeNextAvailableTimeslot.nextAvailableTimeslotDate) {
            $t = [PSCustomObject]@{
                Store                    = $time.store.name
                NextAvailableTimeSlot    = $time.storeNextAvailableTimeslot.nextAvailableTimeslotDate
                'Distance (mi)'          = [System.Math]::Round($time.distance, 2)
                Address                  = $time.store.address1
                'Store Hours'            = $time.store.storeHours
            }
            $list += $t 
        }
        else {
            continue
        }
    }

    return $list | Sort-Object -Property NextAvailableTimeSlot | Format-List
}

Get-HEBCurbSideTimes -ZipCode 78240 -Radius 5