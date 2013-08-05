nodejs:
  pkg:
    - installed

npm-packages:
  npm.installed:
    - names:
      - coffee-script
      - uglify-js
    - require:
      - pkg: nodejs
