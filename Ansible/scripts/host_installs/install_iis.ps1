# Step 1: Install IIS server feature
Install-WindowsFeature -Name Web-Server -IncludeManagementTools

# Step 2: Create a certificate request and get it approved by the CA authority
$certRequestInf = New-Object -ComObject X509Enrollment.CX509CertificateRequestPkcs10
$certRequestInf.InitializeFromTemplateName(0, "WebServer")
$enrollment = New-Object -ComObject X509Enrollment.CX509Enrollment
$enrollment.InitializeFromRequest($certRequestInf)
$certRequestInf.Subject = "CN=your_domain_controller"  # Replace with your actual domain controller

# Generate CSR (Certificate Signing Request)
$csr = $enrollment.CreateRequest(0)
$csrFile = "C:\CSR\certrequest.csr"
$csr | Out-File -FilePath $csrFile

# Submit CSR to CA (assuming CA is configured to auto-approve requests)
$cert = Get-CertificationAuthority | Submit-CertRequest -FilePath $csrFile

# Install the certificate
$certPath = "C:\Certs\your_certificate.cer"
$cert | Export-Certificate -FilePath $certPath
Import-Certificate -FilePath $certPath -CertStoreLocation Cert:\LocalMachine\My

# Step 3: Create an HTTPS binding using the CA-approved certificate
$certThumbprint = (Get-ChildItem -Path Cert:\LocalMachine\My | Where-Object { $_.Subject -eq "CN=your_domain_controller" }).Thumbprint
netsh http add sslcert ipport=0.0.0.0:443 certhash=$certThumbprint appid='{00000000-0000-0000-0000-000000000000}'

# Step 4: Create an index.html file and host it as static content
$htmlContent = @"
<!DOCTYPE html>
<html>
<head>
  <title>Welcome to My Website</title>
</head>
<body>
  <h1>Hello, World!</h1>
  <p>This is a sample index.html file hosted on IIS.</p>
</body>
</html>
"@
$htmlContent | Set-Content -Path "C:\inetpub\wwwroot\index.html" -Encoding UTF8

# Restart IIS to apply changes
Restart-Service -Name W3SVC