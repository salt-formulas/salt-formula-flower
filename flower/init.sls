
include:
{% if pillar.flower.server is defined %}
- flower.server
{% endif %}
