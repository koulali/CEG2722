#!/bin/bash
#
# script to prepare the linux environment for the module ceg2722 
# under the Newcastle Linux system.
#
#
echo "==========================================================="
echo "|                                                         |"
echo "| Welcome to CEG2722 - part2: Linux data processing       |"
echo "|              AY 2021 - 2022                             |"
echo "|                                                         |"
echo "==========================================================="
echo ""
echo ""
echo ""
echo "=========================================================="
echo ""
echo "STEP 0: Check ID\n"
echo -n "Enter your 5-digit ID " 
read nuid
echo ""
echo "=========================================================="
echo "STEP 1: Make sure you do have wget and curl"
if ! [[ -x "$(command -v wget)" && -x "$(command -v curl)" ]]; then
  echo "Error: wget and/or curl is not installed." >&2
  exit 1
else
	echo "Great, lets go"
fi
echo ""
echo "=========================================================="
echo ""
echo "STEP 2: clone CEG2722 \n"
if ! [[ -x "$(command -v git)" ]]; then
	sudo apt install git
else
	echo "Great, git is already here"
fi
git clone https://github.com/koulali/ceg2722.git
cd ~/
echo ""
echo "=========================================================="
echo ""
echo "STEP 3: Setup your bash profile\n"
if [[ ! -d "~/bin" ]]; then
    mkdir ~/bin
fi 
echo "export PATH=$PATH:~/bin/" >> ~/.bashrc
echo " done..."
echo "=========================================================="
echo ""
echo "STEP 4: Download TEQC\n"
wget https://www.unavco.org/software/data-processing/teqc/development/teqc_CentOSLx86_64d.zip
unzip teqc_CentOSLx86_64d.zip
mv teqc ~/bin/
rm -f teqc_CentOSLx86_64d.zip
echo " done..."
echo "=========================================================="
echo ""
echo "STEP 5: Download CRX2RNX\n"
mv ~/ceg2722/crx2rnx ~/bin/
chmod +x ~/bin/crx2rnx
echo " done..."
echo "=========================================================="
echo ""
echo "STEP 6: Source your profile\n"
echo "export PS1='\h:${nuid}:\w\$ '" >> .bashrc
echo "$USER" > ~/.userinfo
source ~/.bashrc
echo " done..."
echo "=========================================================="
echo ""
echo "STEP 7: Create files for Practicals 1 and 2 \n"
echo ""
uname -a > ~/ceg2722/practical/.deskinfo
for i in {001..100}; do
	touch ~/ceg2722/practical/prac01/file${i}a.dat
	touch ~/ceg2722/practical/prac01/file${i}b.dat
	echo "this is file number: "${i}" a" >> ~/ceg2722/practical/prac01/file${i}a.dat
	echo "this is file number: "${i}" b" >> ~/ceg2722/practical/prac01/file${i}b.dat
done
echo "=========================================================="
echo ""
source ~/.bashrc
echo "That's All Folks!"


