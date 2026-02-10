# Offensive Security Testing Docker Image
# Based on Kali Linux with popular pentesting tools

FROM kalilinux/kali-rolling:latest

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8

# Update and install base tools
RUN apt-get update && apt -y install kali-linux-headless && apt-get upgrade -y && \
    apt-get install -y \
    git \
    python3 \
    python3-pip \
    golang-go \
    wget \
    curl \
    unzip \
    nano \
    vim \
    net-tools \
    dnsutils \
    nmap \
    masscan \
    nikto \
    sqlmap \
    metasploit-framework \
    burpsuite \
    hydra \
    john \
    hashcat \
    aircrack-ng \
    wireshark \
    tcpdump \
    exploitdb \
    wordlists \
    seclists
    # seclists /
    # && rm -rf /var/lib/apt/lists/*

# Install ReconFTW
RUN git clone https://github.com/six2dez/reconftw /opt/reconftw && \
    cd /opt/reconftw && \
    chmod +x reconftw.sh install.sh && \
    ./install.sh

# Install Recon-ng
RUN git clone https://github.com/lanmaster53/recon-ng.git /opt/recon-ng && \
    cd /opt/recon-ng && \
    pip3 install -r REQUIREMENTS --break-system-packages

# Install additional reconnaissance tools
RUN go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest && \
    go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest && \
    go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest && \
    go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest && \
    go install -v github.com/tomnomnom/assetfinder@latest && \
    go install -v github.com/tomnomnom/waybackurls@latest

# Add Go binaries to PATH
ENV PATH="/root/go/bin:${PATH}"

# Install additional Python tools
RUN pip3 install --break-system-packages \
    impacket \
    pwntools \
    requests \
    beautifulsoup4 \
    scapy

# Create working directory
WORKDIR /workspace

# Set up wordlists
RUN gunzip /usr/share/wordlists/rockyou.txt.gz 2>/dev/null || true

# Default command
CMD ["/bin/bash"]
