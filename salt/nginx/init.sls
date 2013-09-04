libpcre++-dev:
  pkg:
    - installed
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

/home/{{ user }}/swipe-framework/nginx/uploads:
  file.directory:
    - user: {{ user }}
    - mode: 777
    - makedirs: True
    - require:
      - file: /home/{{ user }}/swipe-framework/nginx

/home/{{ user }}/swipe-framework/nginx/conf:
  file.directory:
    - user: {{ user }}
    - mode: 777
    - makedirs: True
    - require:
      - file: /home/{{ user }}/swipe-framework/nginx

/home/{{ user }}/swipe-framework/nginx/conf/nginx.conf:
  file:
    - managed
    - user: {{ user }}
    - mode: 777
    - source: salt://nginx/nginx.conf
    - require:
      - pkg: git
      - git.repository: https://github.com/ruahman/swipe-framework.git
      - file.directory: /home/{{ user }}/swipe-framework/nginx/conf

https://github.com/vkholodkov/nginx-upload-module.git:
  git.latest:
    - target: /home/{{ user }}/swipe-framework/nginx/nginx-upload-module/
    - rev: '2.2' 
    - require: 
      - pkg: git
      - git.repository: https://github.com/ruahman/swipe-framework.git

https://github.com/agentzh/echo-nginx-module.git:
  git.latest:
    - target: /home/{{ user }}/swipe-framework/nginx/echo-nginx-module/
    - require: 
      - pkg: git
      - git.repository: https://github.com/ruahman/swipe-framework.git

