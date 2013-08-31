{% set user = 'bill' %}
/home/{{ user }}/swipe-framework/nginx_install.py:
  file:
    - managed
    - user: {{ user }}
    - mode: 777
    - source: salt://nginx/nginx_install.py
    - require:
      - pkg: git
      - git.repository: https://github.com/ruahman/swipe-framework.git
