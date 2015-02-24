{%- if pillar.flower.server.enabled %}

include:
- python

flower_packages:
  pkg.installed:
  - names:
    - python-setuptools
    - python-docutils
    - python-simplejson
    {%- if grains.os_family == "Debian" %}
    - build-essential
    {%- endif %}
    - gettext
  - require:
    - pkg: python_packages

/srv/flower:
  virtualenv.manage:
  - system_site_packages: True
  - requirements: salt://flower/conf/requirements.txt
  - require:
    - pkg: flower_packages

flower_user:
  user.present:
  - name: flower
  - system: true
  - home: /srv/flower
  - require:
    - virtualenv: /srv/flower

/srv/flower/logs:
  file.directory:
  - mode: 755
  - user: flower
  - require:
    - virtualenv: /srv/flower
    - user: flower_user

{%- endif %}