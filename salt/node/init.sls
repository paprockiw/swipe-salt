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
      - file.directory: /home/{{ user }}/swipe-framework
