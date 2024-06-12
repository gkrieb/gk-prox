# Step 1: Install the AD CS role and the Certification Authority service
Install-WindowsFeature -Name ADCS-Cert-Authority -IncludeManagementTools

# Step 2: Import the AD CS deployment module
Import-Module ADCSDeployment

# Step 3: Configure the CA
# Define the CA type, Crypto Provider, and Key Length
$CAType = "EnterpriseRootCA"
$CryptoProvider = "RSA#Microsoft Software Key Storage Provider"
$KeyLength = 2048
$HashAlgorithmName = "SHA256"
$CACommonName = "YourCAName"  # Replace with your CA name

# Install the CA using the specified parameters
Install-AdcsCertificationAuthority -CAType $CAType -CryptoProviderName $CryptoProvider -KeyLength $KeyLength -HashAlgorithmName $HashAlgorithmName -CACommonName $CACommonName -DatabaseDirectory "C:\Windows\system32\CertLog" -LogDirectory "C:\Windows\system32\CertLog" -ValidityPeriod Years -ValidityPeriodUnits 5

# Step 4: Start the Certificate Services
Start-Service -Name CertSvc

# Verify the installation
Get-WindowsFeature -Name ADCS-Cert-Authority