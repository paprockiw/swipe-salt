python-dev:
  pkg:
    - installed

python-pip:
  pkg:
    - installed

python-virtualenv:
  pkg:
    - installed

#/home/USER/swipe-framework/requirements.txt:
#  file:
#    - managed
#    - user: USER
#    - mode: 777
#    - source: salt://python/requirements.txt


/home/USER/Desktop/swipe-framework/.env:
  virtualenv:
    - managed
    - no_site_packages: True
    - runas: USER
    - requirements: salt://python/requirements.txt
    - require:
      - pkg: python-virtualenv

