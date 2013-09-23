ruby-rvm:
  pkg:
    - installed

#ruby:
#  rvm.installed:
#    - default: True
#    - require:
#      - git.repository: https://github.com/ruahman/swipe-framework.git
      
swipe-rpm:
  rvm:
    - gemset_create
    - ruby: '1.9.2'
    - require:
      #      - ruby
      - git.repository: https://github.com/ruahman/swipe-framework.git

gem:
  pkg.installed #:
    #    - require:
    #      - rvm.installed: ruby
    #    - require_in:
    #      - gem: zurb-foundation
    #      - gem: compass

#gemset:
#  rvm.gemset_create:
#    - names:
#      - swipe-rpm
#    - require:
#      - pkg: gem
#      - pkg: ruby-rvm
      #    - require_in:
      #      - gem: zurb-foundation
      #      - gem: compass

#zurb-foundation:
#  gem.installed:
#    - ruby: swipe-rpm
#
#compass:
#  gem.installed:
#    - ruby: swipe-rpm


{% set user = 'bill' %}

/home/{{ user }}/swipe-framework/Gemfile:
  file:
    - managed
    - user: {{ user }}
    - mode: 777
    - source: salt://ruby/Gemfile
    - require:
      - git.repository: https://github.com/ruahman/swipe-framework.git

/home/{{ user }}/swipe-framework/create_gemset:
  file:
    - managed
    - user: {{ user }}
    - mode: 777
    - source: salt://ruby/create_gemset
    - require:
      - git.repository: https://github.com/ruahman/swipe-framework.git
