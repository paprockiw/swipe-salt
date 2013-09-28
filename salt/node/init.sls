nodejs:
  pkg:
    - installed

npm:
  pkg:
    - installed
    - require:
      - pkg: nodejs
      
coffee-script:
  npm:
    - installed
    - require:
      - pkg: npm

{% set user = 'bill' %}
npm-packages:
  npm.installed:
    - dir: /home/{{ user }}/swipe-framework
    - names:
      - uglify-js
    - require:
      - pkg: nodejs
      - git.repository: https://github.com/ruahman/swipe-framework.git
