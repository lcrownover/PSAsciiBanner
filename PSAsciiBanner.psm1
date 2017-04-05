Function Set-AsciiBanner {
    param (
        [string]$Banner
    )
    $Phrases = Get-Content "$($Env:PSModulePath.split(';')[0])\AsciiBanner\Phrases\phrases.txt"
    $BannerPath = "$($Env:PSModulePath.split(';')[0])\AsciiBanner\Banners\"
    if (!$Banner) {
        $BannerList = @()
        foreach ($b in $(Get-ChildItem $BannerPath)) {
            $BannerList += $b.Name
        }
        $br = Get-Random -Maximum $BannerList.Count
        $Banner = $BannerList[$br]
    }
    $pr = Get-Random -Maximum $Phrases.Count

	$Ascii = (Get-Content -Raw $(Join-Path $BannerPath $Banner))
    $Phrase = $Phrases[$pr]

    Write-Output $Ascii
    Write-Output $Phrase`n`n
}