#!/bin/sh

cvbdldir=".cvb"
cvbdllink="https://ftp.commonvisionblox.com/webdavs/forum/setups/cvb/linux-x86_64/cvb-13.03.004-ubu1804-x86_64.zip"

# download only needed on completly new workspace
if [ ! -d "$cvbdldir" ]; then
    mkdir -p "$cvbdldir"
    cd "$cvbdldir"
    wget "$cvbdllink"
    unzip cvb-*
# the CVB installation is not persistent as it is outside the workspace
else
    cd "$cvbdldir"     
fi

# we cannot install codemeter as it requires some ubs stuff and there is nothing in this container
sudo dpkg -i --ignore-depends=codemeter cvb-camerasuite-13.03.004-ubu1804-x86_64.deb
sudo dpkg -i --ignore-depends=codemeter cvb-camerasuite-dev-13.03.004-ubu1804-x86_64.deb
sudo dpkg -i --ignore-depends=codemeter cvb-foundation-13.03.004-ubu1804-x86_64.deb
sudo dpkg -i --ignore-depends=codemeter cvb-foundation-dev-13.03.004-ubu1804-x86_64.deb
sudo dpkg -i --ignore-depends=codemeter cvb-tools-13.03.004-ubu1804-x86_64.deb
sudo dpkg -i --ignore-depends=codemeter cvb-tools-dev-13.03.004-ubu1804-x86_64.deb
source /etc/profile.d/stemmer_environment.sh
cd -
cd /opt/cvb/python
python -m pip install *.whl --force-reinstall
cd -
