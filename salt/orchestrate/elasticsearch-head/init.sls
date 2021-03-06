# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_elasticsearch-head:
  salt.state:
    - tgt:         roles:elasticsearch-head
    - tgt_type:    grain
    - sls:         elasticsearch-head
    - require:
      - salt:      state_sls_salt-minion

state_sls_elasticsearch-head_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:elasticsearch-head'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['elasticsearch-head']}
    - require:
      - salt:      state_sls_elasticsearch-head
