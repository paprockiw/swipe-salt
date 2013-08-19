git:
  pkg.installed

{% set user = 'bill' %}

https://github.com/ruahman/swipe-framework.git:
  git.latest:
    - target: /home/{{ user }}/swipe-framework
    - force: True
    - require: 
      - file: /home/{{ user }}/swipe-framework
      - pkg: git
