
==============
Flower Formula
==============

Flower is a web based tool for monitoring and administrating Celery clusters.

Sample Pillars
==============

Flower single broker

.. code-block:: yaml

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

Flower with multiple brokers

.. code-block:: yaml

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


Flower with redis broker

.. code-block:: yaml

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

More Information
================

* https://github.com/mher/flower
