# vi: set ft=yaml.jinja :

include:
  - .depend-supervisor
  -  nova-common

nova-compute:
  pkg.installed:   []
{% if salt['config.get']('virtual_subtype') == 'Docker' %}
  service.dead:
    - enable:      False
{% else %}
  service.running:
    - enable:      True
{% endif %}
    - watch:
      - pkg:       nova-compute
#     - file:     /etc/nova/api-paste.ini
#     - file:     /etc/nova/logging.conf
      - file:     /etc/nova/nova.conf
#     - file:     /etc/nova/policy.json

/etc/nova/rootwrap.d/compute.filters:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/nova/rootwrap.d/compute.filters
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - pkg:       nova-compute

{% if not salt['config.get']('virtual_subtype') == 'Docker' %}

nbd:
  kmod.present:    []

{% endif %}
