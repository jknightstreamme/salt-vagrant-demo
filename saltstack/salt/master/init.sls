salt repo:
  pkgrepo.managed:
    - file: /etc/apt/sources.list.d/saltstack.list
    - name: deb http://repo.saltstack.com/apt/debian/8/amd64/latest jessie main
    - key_url: https://repo.saltstack.com/apt/debian/8/amd64/latest/SALTSTACK-GPG-KEY.pub

salt-master:
  file.managed:
    - name: /etc/salt/master
    - source: salt://master/master
    - user: root
    - group: root
    - mode: 644
    - template: jinja
  service.running:
    - name: salt-master
    - enable: True
    - require:
      - pkg: salt-master
      - file: /etc/salt/master
    - watch:
      - file: /etc/salt/master
      - file: /etc/salt/master.d
  pkg.latest:
    - require:
      - pkgrepo: salt repo
      - file: /etc/salt/master
      - pkgrepo: salt repo


/etc/salt/master.d:
  file.recurse:
    - source: salt://master/master.d
    - user: root
    - group: root
    - template: jinja

salt-cloud:
  pkg.latest