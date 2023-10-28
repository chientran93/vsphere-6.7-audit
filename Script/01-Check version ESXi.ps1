
# Lấy đường dẫn thư mục hiện tại
$currentDirectory = Get-Location

# Đặt tên file và đường dẫn cho file kết quả
$fileName = "01-Check version ESXi.txt"
$filePath = Join-Path -Path $currentDirectory -ChildPath $fileName
# Lệnh PowerShell bạn muốn thực thi và lưu kết quả vào file văn bản
$commandOutput1 = write-output "01-Check version ESXi"
$commandOutput2 = Get-VMHost
# Ghi kết quả vào file văn bản
$commandOutput1 | Out-File -FilePath $filePath -Encoding UTF8
$commandOutput2 | Out-File -FilePath $filePath -Append -Encoding UTF8
# Xuất thông báo sau khi ghi kết quả vào file
Write-Host "Ket qua da duoc xuat vao file: $filePath"
