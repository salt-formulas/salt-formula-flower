
# Flower

Flower is a web based tool for monitoring and administrating Celery clusters.

## Sample pillars

### Flower single broker

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

### Flower with many rabbitmq broker

    flower:
      server:
        enabled: true
        message_queue:
          location_hklab01:
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

note: supervisor must specified service with message_queue.name ..location_hklab01 for this example 

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
