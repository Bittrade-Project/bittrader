#!/bin/bash

rlwrap monero-wallet-cli --wallet-file wallet_m --password "" --testnet --trusted-daemon --daemon-address localhost:38681.io  --log-file wallet_miner.log stop_mining

