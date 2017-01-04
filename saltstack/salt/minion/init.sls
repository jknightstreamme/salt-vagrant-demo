---

salt-minion:
  file.managed:
    - name: /etc/salt/minion
    - source: salt://minion/minion.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
  service.running:
    - name: salt-master
    - enable: True
    - require:
      - file: /etc/salt/minion
    - watch:
      - file: /etc/salt/minion
  pkg.latest:
    - require:
      - file: /etc/salt/minion
