# create the identitites for the orgs
/opt/trade/createIdentity.sh

# install and instantiate chaincode
peer chaincode install -p chaincodedev/chaincode/trade_workflow_v1 -n tw -v 0
peer chaincode instantiate -n tw -v 0 -c '{"Args":["init","LumberInc","LumberBank","100000","WoodenToys","ToyBank","200000","UniversalFreight","ForestryDepartment","Lender","5000000"]}' -C tradechannel
sleep 2

#importer requests trade from exporter
export CORE_PEER_MSPCONFIGPATH=/root/.fabric-ca-client/importer
peer chaincode invoke -n tw -c '{"Args":["requestTrade", "trade-1", "5000", "Wood for Toys"]}' -C tradechannel
sleep 2
