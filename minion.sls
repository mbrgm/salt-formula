salt-minion:
  pkg.latest: []
  service.running:
    - require:
      - pkg: salt-minion
      - pkg: python-openssl

python-openssl:
  pkg.latest:
    - fromrepo: jessie-backports
