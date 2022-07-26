FROM ubuntu:20.04 as build

ADD . ./scripts
RUN chmod +x ./scripts/entry.sh
# RUN ./scripts/entry.sh
ENV DEBIAN_FRONTEND noninteractive
# RUN --mount=target=/var/lib/apt/lists,type=cache,sharing=locked \
#     --mount=target=/var/cache/apt,type=cache,sharing=locked \
#     rm -f /etc/apt/apt.conf.d/docker-clean && \
#     apt-get update
RUN apt-get update
RUN apt-get install curl git zsh -y
RUN yes | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN chsh -s $(which zsh)

RUN apt-get install -y make build-essential libssl-dev zlib1g-dev
RUN apt-get install -y libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm
RUN apt-get install -y libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

FROM build
RUN curl https://pyenv.run | bash

RUN echo 'export PATH="${HOME}/.pyenv/bin:${PATH}"' >>~/.zshrc
RUN echo 'eval "$(pyenv virtualenv-init -)"' >>~/.zshrc
ENV PATH "${HOME}/.pyenv/bin:${PATH}"
# RUN eval "$(pyenv virtualenv-init -)"
# RUN pyenv install 3.7.9
# RUN pyenv virtualenv 3.7.9 py37
# RUN pyenv activate py37
