FROM ghcr.io/astral-sh/uv:python3.12-bookworm-slim

EXPOSE 8888

# Install system dependencies
RUN apt-get update \
    && apt-get install -y \
    sudo \
    curl \
    git \
    jq \
    tar \
    unzip \
    ca-certificates \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# !!IMPORTANT!!
# THIS SECTION SHOULD NOT BE MODIFIED AS
# IT IS USED TO MAKE THIS IMAGE COMPATIBLE WITH CODER
#######################################################################
ARG USER=coder
RUN useradd --groups sudo --no-create-home --shell /bin/bash ${USER} \
    && echo "${USER} ALL=(ALL) NOPASSWD:ALL" >/etc/sudoers.d/${USER} \
    && chmod 0440 /etc/sudoers.d/${USER}

USER ${USER}
WORKDIR /home/${USER}
########################################################################

# Copy the code into the container
COPY --chown=${USER}:${USER} . /home/${USER}/aieng-template-implementation

# Start the container and run the project setup script
CMD ["bash", "aieng-template-implementation/scripts/setup.sh"]
