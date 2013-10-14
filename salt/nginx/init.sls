libpcre++-dev:
  pkg:
    - installed
{% set user = 'bill' %}

/home/{{ user }}/swipe-rpm/nginx:
  file.directory:
    - makedirs: True
    - user: {{ user }}
    - require:
      - pkg: git
      - git.repository: https://github.com/ruahman/swipe-framework.git

/home/{{ user }}/swipe-rpm/nginx/install_nginx:
  cmd.script:
    - cwd: /home/{{ user }}/swipe-rpm/nginx/
    - user: {{ user }}
    - source: salt://nginx/install_nginx
    - require:
      - pkg: git
      - git.repository: https://github.com/ruahman/swipe-framework.git
      - git.repository: https://github.com/vkholodkov/nginx-upload-module.git
      - git.repository: https://github.com/agentzh/echo-nginx-module.git
      - file: /home/{{ user }}/swipe-rpm/nginx

/home/{{ user }}/swipe-rpm/nginx/uploads:
  file.directory:
    - user: {{ user }}
    - mode: 777
    - makedirs: True
    - require:
      - file: /home/{{ user }}/swipe-rpm/nginx

/home/{{ user }}/swipe-rpm/nginx/conf:
  file.directory:
    - user: {{ user }}
    - mode: 777
    - makedirs: True
    - require:
      - file: /home/{{ user }}/swipe-rpm/nginx

/home/{{ user }}/swipe-rpm/nginx/conf/nginx.conf:
  file:
    - managed
    - user: {{ user }}
    - mode: 777
    - source: salt://nginx/nginx.conf
    - require:
      - pkg: git
      - git.repository: https://github.com/ruahman/swipe-framework.git
      - file.directory: /home/{{ user }}/swipe-rpm/nginx/conf

https://github.com/vkholodkov/nginx-upload-module.git:
  git.latest:
    - target: /home/{{ user }}/swipe-rpm/nginx/nginx-upload-module/
    - rev: '2.2' 
    - require: 
      - pkg: git
      - git.repository: https://github.com/ruahman/swipe-framework.git

https://github.com/agentzh/echo-nginx-module.git:
  git.latest:
    - target: /home/{{ user }}/swipe-rpm/nginx/echo-nginx-module/
    - require: 
      - pkg: git
      - git.repository: https://github.com/ruahman/swipe-framework.git

