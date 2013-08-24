python-dev:
  pkg:
    - installed

python-pip:
  pkg:
    - installed

python-virtualenv:
  pkg:
    - installed

{% set user = 'bill' %}

#/home/{{ user }}/swipe-framework:
#  file.directory:
#    - user: {{ user }}
#    - mode: 777

/home/{{ user }}/swipe-framework/requirements.txt:
  file:
    - managed
    - user: {{ user }}
    - mode: 777
    - source: salt://python/requirements.txt
    - require:
      - git.repository: https://github.com/ruahman/swipe-framework.git
      #- file.directory: /home/{{ user }}/swipe-framework

/home/{{ user }}/swipe-framework/env:
  virtualenv:
    - managed
    - no-site-packages: True
#    - system_site_packages: False # New version
    - user: {{ user }}
    - requirements: salt://python/requirements.txt
    - require:
      - pkg: python-virtualenv
      - git.repository: https://github.com/ruahman/swipe-framework.git
      #- file.directory: /home/{{ user }}/swipe-framework
