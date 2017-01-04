base:
  '*':
    - common

  master:
    - master

  minion*:
    - test1

{{saltenv}}:
  '*':
    - common

  master:
    - master

  minion*:
    - test1
