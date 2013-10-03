python-dev:
  pkg:
    - installed

python-pip:
  pkg:
    - installed

python-virtualenv:
  pkg:
    - installed

{% set user = 'ruahman' %}
/home/{{ user }}/swipe-rpm/requirements.txt:
  file:
    - managed
    - user: {{ user }}
    - mode: 777
    - source: salt://python/requirements.txt
    - require:
      - pkg: git
      - git.repository: https://github.com/ruahman/swipe-framework.git

/home/{{ user }}/swipe-rpm/env:
  virtualenv:
    - managed
    - no-site-packages: True
    - user: {{ user }}
    - requirements: salt://python/requirements.txt
    - require:
      - pkg: python-virtualenv
      - pkg: git
      - git.repository: https://github.com/ruahman/swipe-framework.git
