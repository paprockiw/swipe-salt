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
/home/{{ user }}/swipe-framework/requirements.txt:
  file:
    - managed
    - user: {{ user }}
    - mode: 777
    - source: salt://python/requirements.txt
    - require:
      - pkg: git
      - git.repository: https://github.com/ruahman/swipe-framework.git

/home/{{ user }}/swipe-framework/env:
  virtualenv:
    - managed
    - no-site-packages: True
#    - system_site_packages: False # New version
    - user: {{ user }}
    - requirements: salt://python/requirements.txt
    - require:
      - pkg: python-virtualenv
      - pkg: git
      - git.repository: https://github.com/ruahman/swipe-framework.git
