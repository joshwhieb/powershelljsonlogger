<#
#>
function LogFormatter($data, $leveltype)
{
    $dateString = Get-Date -format dd/MM/yyyy;
    $timeString = Get-Date -format HH:mm:ss;     

    return "$dateString $timeString [$levelType]: $data"
}LogFormatter -data "hello" -leveltype info