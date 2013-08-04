python-dev:
  pkg:
    - installed

python-pip:
  pkg:
    - installed
#    - bin_env: /home/bill/swipe-framework/.env

python-virtualenv:
  pkg:
    - installed

#{% set user = 'bill' %}
#/home/{{ user }}/swipe-framework/requirements.txt:
/home/bill/swipe-framework/requirements.txt:
  file:
    - managed
#    - user: {{ user }}
    - user: bill
    - mode: 777
    - source: salt://python/requirements.txt


#/home/{{ user }}/Desktop/swipe-framework/:
/home/bill/swipe-framework/env:
  virtualenv:
    - managed
    - no-site-packages: True
#    - system_site_packages: False # New version
#    - user: {{ user }}
    - requirements: salt://python/requirements.txt
    - require:
      - pkg: python-virtualenv

