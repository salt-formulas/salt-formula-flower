
# Flower

Flower is a web based tool for monitoring and administrating Celery clusters.

## Sample pillars

### Flower with rabbitmq broker

    flower:
      server:
        enabled: true
        bind:
          port: 5555
          address: 0.0.0.0
        broker:
          engine: rabbitmq
          host: localhost
          port: 5672
          virtual_host: /test
          user: test
          password: test

### Flower with redis broker

    flower:
      server:
        enabled: true
        bind:
          port: 5555
          address: 0.0.0.0
        broker:
          engine: redis
          host: localhost
          port: 6379
          number: 0

## Read more

* https://github.com/mher/flower
