git:
  pkg.installed

{% set user = 'bill' %}

https://github.com/ruahman/swipe-framework.git:
  git.latest:
    - target: /home/{{ user }}/swipe-framework
    - rev: salt
    - force: True
    - require: 
      - pkg: git
