
# Flower

## Sample pillar

    flower:
      server:
        enabled: true
        bind:
          port: 5555
          address: 0.0.0.0
        broker:
          engine: rabbitmq
          host: localhost
          virtual_host: /test
          user: test
          password: test


## Read more

* https://github.com/mher/flower