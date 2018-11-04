#!/bin/bash 

killall peer 2> /dev/null
killall orderer 2> /dev/null


echo $PWD
rm -rf "$PWD/../crypto-config"
rm ../*.tx 2> /dev/null
rm ../*.block 2> /dev/null



rm -rf $HOME/peer
rm -rf $HOME/orderer

echo "Done. All of the generated artifacts removed!!!"
