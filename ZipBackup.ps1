# $sourceFolder1 = "C:\Users\vsilva\Documents\U Shadow\FACT ARMAZENAG CLIENTS"
# $sourceFolder2 = "Z:\Financeiro"
# $destinationZip = " C:\Users\vsilva\OneDrive - UNIVERSALSHADOW, UNIPESSOAL LDA\" + (Get-Date).ToString("ddMMyyyy") + ".zip"

$sourceFolder1 = "C:\Prueba1"
$sourceFolder2 = "C:\Prueba2"
$destinationZip1 = " C:\Destino\Prueba1_" + (Get-Date).ToString("ddMMyyyy") + ".zip"
$destinationZip2 = " C:\Destino\Prueba2_" + (Get-Date).ToString("ddMMyyyy") + ".zip"

Add-Type -AssemblyName System.IO.Compression.FileSystem
[IO.Compression.ZipFile]::CreateFromDirectory($sourceFolder1, $destinationZip1)
[IO.Compression.ZipFile]::CreateFromDirectory($sourceFolder2, $destinationZip2)