base:
  '*':
    - default
  {% set roles = salt['grains.get']('roles',[]) -%}
  {% for role in roles -%}
  {% set states = salt['pillar.get']('states:'+role,[]) -%}
  {% if states -%}
  'roles:{{ role }}':
    - match: grain
    {% for state in states -%}
    - {{ state }}
    {% endfor -%}
  {% endif -%}
  {% endfor -%}

{{env}}:
  '*':
    - environments/{{env}}
