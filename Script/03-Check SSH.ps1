# Lấy đường dẫn thư mục hiện tại
$currentDirectory = Get-Location

# Đặt tên file và đường dẫn cho file kết quả
$fileName = "03-Check SSH.txt"
$filePath = Join-Path -Path $currentDirectory -ChildPath $fileName
# Lệnh PowerShell bạn muốn thực thi và lưu kết quả vào file văn bản
$commandOutput1 = write-Output "03-Check SSH"
$commandOutput1 | Out-File -FilePath $filePath -Encoding UTF8
foreach ($VMhost in (Get-VMHost)) {
    $ServiceList = Get-VMHostService -VMhost $VMhost
    $SSHservice = $ServiceList | Where-Object { $_.Key -eq "TSM-SSH" }
    $status = if ($SSHservice.Running -eq $True) { "running" } else { "stopped" }
    $result = "SSH Server on host $VMhost is $status"
    $result | Out-File -FilePath $filePath -Append -Encoding UTF8
}

# Xuất thông báo sau khi ghi kết quả vào file
Write-Host "Ket qua da duoc xuat vao file: $filePath"

