ruby:
  pkg.installed:
    - version: '>=2.0.0'

rubygems:
  pkg.installed

sass:
  gem.installed:
    - version: 3.2.10
    - require:
      - pkg: rubygems
      - pkg: ruby

compass:
  gem.installed:
    - require:
      - pkg: rubygems
      - pkg: ruby
      - gem: sass
      
foundation:
  gem.installed:
    - require:
      - pkg: rubygems
      - pkg: ruby
      - gem: compass
