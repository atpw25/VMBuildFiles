#!/bin/bash

sudo apt update
sudo apt install --no-install-recommends -y gnupg2 software-properties-common apt-transport-https wget dirmngr

## Desktop
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install xfce4
sudo apt install xfce4-session

## xrdp
sudo apt install --no-install-recommends -y xrdp
sudo adduser xrdp ssl-cert
echo xfce4-session >~/.xsession
sudo systemctl enable xrdp

## VS Code
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

sudo apt update
sudo apt install --no-install-recommends -y code
# sudo apt install --no-install-recommends -y /tmp/code_1.71.2-1663191218_amd64.deb

## VSCode Extensions
code --install-extension Microsoft/vscode-python
code --install-extension REditorSupport/vscode-R
code --install-extension ManuelHentschel/VSCode-R-Debugger
# code --install-extension /tmp/ms-python.python-2022.15.12631011.vsix
# code --install-extension /tmp/REditorSupport.r-2.5.3.vsix
# code --install-extension /tmp/RDebugger.r-debugger-0.4.7.vsix


## Python 3.8 and Jupyter
sudo apt install --no-install-recommends -y python3.8 python3.8-venv python3.8-dev python3.8-pip jupyter-notebook


## Anaconda
wget https://repo.anaconda.com/archive/Anaconda3-2022.05-Linux-x86_64.sh -o /tmp/anaconda.sh
chmod +x /tmp/anaconda.sh
sudo /bin/bash /tmp/anaconda.sh -b -p /usr/local/anaconda


## R
wget -q https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc -O- | sudo apt-key add -

sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"

sudo apt install --no-install-recommends -y r-base


## RStudio Desktop
wget https://download1.rstudio.org/desktop/bionic/amd64/rstudio-2022.07.2-576-amd64.deb -o /tmp/rstudio-2022.07.2-576-amd64.deb

sudo apy install --no-install-recommends -y /tmp/rstudio-2022.07.2-576-amd64.deb
