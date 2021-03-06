# vi: set ft=yaml.jinja :

{% set cluster = salt['grains.get']('environment', 'ceph') %}

include:
  -  bash
  -  ceph-common
  -  uuid-runtime

ceph:
  pkg.installed:
    - require:
      - pkgrepo:   ceph-common
  group.present:
    - gid:         502
  user.present:
    - fullname:    ceph
    - home:       /home/ceph
    - shell:      /bin/bash
    - createhome:  True
    - password:    $1$9bVX1pEh$sp2ceLpbAzBqEknNeu2yv1
    - gid:         502
    - uid:         502
    - require:
      - pkg:       bash
      - group:     ceph

/etc/ceph/{{ cluster }}.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/ceph/ceph.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - pkg:       ceph

/home/ceph:
  file.directory:
    - user:        ceph
    - group:       ceph
    - mode:       '0755'
    - require:
      - user:      ceph
      - group:     ceph
