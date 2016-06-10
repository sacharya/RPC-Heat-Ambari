include:
  - ambari.java
  - ambari.ambari.repo

ambari-server-pkg:
  pkg.installed:
    - name: ambari-server
    - require:
      - pkgrepo: ambari-repo

setup-ambari-server:
  cmd.run:
    - name: ambari-server setup -s
    - watch_in:
      - service: ambari-server-service

ambari-server-service:
  service.running:
    - name: ambari-server
    - enable: True
    - require:
      - pkg: ambari-server-pkg
