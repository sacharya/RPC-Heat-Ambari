include:
  - hadoop.java
  - hadoop.ambari.repo

ambari-agent-pkg:
  pkg.installed:
    - name: ambari-agent
    - require:
      - pkgrepo: ambari-repo

/etc/ambari-agent/conf/ambari-agent.ini:
  file.managed:
    - source: salt://hadoop/ambari/agent/files/ambari-agent.ini.jinja2
    - mode: 644
    - template: jinja
    - watch_in:
      - service: ambari-agent-service

ambari-agent-service:
  service.running:
    - name: ambari-agent
    - enable: True
    - require:
      - pkg: ambari-agent-pkg
