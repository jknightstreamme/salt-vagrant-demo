{{saltenv}}:
  '*':
    - common

  master:
    - master

  minion*:
    - minion
