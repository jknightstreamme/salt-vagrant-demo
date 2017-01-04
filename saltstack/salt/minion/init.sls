---

salt-minion:
  file.manage:
    - name: /etc/salt/minion
    - source: salt://minion/minion.conf
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
