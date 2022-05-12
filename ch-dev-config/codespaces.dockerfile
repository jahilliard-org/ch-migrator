ARG VARIANT="18-bullseye"
FROM mcr.microsoft.com/vscode/devcontainers/typescript-node:0-${VARIANT}

RUN sudo apt-get update && \
	sudo apt-get install -y apt-transport-https ca-certificates dirmngr && \
	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 8919F6BD2B48D754 && \
	echo "deb https://packages.clickhouse.com/deb stable main" | sudo tee /etc/apt/sources.list.d/clickhouse.list && \
	sudo apt-get update && \
	sudo apt-get install -y clickhouse-client netcat

# RUN sudo apt-get update \
#   && sudo apt-get install build-essential \

# COPY "Brewfile" "Brewfile"

# Setup homebrew & install main deps
# RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" \
#   && echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /root/.profile \
#   && echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /root/.bashrc \
#   && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" \
#   && brew bundle \
#   && curl --proto '=https' --tlsv1.2 -sSf https://sh.vector.dev | bash -s -- -y
