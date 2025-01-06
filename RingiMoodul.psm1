# RingiMoodul.psm1

function Arvuta-RingiAndmed {
    [CmdletBinding(DefaultParameterSetName = 'Raadius')]
    param(
        [Parameter(Mandatory = $true, Position = 0, ParameterSetName = 'Raadius')]
        [double]$Raadius,

        [Parameter(Mandatory = $true, Position = 0, ParameterSetName = 'Diameeter')]
        [double]$Diameeter
    )

    # Määrame sisendi põhjal raadiuse ja diameetri
    if ($PSCmdlet.ParameterSetName -eq 'Raadius') {
        $diameeter = $Raadius * 2
    }
    else {
        $raadius = $Diameeter / 2
    }

    # Arvutame pindala
    $pindala = [Math]::PI * ($raadius * $raadius)

    # Arvutame ümbermõõdu
    $umbermoot = 2 * [Math]::PI * $raadius

    # Koostame tulemusobjekti
    $tulemus = [PSCustomObject]@{
        Raadius    = $raadius
        Diameeter  = $diameeter
        Pindala    = $pindala
        Ümbermoot = $umbermoot
    }

    # Tagastame tulemuse
    Write-Output $tulemus
}

# Ekspordime funktsiooni
Export-ModuleMember -Function "Arvuta-RingiAndmed"

<#
.SYNOPSIS
Arvutab ringi andmed raadiuse või diameetri põhjal.

.DESCRIPTION
See funktsioon arvutab ringi pindala, ümbermõõdu, raadiuse ja diameetri, kui sisendiks on raadius või diameeter.

.PARAMETER Raadius
Ringi raadius.

.PARAMETER Diameeter
Ringi diameeter.

.EXAMPLE
Arvuta-RingiAndmed -Raadius 7

Tagastab:
Raadius   : 7
Diameeter : 14
Pindala   : 43.98229715026
Ümbermoot : 153.93804002591

.EXAMPLE
Arvuta-RingiAndmed -Diameeter 12

Tagastab:
Raadius   : 6
Diameeter : 12
Pindala   : 37.69911184308
Ümbermoot : 113.09733552924

.NOTES
Autor: Tanel Kuusemets
Versioon: 1.0
#>