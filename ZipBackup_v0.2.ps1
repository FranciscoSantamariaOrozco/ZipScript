$sourceFolder1 = "C:\Users\vsilva\Documents\U Shadow\FACT ARMAZENAG CLIENTS"
$sourceFolder2 = "Z:\Financeiro"
$destinationFolder = "C:\Users\vsilva\OneDrive - UNIVERSALSHADOW, UNIPESSOAL LDA"

if(-not (Test-Path $destinationFolder)) {
    $createFolder = Read-Host "A pasta $destinationFolder não existe. Quer criá-la? (S/N)"
    if($createFolder -eq "S") {
        New-Item -ItemType Directory -Path $destinationFolder | Out-Null
    } else {
        Write-Host "A pasta não será criada. O script será encerrado."
        return
    }
}

$destinationZip1 = "$destinationFolder\FACT ARMAZENAG CLIENTS_" + (Get-Date).ToString("dd.MM.yyyy") + ".zip"
$destinationZip2 = "$destinationFolder\Financeiro_" + (Get-Date).ToString("dd.MM.yyyy") + ".zip"

if (Test-Path $sourceFolder1) {
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    [IO.Compression.ZipFile]::CreateFromDirectory($sourceFolder1, $destinationZip1)
    Write-Host "O ficheiro ZIP $destinationZip1 foi criado correctamente"
} else {
    Write-Host "A pasta $sourceFolder1 não foi encontrada. O ficheiro ZIP $destinationZip1 não foi criado."
}

if (Test-Path $sourceFolder2) {
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    [IO.Compression.ZipFile]::CreateFromDirectory($sourceFolder2, $destinationZip2)
    Write-Host "O ficheiro ZIP $destinationZip2 foi criado correctamente"
} else {
    Write-Host "A pasta $sourceFolder2 não foi encontrada. O ficheiro ZIP $destinationZip2 não foi criado."
}