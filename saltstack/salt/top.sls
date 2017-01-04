{{saltenv}}:
  '*':
    - common

  master:
    - master

  minion*:
    - minion
    - test1
