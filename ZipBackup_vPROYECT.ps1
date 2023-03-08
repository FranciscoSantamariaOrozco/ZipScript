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

########################################################
$folderPath = "C:\Users\vsilva\OneDrive - UNIVERSALSHADOW, UNIPESSOAL LDA\"

if(-not (Test-Path $folderPath)) {
    $createFolder = Read-Host "La carpeta $folderPath no existe. ¿Deseas crearla? (S/N)"
    if($createFolder -eq "S") {
            New-Item -ItemType Directory -Path $folderPath | Out-Null
        if(Test-Path $folderPath){
            $acl = Get-Acl $folderPath
            $currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name

            if($acl.Access | Where-Object {($_.IdentityReference -match $currentUser) -and (($_.FileSystemRights -match "Write") -or ($_.FileSystemRights -match "FullControl"))}) {
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
            }
            else {
                Write-Host "El usuario actual no tiene permisos de escritura en la carpeta $folderPath."
            }
        }
        else{
            Write-Host "La carpeta $folderPath no existe."
        }
    } else {
        Write-Host "No se creará la carpeta de destino. El script se cerrará."
        return
    }
}