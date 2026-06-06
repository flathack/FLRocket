# generate-manifest.ps1
# Place this script in the server-side directory
# Run it using powershell to generate the 'files.json' file manifest.

$ErrorActionPreference = "Stop"

$currentDir = Get-Item .
Write-Host "Generating file manifest for: $($currentDir.FullName)"

# Get all files recursively
$files = Get-ChildItem -Path $currentDir.FullName -Recurse -File

$manifest = @()

foreach ($file in $files) {
    # Get path relative to the current directory manually (for PS 5.1 compatibility)
    $relPath = $file.FullName.Substring($currentDir.FullName.Length)
    if ($relPath.StartsWith("\") -or $relPath.StartsWith("/")) {
        $relPath = $relPath.Substring(1)
    }
    
    # Clean up the relative path format
    $relPath = $relPath -replace '\\', '/'
    
    # Skip manifest generation script, the manifest itself, the changelog, and any git repository files
    if ($relPath -eq "generate-manifest.ps1" -or `
        $relPath -eq "files.json" -or `
        $relPath -eq "changelog.md" -or `
        $relPath -like ".git*" -or `
        $relPath -like "*/.git*") {
        continue
    }
    
    Write-Host "Processing: $relPath"
    
    # Calculate SHA256 hash
    $hash = (Get-FileHash -Path $file.FullName -Algorithm SHA256).Hash.ToLower()
    
    $manifest += [PSCustomObject]@{
        path = $relPath
        size = $file.Length
        hash = $hash
    }
}

# Save as UTF-8 files.json (without BOM)
$jsonPayload = $manifest | ConvertTo-Json -Depth 5
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText((Join-Path $currentDir.FullName "files.json"), $jsonPayload, $utf8NoBom)

Write-Host "Success! Created files.json with $($manifest.Count) files."
