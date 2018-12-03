#!/bin/bash

read -p "Coin Name:" name
name=${name,,}
Name=${name^}
NAME=${name^^}

read -p "Coin Ticker:" ticker
ticker=${ticker,,}
Ticker=${ticker^}
TICKER=${ticker^^}

read -p "Website:" website

read -p "milli-amount:" milli

read -p "micro-amount:" micro

read -p "nano-amount:" nano

read -p "pico-amount:" pico

read -p "Mainnet Port [3808]0):" defport2

read -p "Testnet Port [4808]0):" defport3

read -p "Stagenet Port [5808]0):" defport4

find . -type f -not -path './.git/*' -exec sed -i "s/Bittrader/$Name/g; s/bittrader/$name/g; s/TRD/$TICKER/g; s/BITTRADER/$NAME/g; s/Trd/$Ticker/g; s/trd/$ticker/g; s/millitrade/$milli/g; s/microtrade/$micro/g; s/nanotrade/$nano/g; s/picotrade/$pico/g; s/:/:$defport1/g; s/:3868/:$defport2/g; s/:4868/:$defport3/g; s/:5868/:$defport4/g;" "{}" \;

find . -type f -not -path './.git/*' -exec sed -i "s/Copyright (c) 2017-2018, The $Name Project/Copyright (c) 2017-2018, The Masari Project/g;" "{}" \;

find . -type f -not -path './.git/*' -exec sed -i "s/get$name.org/$website/g;" "{}" \;

find . -type f -not -path './.git/*' -exec sed -i "s/PORT = 3868/PORT = $defport2/g; s/port=3868/port=$defport2/g; s/EXPOSE 3868/EXPOSE $defport2/g; s/published: 3868/published: $defport2/g; s/target: 3868/target: $defport2/g;" "{}" \;

find . -type f -not -path './.git/*' -exec sed -i "s/PORT = 4868/PORT = $defport3/g; s/port=4868/port=$defport3/g; s/EXPOSE 4868/EXPOSE $defport3/g; s/published: 4868/published: $defport3/g; s/target: 4868/target: $defport3/g;" "{}" \;

find . -type f -not -path './.git/*' -exec sed -i "s/PORT = 5868/PORT = $defport4/g; s/port=5868/port=$defport4/g; s/EXPOSE 5868/EXPOSE $defport4/g; s/published: 5868/published: $defport4/g; s/target: 5868/target: $defport4/g;" "{}" \;

