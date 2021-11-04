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
echo "STEP 2: Setup your bash profile\n"
if [[ ! -d "~/bin" ]]; then
    mkdir ~/bin
fi 
echo "export PATH=$PATH:~/bin/" >> ~/.bashrc
echo " done..."
echo ""
echo "=========================================================="
echo ""
echo "STEP 3: Download CEG2722 practicals\n"
cd ~/
wget https://raw.githubusercontent.com/koulali/CEG2722/main/ceg2722.tar.gz
tar -xvzf ceg2722.tar.gz
rm -f ceg2722.tar.gz
cd ~/
echo " done..."
echo ""
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
mv crx2rnx ~/bin/
echo " done..."
echo "=========================================================="
echo ""
echo "STEP 6: Source your profile\n"
echo "export PS1='\h:${nuid}:\w\$ '" >> .bashrc
echo "$USER" > ~/.userinfo
source ~/.bashrc
echo "That's All Folks!"
echo "=========================================================="
echo ""
echo "STEP 7: Create files for Practical 1\n"
echo ""
uname -a > ~/ceg2722/practical/.deskinfo
mkdir ~/ceg2722/practical/prac01
mkdir ~/ceg2722/practical/prac02
for i in {001..100}; do
	touch ~/ceg2722/practical/prac01/file${i}a.dat
	touch ~/ceg2722/practical/prac01/file${i}b.dat
	echo "this is file number: "${i}" a" >> ~/ceg2722/practical/prac01/file${i}a.dat
	echo "this is file number: "${i}" b" >> ~/ceg2722/practical/prac01/file${i}b.dat
done
echo "=========================================================="
echo "" 
echo "That's All Folks!"


