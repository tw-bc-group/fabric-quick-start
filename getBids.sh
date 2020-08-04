#!/usr/bin/env bash

export PATH=${PWD}/fabric-samples/bin:$PATH
export FABRIC_CFG_PATH=$PWD/fabric-samples/config/
export CORE_PEER_TLS_ENABLED=true

function run_as_org1() {
    export CORE_PEER_LOCALMSPID="Org1MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt
    export CORE_PEER_MSPCONFIGPATH=${PWD}/fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
    export CORE_PEER_ADDRESS=localhost:7051
}

run_as_org1

echo "get Bids..."
peer chaincode query -C mychannel -n demo -c '{"Args":["GetBids"]}'
