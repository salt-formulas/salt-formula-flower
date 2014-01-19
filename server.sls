{%- if pillar.flower.server.enabled %}

include:
- python
- git

flower_packages:
  pkg:
  - installed
  - names:
    - nodejs

flower_user:
  user.present:
  - name: flower
  - system: True
  - home: /srv/flower
  - require:
    git: https://github.com/etsy/flower.git

https://github.com/etsy/flower.git:
  git.latest:
  - target: /srv/flower

flower:
  service.running:
  - require:
    - file: /etc/init.d/flower
  - watch:
    - file: /etc/flower/localConfig.js

/etc/flower/localConfig.js:
  file:
  - managed
  - source: salt://flower/conf/localConfig.js
  - user: root
  - group: root
  - mode: 644
  - template: jinja

{#
/etc/default/flower:
  file:
  - managed
  - source: salt://flower/conf/default
  - user: root
  - group: root
  - mode: 644
  - template: jinja

/srv/flower/scripts:
  file:
  - directory
  - user: flower
  - group: flower
  - mode: 770
  - require:
    - user: flower
    - git: https:://github.com/etsy/flower.git

/srv/flower/scripts/start:
  file:
  - managed
  - source: salt://flower/conf/start
  - user: root
  - group: root
  - mode: 744
  - template: jinja
  - require:
    - file: /srv/flower/scripts
#}

/var/log/flower:
  file:
  - directory
  - user: flower
  - group: flower
  - mode: 777
  - require:
    - user: flower

update-rc.d flower defaults:
  cmd.run:
  - require:
    - service: flower

{%- for backend in pillar.flower.backends %}

{%- if backend.type == 'amqp' %}
#flower_amqp_package:
#  npm.installed:
#  - name: flower-amqp-backend

install_package:
  cmd.run:
  - name: npm install flower-amqp-backend

{%- endif %}

{%- endfor %}

{%- endif %}