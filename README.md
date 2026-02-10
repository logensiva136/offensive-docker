# Offensive Security Testing Docker Image

A comprehensive Docker image for penetration testing and security research based on Kali Linux.

## ⚠️ Legal Disclaimer

**IMPORTANT**: This image is intended for:
- Authorized penetration testing only
- Educational and research purposes
- Testing systems you own or have explicit permission to test

Unauthorized access to computer systems is illegal. Always obtain proper authorization before conducting security assessments.

## Included Tools

### Reconnaissance
- **ReconFTW** - Automated reconnaissance framework
- **Recon-ng** - Web reconnaissance framework
- **Subfinder** - Subdomain discovery
- **Nuclei** - Vulnerability scanner
- **Nmap** - Network mapper
- **Masscan** - Fast port scanner

### Web Application Testing
- **Burp Suite** - Web security testing
- **Nikto** - Web server scanner
- **SQLMap** - SQL injection tool
- **httpx** - HTTP toolkit

### Exploitation
- **Metasploit Framework** - Penetration testing framework
- **Impacket** - Network protocols toolkit

### Password Attacks
- **Hydra** - Password cracking
- **John the Ripper** - Password cracker
- **Hashcat** - Advanced password recovery

### Wireless
- **Aircrack-ng** - WiFi security auditing

### Network Analysis
- **Wireshark** - Network protocol analyzer
- **tcpdump** - Packet analyzer

### Wordlists
- RockYou
- SecLists

## Building the Image

```bash
# Build the image
docker build -t offensive-security:latest .

# Or use docker-compose
docker-compose build
```

## Running the Container

### Using Docker
```bash
docker run -it --rm \
  --name pentest \
  --network host \
  --cap-add=NET_ADMIN \
  --cap-add=NET_RAW \
  -v $(pwd)/workspace:/workspace \
  -v $(pwd)/results:/results \
  offensive-security:latest
```

### Using Docker Compose
```bash
# Start the container
docker-compose up -d

# Access the container
docker-compose exec pentest bash

# Stop the container
docker-compose down
```

## Usage Examples

### ReconFTW
```bash
cd /opt/reconftw
./reconftw.sh -d example.com -r
```

### Recon-ng
```bash
cd /opt/recon-ng
python3 recon-ng
```

### Subfinder
```bash
subfinder -d example.com -o /results/subdomains.txt
```

### Nuclei
```bash
nuclei -u https://example.com -o /results/vulnerabilities.txt
```

### Nmap
```bash
nmap -sV -sC -oA /results/nmap_scan 192.168.1.0/24
```

### Metasploit
```bash
msfconsole
```

## Directory Structure

- `/workspace` - Your working directory (mounted from host)
- `/results` - Store scan results here (mounted from host)
- `/opt/reconftw` - ReconFTW installation
- `/opt/recon-ng` - Recon-ng installation
- `/usr/share/wordlists` - Wordlists directory

## Notes

- The container runs with `--privileged` and `--network host` for full network access
- Make sure to create `workspace` and `results` directories on your host before running
- Some tools may require API keys (configure in respective tool directories)

## Security Considerations

1. Only use on networks and systems you are authorized to test
2. Store this image securely
3. Don't expose the container to untrusted networks
4. Keep tools updated regularly
5. Document all testing activities

## Updating Tools

```bash
# Update system packages
apt-get update && apt-get upgrade -y

# Update Go tools
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

# Update ReconFTW
cd /opt/reconftw && git pull

# Update Nuclei templates
nuclei -update-templates
```

## License

This image packages open-source security tools. Respect the individual licenses of each tool included.
