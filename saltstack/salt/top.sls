{{saltenv}}:
  '*':
    - common

  master:
    - master

  minion*:
    - test1
