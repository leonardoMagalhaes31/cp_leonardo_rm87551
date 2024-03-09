function Scan-Ports {
    param (
        [string]$hostname,
        [int[]]$ports
    )

    foreach ($port in $ports) {
        $tcpClient = New-Object System.Net.Sockets.TcpClient
        $result = $tcpClient.BeginConnect($hostname, $port, $null, $null)
        Start-Sleep -Milliseconds 500  # Espera um pouco antes de verificar a conexão
        if ($tcpClient.Connected) {
            Write-Host "Port $port is open"
            $tcpClient.Close()
        } else {
            Write-Host "Port $port is closed"
        }
    }
}

# Defina o hostname e a lista de portas a serem verificadas
$hostname = "google.com"
$ports = @(80, 22, 30000)

# Chama a função Scan-Ports com o hostname e a lista de portas
Scan-Ports -hostname $hostname -ports $ports
