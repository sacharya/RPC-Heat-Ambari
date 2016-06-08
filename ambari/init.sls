include:
  - hadoop.java
  - hadoop.ambari.repo

ambari-server-pkg:
  pkg.installed:
    - name: ambari-server
    - require:
      - pkgrepo: ambari-repo

ambari-server-service:
  service.running:
    - name: ambari-server
    - enable: True
    - require:
      - pkg: ambari-server-pkg
