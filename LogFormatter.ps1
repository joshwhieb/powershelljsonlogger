<#
#>
function LogFormatter
{
    $obj = New-Object PSObject -Property @{        
    };
    
    $obj | Add-Member -MemberType ScriptMethod -Name getDate -Value {
    
        $dateString = Get-Date -format dd/MM/yyyy;
        $timeString = Get-Date -format HH:mm:ss;     
        return $dateString,$timeString
    };       
    
    $obj | Add-Member -MemberType ScriptMethod -Name FormatData -Value {
        
        param($data, $levelType)

        $date, $time = $this.getDate()

        return "$date $time [$levelType]: $data"


    };

    $obj | Add-Member -MemberType ScriptMethod -Name log -Value {
    
        param($data,$levelType);
        
        $dataToLog = $this.FormatData($data,$levelType);       
		return $dataToLog    
    };
    
    <#
        Function: Destroy
        Purpose: Destructor for the class
            
        Params: none
        Returns: none
    #>
    $obj | Add-Member -MemberType ScriptMethod -Name Destroy -Value {
                
    };
        
    <#
        Return object closure
    #>
    return $obj;
}