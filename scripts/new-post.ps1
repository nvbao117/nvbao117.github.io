# Tao bai viet moi (Windows PowerShell).
# Cach dung:
#   .\scripts\new-post.ps1 "Ten bai viet"
#   .\scripts\new-post.ps1 "Ten bai viet" -Draft

param(
    [Parameter(Mandatory=$true, Position=0)]
    [string]$Title,
    [switch]$Draft
)

function ConvertTo-Slug {
    param([string]$Text)
    $normalized = $Text.Normalize([Text.NormalizationForm]::FormD)
    $sb = New-Object System.Text.StringBuilder
    foreach ($ch in $normalized.ToCharArray()) {
        $cat = [Globalization.CharUnicodeInfo]::GetUnicodeCategory($ch)
        if ($cat -ne [Globalization.UnicodeCategory]::NonSpacingMark) {
            [void]$sb.Append($ch)
        }
    }
    $ascii = $sb.ToString().ToLower() -replace ([char]0x0111),'d' -replace ([char]0x0110),'d'
    $slug = ($ascii -replace '[^a-z0-9]+','-').Trim('-')
    return $slug
}

$slug = ConvertTo-Slug $Title
$date = Get-Date -Format "yyyy-MM-dd"
$datetime = Get-Date -Format "yyyy-MM-dd HH:mm:ss zzz"
$datetime = $datetime -replace ':(\d\d)$','$1'  # +07:00 -> +0700
$filename = "$date-$slug.md"
$imgDir = "assets/img/posts/$date-$slug"

if ($Draft) {
    $postPath = "_drafts/$filename"
} else {
    $postPath = "_posts/$filename"
}

if (Test-Path $postPath) {
    Write-Host "File da ton tai: $postPath" -ForegroundColor Red
    exit 1
}

New-Item -ItemType Directory -Force -Path $imgDir | Out-Null
New-Item -ItemType File -Force -Path "$imgDir/.gitkeep" | Out-Null

$content = @"
---
title: "$Title"
date: $datetime
categories: [Chuyen muc]
tags: [tag1]
math: false
mermaid: false
pin: false
image:
  path: /$imgDir/cover.png
  alt: $Title
---

## Mo bai

<!-- viet mo bai o day -->

## Noi dung

<!-- noi dung chinh -->

## Ket luan

<!-- tom tat -->
"@

Set-Content -Path $postPath -Value $content -Encoding UTF8

Write-Host "[OK] Tao bai viet: $postPath" -ForegroundColor Green
Write-Host "[OK] Folder anh:   $imgDir/" -ForegroundColor Green
if ($Draft) {
    Write-Host "-> Draft. Preview: bundle exec jekyll serve --drafts" -ForegroundColor Yellow
}
