﻿<#
#>
function LogFormatter($data, $leveltype)
{    
    $logRecord = @{
        TimeStamp = "$(Get-Date -format dd/MM/yyyy) $(Get-Date -format HH:mm:ss)"
        data = $data
        logLevel = $levelType
    }
    return (ConvertTo-Json $logRecord -Compress)
}$val = LogFormatter -data "hello" -leveltype info