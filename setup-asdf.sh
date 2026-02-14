asdf uninstall crystal 

sudo apt update
sudo apt install -y \
  build-essential \
  libssl-dev \
  libyaml-dev \
  libgmp-dev \
  libz-dev \
  libevent-dev \
  libxml2-dev \
  libpcre2-dev \
  libreadline-dev

asdf install crystal 1.19.1
asdf global crystal 1.19.1