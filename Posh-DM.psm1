function Start-Combat {
    [CmdletBinding()]
    param (
        [Parameter()]
        [Int32]
        $TotalCombatants
    )
    
    $counter = 0

    $list = @()

    while ($counter -lt $TotalCombatants) {

        $name = Read-Host -Prompt "Enter Combatant Name"
        $init = Read-Host -Prompt "Enter Init for $name"
        $ac = Read-Host -Prompt "Enter AC for $name"
        $hp = Read-Host -Prompt "Enter HP for $name"

        
        $fighter = New-Combatant -Name $name -HP $hp -Init $init -AC $ac
        
        $counter++

        $list += $fighter

    }

    return $list

}


function New-Combatant {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]$Name,
        
        # Parameter help description
        [Parameter()]
        [string]$HP,

        # Parameter help description
        [Parameter()]
        [string]$Init,

        [Parameter()]
        [string]$AC
    )

    return [PSCustomObject]@{
        Name = "$($Name)"
        HP = "$($HP)"
        Init = "$($Init)"
        AC = "$($AC)"
    }
}