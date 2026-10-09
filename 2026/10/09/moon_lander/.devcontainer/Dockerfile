FROM docker.nix-community.org/nixpkgs/devcontainer:latest-x86_64-linux

# avoid VSCode failing with the following error
# Warning: Can't find libstdc++.so or ldconfig, can't verify libstdc++ version
# Warning: Missing GLIBCXX >= 3.4.25! from
# Warning: Can't find libc.so or ldconfig, can't verify libc version
# Warning: Missing GLIBC >= 2.28! from
# Error: Missing required dependencies. Please refer to our FAQ https://aka.ms/vscode-remote/faq/old-linux for additional information.
RUN echo 'ID=nixos' >>/etc/os-release

# allow nix-flake
COPY ./nix.conf /etc/nix/nix.conf

# make stuff installed with nix profile add usable
RUN echo "export PATH+=\":~/.nix-profile/bin/\"" >>/etc/profile

# install DirEnv
RUN nix profile add 'nixpkgs#direnv'
RUN echo 'eval "$(direnv hook bash)"' >>/etc/bashrc
