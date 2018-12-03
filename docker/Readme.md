# Docker container
## How to build
Inside the bittrader root directory, execute
```
docker build -t bittrader docker/Dockerfile .
```

## How to use
To run the daemon, use
```
docker run -it bittrader
```

In order to use the bittrader wallet cli, you can use
```
docker run -it bittrader bittrader-wallet-cli
```

## Docker compose example
This example runs 2 daemons for HA and a bittrader wallet rpc with the specified keys
```
version: '3.7'

networks:
  net:
    driver: overlay
    driver_opts:
      encrypted: ''
    attachable: true
    
volumes:
  blockchain:
    name: 'blockchain-{{.Task.Slot}}'
    
services:
  bittrader_daemon:
    image: bittrader
    command: ["bittraderd", "--p2p-bind-ip=0.0.0.0", "--p2p-bind-port=38680", "--rpc-bind-ip=0.0.0.0", "--rpc-bind-port=38681", "--non-interactive", "--confirm-external-bind", "--restricted-rpc"]
    volumes:
      - blockchain:/root/.bittrader
    networks:
      - net
    ports:
     - target: 38680
       published: 38680
       protocol: tcp
       mode: ingress
     - target: 38681
       published: 38681
       protocol: tcp
       mode: ingress
    deploy:
      replicas: 2
      update_config:
        parallelism: 1
        delay: 10s
  wallet:
    image: bittrader
    command: ["bittrader-wallet-rpc", "--wallet-file", "funding", "--password", "", "--daemon-host", "bittrader_daemon_bittrader_daemon", "--rpc-bind-port", "11182", "--disable-rpc-login", "--rpc-bind-ip=0.0.0.0", "--confirm-external-bind"]
    volumes:
      - ./wallet.keys:/funding.keys
      - ./wallet.cache:/funding.cache
    networks:
      - net
```