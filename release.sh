#!/bin/bash -e

# This script builds mac x86 binaries and packages them for testing

# Note : generation of OSX x86 build

gcc setup/tool.c -o setup_t
./setup_t -m II -mem 8M -t mc64 -hres 512 -vres 342 -speed a -magnify 0 -depth 0 > setup.sh 
bash ./setup.sh
make
plutil -replace NSHighResolutionCapable -string 0 minivmac.app/Contents/Info.plist
rm -rf MacOS_x86_se30
mkdir -p MacOS_x86_se30 && mv minivmac.app MacOS_x86_se30
cp MacII.ROM MacOS_x86_se30
zip -r MacOS_x86_se30.zip MacOS_x86_se30
