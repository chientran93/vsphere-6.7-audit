# Lấy đường dẫn thư mục hiện tại
$currentDirectory = Get-Location

# Đặt tên file và đường dẫn cho file kết quả
$fileName = "49-Ensure that VDS Netflow traffic is only being sent to authorized collector IPs.txt"
$filePath = Join-Path -Path $currentDirectory -ChildPath $fileName
# Lệnh PowerShell bạn muốn thực thi và lưu kết quả vào file văn bản
$commandOutput1 = write-Output "49-Ensure that VDS Netflow traffic is only being sent to authorized collector IPs"
$commandOutput2 = Get-VDPortgroup | Select Name, VirtualSwitch, @{Name="NetflowEnabled";Expression={$_.Extensiondata.Config.defaultPortConfig.ipfixEnabled.Value}} | Where-Object {$_.NetflowEnabled -eq "True"}
#$commandOutput3 = Get-VirtualPortGroup | Get-SecurityPolicy | select VirtualPortGroup, AllowPromiscuous
# Ghi kết quả vào file văn bản
$commandOutput1 | Out-File -FilePath $filePath -Encoding UTF8
$commandOutput2 | Out-File -FilePath $filePath -Append -Encoding UTF8
#$commandOutput3 | Out-File -FilePath $filePath -Append -Encoding UTF8
# Xuất thông báo sau khi ghi kết quả vào file
Write-Host "Ket qua da duoc xuat vao file: $filePath"



