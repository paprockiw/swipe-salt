ruahman:
  group:
    - present
  user:
    - present
    - gid: ruahman
    - home: /home/ruahman/
    
rvm-deps:
  pkg:
    - installed
    - names:
      - bash
      - coreutils
      - gzip
      - bzip2
      - gawk
      - sed
      - curl
      - git-core
      - subversion
      - sudo

ruby-1.9.2:
  rvm:
    - install
    - default: True
    - require:
      - pkg: rvm-deps
      #- user: ruahman
      
