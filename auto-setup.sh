apt-get update
apt-get install curl git zsh -y
yes | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s $(which zsh)

apt-get install -y make build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

curl https://pyenv.run | bash
echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >>~/.zshrc
echo 'eval "$(pyenv virtualenv-init -)"' >>~/.zshrc
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv virtualenv-init -)"
pyenv install 3.7.9
pyenv virtualenv 3.7.9 py37
pyenv activate py37
