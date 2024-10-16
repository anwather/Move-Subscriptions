param($FileName, [switch]$Process)

<#
CSV Format
SubscriptionId,ManagementGroupId
01e2f327-74ac-451e-8ad9-1f923a06d634,test-mg1
9340b969-11af-4fb4-bf4c-daffdd353d8f,test-mg2
#>

$list = Import-Csv $FileName

foreach ($item in $list) {
    $SubscriptionId = $item.SubscriptionId
    $ManagementGroupId = $item.ManagementGroupId
    $ManagementGroup = Get-AzManagementGroup -GroupName $ManagementGroupId -Expand

    if ((($ManagementGroup.Children) | Where-Object Type -eq "/subscriptions").Name -contains $SubscriptionId) {
        Write-Output "Subscription $($item.SubscriptionId) already exists in Management Group $($item.ManagementGroupId)"
    }
    else {
        Write-Output "Moving Subscription $($item.SubscriptionId) to Management Group $($item.ManagementGroupId)"
        if ($Process) {
            New-AzManagementGroupSubscription -SubscriptionId $SubscriptionId -GroupName $ManagementGroupId
        }
        else {
            New-AzManagementGroupSubscription -SubscriptionId $SubscriptionId -GroupName $ManagementGroupId -WhatIf
        }
        
    }

}