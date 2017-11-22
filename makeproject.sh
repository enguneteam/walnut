#!/bin/bash
options=("Unix makefile" "XCode" "Code Blocks" "Eclipse CDT4" "Make DEB" "exit")
width=25
cols=3
for ((i=0;i<${#options[@]};i++)); do 
  string="$(($i+1))) ${options[$i]}"
  printf "%s" "$string"
  printf "%$(($width-${#string}))s" " "
  [[ $(((i+1)%$cols)) -eq 0 ]] && echo
done
echo
read -p '#? ' opt
case $opt in
1)
    echo "${options[$opt-1]}"
    rm -dr build/unix
    mkdir build/unix
    cd build/unix
    cmake ../../ -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release
    make
    cd ..
    ;;
2)
    echo "${options[$opt-1]}"
    rm -dr build/xcode
    mkdir build/xcode
    cd build/xcode
    cmake ../../ -G "Xcode"
    make
    cd ..
    ;;
3)
    echo "${options[$opt-1]}"
    rm -dr build/codeblocks
    mkdir build/codeblocks
    cd build/unix
    cmake ../../ -G "CodeBlocks - Unix Makefiles" -DCMAKE_BUILD_TYPE=Debug
    make
    cd ..
    ;;
4)
    echo "${options[$opt-1]}"
    rm -dr build/eclipse-cd4
    mkdir build/eclipse-cd4
    cd build/unix
    cmake ../../ -G "Eclipse CDT4 - Unix Makefiles" -DCMAKE_BUILD_TYPE:STRING=Debug
    make
    cd ..
    ;;
5)
    echo "${options[$opt-1]}"
    rm -dr build/unix
    mkdir build/unix
    cd build/unix
    cmake ../../ -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release
    make
    cd ../../bin/linux
    ./makedeb.sh
    ;;
6)
  echo "Exit..."
  ;;
esac
