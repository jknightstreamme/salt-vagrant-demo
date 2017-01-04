{{saltenv}}:
  '*':
    - default
    {% if saltenv == 'development' or saltenv == 'staging' or saltenv == 'base' %}
    - environments/{{saltenv}}
    {% endif %}
