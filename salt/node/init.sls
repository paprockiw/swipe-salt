nodejs:
  pkg:
    - installed

{% set user = 'bill' %}
npm-packages:
  npm.installed:
    - dir: /home/{{ user }}/swipe-framework
    - names:
      - coffee-script
      - uglify-js
    - require:
      - pkg: nodejs
      - git.repository: https://github.com/ruahman/swipe-framework.git
      #- file.directory: /home/{{ user }}/swipe-framework
