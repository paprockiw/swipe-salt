nodejs:
  pkg:
    - installed

npm-packages:
  npm.installed:
    - dir: /home/bill/swipe-framework
    - names:
      - coffee-script
      - uglify-js
    - require:
      - pkg: nodejs
