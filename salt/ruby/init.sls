ruby:
  pkg.installed

rubygems:
  pkg.installed

zurb-foundation:
  gem.installed:
    - require:
      - pkg: rubygems
      - pkg: ruby

compass:
  gem.installed:
    - require:
      - pkg: rubygems
      - pkg: ruby

#{% set user = 'bill' %}
#
#/home/{{ user }}/swipe-framework/Gemfile:
#  file:
#    - managed
#    - user: {{ user }}
#    - mode: 777
#    - source: salt://ruby/Gemfile
#    - require:
#      - git.repository: https://github.com/ruahman/swipe-framework.git
#
#/home/{{ user }}/swipe-framework/create_gemset:
#  file:
#    - managed
#    - user: {{ user }}
#    - mode: 777
#    - source: salt://ruby/create_gemset
#    - require:
#      - git.repository: https://github.com/ruahman/swipe-framework.git
