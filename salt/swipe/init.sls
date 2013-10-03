{% set user = 'bill' %}

/home/{{ user }}/swipe-framework:
  file.directory:
    - user: {{ user }}
    - mode: 777
