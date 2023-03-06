$sourceFolder1 = "C:\Users\vsilva\Documents\U Shadow\FACT ARMAZENAG CLIENTS"
$sourceFolder2 = "Z:\Financeiro"
$destinationFolder = "C:\Users\vsilva\OneDrive - UNIVERSALSHADOW, UNIPESSOAL LDA\"
$dateStamp = (Get-Date).ToString("dd.MM.yyyy")
$baseName1 = "FACT ARMAZENAG CLIENTS_"
$baseName2 = "Financeiro_"

for ($i = 1; $i -le 2; $i++) {
    $destinationZip = $destinationFolder + $baseName1 + $dateStamp + ".zip"
    
    if (Test-Path $destinationZip) {
        $counter = 1
        while (Test-Path $destinationZip -PathType Leaf) {
            if ($counter -ge 3) {
                Write-Host "Se han alcanzado el máximo copias del archivo zip en el destino."
                break
            }
            $destinationZip = $destinationFolder + $baseName1 + $dateStamp + "_" + $counter + ".zip"
            $counter++
        }
    }
    
    if (Test-Path ${"sourceFolder$i"}) {
        Add-Type -AssemblyName System.IO.Compression.FileSystem
        [IO.Compression.ZipFile]::CreateFromDirectory(${"sourceFolder$i"}, $destinationZip)
    } else {
        Write-Host "La ruta de la carpeta de origen $i no existe."
        continue
    }
}