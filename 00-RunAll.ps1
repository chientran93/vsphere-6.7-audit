# Lấy đường dẫn thư mục chứa các file PowerShell
$scriptDirectory = Get-Location

# Lấy danh sách các file PowerShell trong thư mục
$psFiles = Get-ChildItem -Path $scriptDirectory\Script -Filter "*.ps1" -File

# Lặp qua từng file và chạy lần lượt

foreach ($file in $psFiles) {
	write-Output ""
    Write-Host "Running $($file.Name)..."
    & $file.FullName
    Write-Host "Finished running $($file.Name)."
}