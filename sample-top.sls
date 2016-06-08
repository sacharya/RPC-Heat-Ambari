base:

  'roles:ambari-server':
    - match: grain
    - ambari.hosts
    - ambari.ntp
    - amabari.ambari.server

  'roles:ambari':
    - match: grain
    - ambari.hosts
    - ambari.ntp
    - ambari.hadoop
    - ambari.ambari.agent
