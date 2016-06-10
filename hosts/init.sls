{% from 'ambari/hosts/hosts.jinja' import hosts_map with context %}

{% for host, ip in hosts_map.iteritems() %}
host-{{ host }}:
  host.present:
    - ip: {{ ip }}
    - names:
      - {{ host }}
{% endfor %}
