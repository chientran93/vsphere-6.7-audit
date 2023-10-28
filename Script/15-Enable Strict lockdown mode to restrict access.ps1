# Lấy đường dẫn thư mục hiện tại
$currentDirectory = Get-Location

# Đặt tên file và đường dẫn cho file kết quả
$fileName = "15-Enable Strict lockdown mode to restrict access.txt"
$filePath = Join-Path -Path $currentDirectory -ChildPath $fileName
# Lệnh PowerShell bạn muốn thực thi và lưu kết quả vào file văn bản
$commandOutput1 = write-Output "15-Enable Strict lockdown mode to restrict access"
$commandOutput1 | Out-File -FilePath $filePath -Encoding UTF8
$esxihosts = Get-VMHost
foreach ($esxihost in $esxihosts) {
    $myhost = Get-VMHost $esxihost | Get-View
    $lockdown = Get-View $myhost.ConfigManager.HostAccessManager
    $lockdown.UpdateViewData()
    $lockdownstatus = $lockdown.LockdownMode
    $result = "####################################################################`r`n"
    $result += "Lockdown mode on $esxihost is set to $lockdownstatus`r`n"
    $result += "####################################################################`r`n"
    $result | Out-File -FilePath $filePath -Append -Encoding UTF8
}
#$commandOutput3 = Get-VMHostService -VMHost * | Where-Object {$_.Key -eq 'slpd' -and $_.Policy -eq 'On'}
# Ghi kết quả vào file văn bản

#$commandOutput3 | Out-File -FilePath $filePath -Append -Encoding UTF8
# Xuất thông báo sau khi ghi kết quả vào file
Write-Host "Ket qua da duoc xuat vao file: $filePath"



