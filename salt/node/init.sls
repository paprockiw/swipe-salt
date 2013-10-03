{% set user = 'ruahman' %}

/home/{{ user }}/node-latest.tar.gz:
  file.managed:
    - user: {{ user }}
    - mode: 777
    - source: salt://node/node-latest.tar.gz

extract_node:
  cmd.run:
      - name: 'tar xzf node-latest.tar.gz'
      - cwd: /home/{{ user }}
      - require:
        - file: /home/{{ user }}/node-latest.tar.gz

nodejs:
  cmd.script:
    - cwd: /home/{{ user }}/node-v0.10.20
    - user: {{ user }}
    - source: salt://node/install_nodejs
    - require:
      - cmd: extract_node


