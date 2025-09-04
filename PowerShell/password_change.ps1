# Script to change Local user's Passowrd

# ask for user name
$userName = Read-Host "Enter username"

try {

    # search for local user and if not found stop
    $localUser = Get-LocalUser -Name $username -ErrorAction Stop
    
    # User found 
   $newPassword =  Read-Host "$localUser found, please change password" -AsSecureString

    # Set Password for Local user
    $localuser | Set-localUser -Name $userName -Password $newPassword

    # Confirm Password change
    Write-Host "Password Succesfully change for $userName" -ForegroundColor Cyan
    
}
catch {
    # User not found
    Write-Host "Error: $userName not found on server, please contact admin" -ForegroundColor Red
}