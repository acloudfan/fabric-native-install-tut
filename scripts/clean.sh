killall peer 2> /dev/null
killall orderer 2> /dev/null

cd ..

rm -rf crypro-config  2> /dev/null
rm *.tx 2> /dev/null
rm *.block 2> /dev/null

rm -rf $HOME/peer
rm -rf $HOME/orderer

echo "Done."
