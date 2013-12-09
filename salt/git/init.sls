git:
  pkg.installed

{% set user = 'ubuntu' %}

https://github.com/ruahman/swipe-framework.git:
  git.latest:
    - target: /home/{{ user }}/swipe-rpm
    - rev: the-blue-stuff
    - force: True
    - require: 
      - pkg: git

/home/{{ user }}/swipe-rpm:
  file.directory:
    - user: root
    - group: users
    - mode: 777
    - recurse:
      - user
      - group
      - mode
