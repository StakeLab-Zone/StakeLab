#!/bin/bash
set -x

#Install utils
apt update && apt -y --no-install-recommends install ca-certificates curl jq > /dev/null 2>&1

# fail fast should there be a problem installing curl / jq packages
type curl || exit 1
type jq || exit 1

# If Address book is enabled, download it
if [ "$DYDX_ADDRBOOK_ENABLED" == true ]; then
  curl -s "$DYDX_ADDRBOOK_URL" > "$DYDX_HOME/config/addrbook.json"
fi

#Check if Home data exists, if not create it.
if [ ! -d "$DYDX_HOME/data" ]
then
mkdir -p $DYDX_HOME/data
# Init the chain
/bin/dydxprotocold init --chain-id "$DYDX_CHAIN_ID" "$DYDX_MONIKER"
cd "$DYDX_HOME/data" || exit
curl -s "$DYDX_NET" > "$DYDX_HOME/config/genesis.json"
else
  echo "Found dydx data folder!"
  cd "$DYDX_HOME/data" || exit
fi

if [[ $DYDX_DEBUG == "true" ]]; then sleep 5000; fi
