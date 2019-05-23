foreach($i in Get-ChildItem -Recurse) {
    if ($i.PSIsContainer) {
        continue
    }

    $dest = $i.Fullname.Replace($PWD, "converted_files")

    if (!(Test-Path $(Split-Path $dest -Parent))) {
        New-Item $(Split-Path $dest -Parent) -type Directory
    }

    $extn = [IO.Path]::GetExtension($i.Fullname)
    
    if ($extn -ne ".srt" )
    {
        continue
    }

    try {
        $content = [IO.File]::ReadAllText($i.Fullname, [Text.Utf8Encoding]::new($false, $true))
    } catch [System.Text.DecoderFallbackException] {
        # Fall back to Windows-1251
        $content = [IO.File]::ReadAllText($i.Fullname, [Text.Encoding]::GetEncoding(1251))
    } 

    $content | out-file -encoding utf8 -filepath $dest
}

Read-Host -Prompt "All Done! Press Enter to exit."