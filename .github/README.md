# srt-relay
Relay server for SRT streams between two endpoints.

## Usage
### Setup the server
#### Install Docker
You have to install [Docker](https://docs.docker.com/get-docker/) and [Docker Compose](https://docs.docker.com/compose/install/) to run the server.  

#### Start
```bash
git clone https://github.com/TechnoTUT/srt-relay.git
cd srt-live-server
echo "<your-passphrase>" > .passphrase
docker compose build
docker compose up
```

You must replace `.passphrase` with your own passphrase.  

If you want to run the server in the background, you can use the `-d` option.
```bash
docker compose up -d
```

#### Firewall
If you are using a firewall, you have to open the port `2000/udp` and `3000/udp`.
For example, this is how you can open the ports on `firewalld`.
```bash
firewall-cmd --zone=public --add-port=2000/udp --permanent
firewall-cmd --zone=public --add-port=3000/udp --permanent
firewall-cmd --reload
```

#### Stop
```bash
docker compose down
```

### Stream to the server
You can use any SRT streaming software like [OBS Studio](https://obsproject.com/) to stream to the server.  
Please configure the stream settings as follows:
- URL: `srt://<server-ip>:2000?mode=caller&passphrase=<your-passphrase>&pbkeylen=32`
- Stream key: None

### Watch the stream
You can receive the stream from the server using any SRT compatible player like [VLC](https://www.videolan.org/vlc/index.html) or [OBS Studio](https://obsproject.com/).
Please configure the player settings as follows:
- URL: `srt://<server-ip>:3000?mode=caller&passphrase=<your-passphrase>&pbkeylen=32`