git:
  pkg.installed

https://github.com/ruahman/swipe-framework.git:
  git.latest:
    - target: /home/bill/swipe-framework/swipe
    - require: 
      - file: /home/bill/swipe-framework
      - pkg: git
