ambari:
  server:
    url_port: 8440
    secured_url_port: 8441

interfaces:
  public: eth0
  private: eth2

mine_functions:
  internal_ips:
    mine_function: network.ipaddrs
    interface: eth2
  external_ips:
    mine_function: network.ipaddrs
    interface: eth0
  id:
    - mine_function: grains.get
    - id
  host:
    - mine_function: grains.get
    - host

user-ports:
  ssh:
    chain: INPUT
    proto: tcp
    dport: 22
  salt-master:
    chain: INPUT
    proto: tcp
    dport: 4505
  salt-minion:
    chain: INPUT
    proto: tcp
    dport: 4506
