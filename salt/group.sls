salt:
  group.present: []

/srv/salt:
  file.directory:
    - user: root
    - group: salt
    - dir_mode: 770
    - file_mode: 660
    - recurse:
      - user
      - group
      - mode
    - require:
      - group: salt
