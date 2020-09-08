$connectTestResult = Test-NetConnection -ComputerName aihubautostorageaccount.file.core.windows.net -Port 445
if ($connectTestResult.TcpTestSucceeded) {
    # Save the password so the drive will persist on reboot
    # $var_password=$args[0]
    cmd.exe /C "cmdkey /add:`"aihubautostorageaccount.file.core.windows.net`" /user:`"Azure\aihubautostorageaccount`" /pass:`"f1ufjeuly2ha8XtydNcooikU9wKOQC7aVo6+ODuUf+Mt6yORfih4XE6AYe0ZF/pvGei4+i+0m+/wjORhPZhhYw==`""
    # Mount the drive
    New-PSDrive -Name R -PSProvider FileSystem -Root "\\aihubautostorageaccount.file.core.windows.net\automationfileshare" -Persist
} else {
    Write-Error -Message "Unable to reach the Azure storage account via port 445. Check to make sure your organization or ISP is not blocking port 445, or use Azure P2S VPN, Azure S2S VPN, or Express Route to tunnel SMB traffic over a different port."
}