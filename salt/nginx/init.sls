{% set user = 'bill' %}

/home/{{ user }}/swipe-framework/nginx:
  file.directory:
    - makedirs: True
    - user: {{ user }}
    - require:
      - pkg: git
      - git.repository: https://github.com/ruahman/swipe-framework.git

/home/{{ user }}/swipe-framework/nginx/install_nginx:
  file:
    - managed
    - user: {{ user }}
    - mode: 777
    - source: salt://nginx/install_nginx
    - require:
      - pkg: git
      - git.repository: https://github.com/ruahman/swipe-framework.git
      - file: /home/{{ user }}/swipe-framework/nginx

/home/{{ user }}/swipe-framework/nginx/nginx.conf:
  file:
    - managed
    - user: {{ user }}
    - mode: 777
    - source: salt://nginx/nginx.conf
    - require:
      - pkg: git
      - git.repository: https://github.com/ruahman/swipe-framework.git

libpcre++-dev:
  pkg:
    - installed
