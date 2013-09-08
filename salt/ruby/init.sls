ruby:
  rvm.installed:
    - default: True
    - require:
      - git.repository: https://github.com/ruahman/swipe-framework.git

#gemset:
#  rvm.gemset_present:
#    - names:
#      - zurb-foundation

{% set user = 'bill' %}

/home/{{ user }}/swipe-framework/Gemfile:
  file:
    - managed
    - user: {{ user }}
    - mode: 777
    - source: salt://ruby/Gemfile
    - require:
      - git.repository: https://github.com/ruahman/swipe-framework.git
