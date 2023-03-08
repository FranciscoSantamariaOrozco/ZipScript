$sourceFolder1 = "C:\Users\vsilva\Documents\U Shadow\FACT ARMAZENAG CLIENTS\"
$sourceFolder2 = "Y:\Financeiro"
$destinationZip1 = "C:\Users\vsilva\OneDrive - UNIVERSALSHADOW, UNIPESSOAL LDA\FACT ARMAZENAG CLIENTS_" + (Get-Date).ToString("dd.MM.yyyy") + ".zip"
$destinationZip2 = "C:\Users\vsilva\OneDrive - UNIVERSALSHADOW, UNIPESSOAL LDA\Financeiro_" + (Get-Date).ToString("dd.MM.yyyy") + ".zip"

if (Test-Path $sourceFolder1) {
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    [IO.Compression.ZipFile]::CreateFromDirectory($sourceFolder1, $destinationZip1)
} else {
    continue
}

if (Test-Path $sourceFolder2) {
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    [IO.Compression.ZipFile]::CreateFromDirectory($sourceFolder2, $destinationZip2)
} else {
    continue
}