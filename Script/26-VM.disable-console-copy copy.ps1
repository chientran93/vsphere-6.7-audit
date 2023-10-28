# Lấy đường dẫn thư mục hiện tại
$currentDirectory = Get-Location

# Đặt tên file và đường dẫn cho file kết quả
$fileName = "26-VM.disable-console-copy.txt"
$filePath = Join-Path -Path $currentDirectory -ChildPath $fileName
# Lệnh PowerShell bạn muốn thực thi và lưu kết quả vào file văn bản
$commandOutput1 = write-Output "26-VM.disable-console-copy"
$commandOutput2 = Get-VM | Get-AdvancedSetting -Name "isolation.tools.copy.disable" | where {$_.value -eq "False"} | Select Entity, Name, Value
#$commandOutput3 = Get-VMHostService -VMHost * | Where-Object {$_.Key -eq 'slpd' -and $_.Policy -eq 'On'}
# Ghi kết quả vào file văn bản
$commandOutput1 | Out-File -FilePath $filePath -Encoding UTF8
$commandOutput2 | Out-File -FilePath $filePath -Append -Encoding UTF8
#$commandOutput3 | Out-File -FilePath $filePath -Append -Encoding UTF8
# Xuất thông báo sau khi ghi kết quả vào file
Write-Host "Ket qua da duoc xuat vao file: $filePath"



