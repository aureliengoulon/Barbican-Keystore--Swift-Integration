#!/bin/bash
CLEAR_CONF=/etc/swift/proxy-server.clear
CRYPT_CONF=/etc/swift/proxy-server.crypt
ACTUAL_CONF=/etc/swift/proxy-server.conf
if [ -f $CLEAR_CONF ]; then
  cp $ACTUAL_CONF $CRYPT_CONF
  mv $CLEAR_CONF $ACTUAL_CONF
  echo "Swift proxy: encryption OFF"
elif [ -f $CRYPT_CONF ];then
  cp $ACTUAL_CONF $CLEAR_CONF
  mv $CRYPT_CONF $ACTUAL_CONF
  echo "Swift proxy: encryption ON"
fi
echo "Don't forget to restart Swift proxy pipeline"
