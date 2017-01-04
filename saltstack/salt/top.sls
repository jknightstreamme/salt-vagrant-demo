base:
  '*':
    - common

  master:
    - master

{{saltenv}}:
  '*':
    - common

  master:
    - master

  minion*:
    - test1
