#!/bin/bash

rlwrap monero-wallet-cli --wallet-file wallet_m --password "" --testnet --trusted-daemon --daemon-address localhost:38681  --log-file wallet_m.log start_mining

