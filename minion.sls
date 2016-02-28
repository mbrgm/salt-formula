salt-minion:
  pkg.latest: []
  service.running:
    - require:
      - pkg: salt-minion
      - pkg: python-openssl

python-openssl:
  pkg.latest:
    - fromrepo: jessie-backports

/etc/salt/minion:
  file.managed:
    - source: salt://salt/config/minion
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: salt-minion
    - watch_in:
      - service: salt-minion
