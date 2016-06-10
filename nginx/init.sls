{%- set web_username = salt['grains.get']('web_username', 'ambari') -%}
{%- set web_password = salt['grains.get']('web_password', 'changeme') -%}
nginx:
  pkg.installed

nginx-extras:
  pkg.installed

/etc/nginx/sites-enabled/default:
  file.absent:
    - require:
      - pkg: nginx

/etc/nginx/sites-available/ambari:
  file.managed:
    - source: salt://ambari/nginx/files/ambari
    - template: jinja
    - require:
      - pkg: nginx

/etc/nginx/sites-enabled/ambari:
  file.symlink:
    - target: /etc/nginx/sites-available/ambari
    - require:
      - file: /etc/nginx/sites-available/ambari

/etc/nginx/ssl:
  file.directory:
    - user: root
    - owner: root
    - mode: 700
    - require:
      - pkg: nginx

self_signed_cert:
  cmd.run:
    - name: openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/nginx/ssl/ambari.key -out /etc/nginx/ssl/ambari.crt -days 999 -subj "/CN={{ salt['network.ipaddrs']('eth0')[0] }}"
    - creates: /etc/nginx/ssl/ambari.crt
    - require:
      - file: /etc/nginx/ssl

nginx_service:
  service.running:
    - name: nginx
    - enable: True
    - watch:
      - file: /etc/nginx/sites-available/ambari
    - require:
      - pkg: nginx
      - cmd: self_signed_cert
