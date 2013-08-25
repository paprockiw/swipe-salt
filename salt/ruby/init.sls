ruby:
  rvm.installed:
    - default: True
    - require:
      - git.repository: https://github.com/ruahman/swipe-framework.git

gemset:
  rvm.gemset_present:
    - names:
      - zurb-foundation
