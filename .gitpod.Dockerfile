FROM gitpod/workspace-full

RUN sudo apt-get update
RUN sudo apt-get install -y vim tree curl build-essential make gcc sudo less git rsync
RUN sudo apt-get install -y libunwind-dev
RUN sudo apt-get clean

# DFX
RUN wget https://sdk.dfinity.org/install.sh -O /tmp/install-sdk.sh \
 && sh -c 'yes Y | DFX_VERSION=1.18.0 sh /tmp/install-sdk.sh'

RUN rustup target add wasm32-unknown-unknown
RUN echo "export PATH=/home/gitpod/bin/:$PATH" > ~/.bashrc

# Oh my zsh
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
