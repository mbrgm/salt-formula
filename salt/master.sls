salt-master:
  pkg.latest: []
  service.running:
    - require:
      - pkg: salt-master

salt:
  host.present:
    - ip: 127.0.0.1
    - require:
      - service: salt-master

/etc/salt/master:
  file.managed:
    - source: salt://salt/config/master
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: salt-master
    - watch_in:
      - service: salt-master
