base:

  'roles:ambari-server':
    - match: grain
    - ambari.hosts
    - ambari.ntp
    - ambari.ambari.server
    - ambari.nginx

  'roles:ambari':
    - match: grain
    - ambari.hosts
    - ambari.ntp
    - ambari.hadoop
    - ambari.ambari.agent
