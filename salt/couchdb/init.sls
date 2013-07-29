couchdb:
  pkg:
    - installed

/etc/couchdb/local.ini:
  file:
    - managed
    - user: root
    - mode: 644
    - source: salt://couchdb/local.ini
    - require:
      - pkg: couchdb
