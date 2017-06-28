# Benchmarks

El benchmark se hará contra un servidor básico que responderá un payload lleno de strings del tamaño indicado en el query param `payload`.


## Caso 1

- Cantidad de requests: 1000
- Concurrencia: 100
- Tamaño del payload: 1 byte

Para ejecutarlos se necesita:

- nginx -c $PWD/caso1/nginx.conf
- crystal run ../src/server.cr -- $PWD/caso1/config.yaml
- node server.js

**Resultados**

*Sin Proxy:*

`ab -n 1000 -c 100 http://127.0.0.1:8000/`

```
Server Software:        
Server Hostname:        127.0.0.1
Server Port:            8000

Document Path:          /
Document Length:        1 bytes

Concurrency Level:      100
Time taken for tests:   0.192 seconds
Complete requests:      1000
Failed requests:        0
Total transferred:      76000 bytes
HTML transferred:       1000 bytes
Requests per second:    5199.10 [#/sec] (mean)
Time per request:       19.234 [ms] (mean)
Time per request:       0.192 [ms] (mean, across all concurrent requests)
Transfer rate:          385.87 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   1.3      0       8
Processing:     2   18   3.0     19      20
Waiting:        2   18   3.1     19      20
Total:         10   18   1.9     19      20

Percentage of the requests served within a certain time (ms)
  50%     19
  66%     19
  75%     19
  80%     19
  90%     20
  95%     20
  98%     20
  99%     20
 100%     20 (longest request)
```

*Nginx:*

`ab -n 1000 -c 100 http://127.0.0.1:8001/`

```
Server Software:        nginx/1.12.0
Server Hostname:        127.0.0.1
Server Port:            8001

Document Path:          /
Document Length:        1 bytes

Concurrency Level:      100
Time taken for tests:   0.364 seconds
Complete requests:      1000
Failed requests:        0
Total transferred:      98000 bytes
HTML transferred:       1000 bytes
Requests per second:    2744.88 [#/sec] (mean)
Time per request:       36.431 [ms] (mean)
Time per request:       0.364 [ms] (mean, across all concurrent requests)
Transfer rate:          262.69 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   1.2      0       7
Processing:    17   35  15.0     32      80
Waiting:       17   35  15.0     32      80
Total:         18   35  15.8     32      81

Percentage of the requests served within a certain time (ms)
  50%     32
  66%     36
  75%     46
  80%     47
  90%     55
  95%     72
  98%     79
  99%     80
 100%     81 (longest request)
```

*Vitrix:*

`ab -n 1000 -c 100 http://127.0.0.1:8080/`

```
Server Software:        
Server Hostname:        127.0.0.1
Server Port:            8080

Document Path:          /
Document Length:        1 bytes

Concurrency Level:      100
Time taken for tests:   0.434 seconds
Complete requests:      1000
Failed requests:        0
Total transferred:      39000 bytes
HTML transferred:       1000 bytes
Requests per second:    2303.23 [#/sec] (mean)
Time per request:       43.417 [ms] (mean)
Time per request:       0.434 [ms] (mean, across all concurrent requests)
Transfer rate:          87.72 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    1   1.2      0      13
Processing:    20   42  16.9     39     107
Waiting:       20   42  17.0     38     107
Total:         21   42  17.8     39     110

Percentage of the requests served within a certain time (ms)
  50%     39
  66%     41
  75%     44
  80%     46
  90%     70
  95%     94
  98%    103
  99%    104
 100%    110 (longest request)
```


## Caso 2

- Cantidad de requests: 10000
- Concurrencia: 500
- Tamaño del payload: 100 bytes

Para ejecutarlos se necesita:

- nginx -c $PWD/caso2/nginx.conf
- crystal run ../src/server.cr -- $PWD/caso2/config.yaml
- node server.js

**Resultados**

*Sin proxy:*

`ab -n 10000 -c 500 http://127.0.0.1:8000/?payload=100`

```
Server Software:        
Server Hostname:        127.0.0.1
Server Port:            8000

Document Path:          /?payload=100
Document Length:        100 bytes

Concurrency Level:      500
Time taken for tests:   1.956 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      1750000 bytes
HTML transferred:       1000000 bytes
Requests per second:    5111.86 [#/sec] (mean)
Time per request:       97.812 [ms] (mean)
Time per request:       0.196 [ms] (mean, across all concurrent requests)
Transfer rate:          873.61 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0   39 192.0      0    1029
Processing:     7   35  81.5     22     837
Waiting:        7   35  81.5     22     837
Total:         16   73 255.1     22    1858

Percentage of the requests served within a certain time (ms)
  50%     22
  66%     24
  75%     25
  80%     27
  90%     38
  95%     74
  98%   1241
  99%   1447
 100%   1858 (longest request)
```

*Nginx:*

`ab -n 10000 -c 500 http://127.0.0.1:8001/?payload=100`

```
Server Software:        nginx/1.12.0
Server Hostname:        127.0.0.1
Server Port:            8001

Document Path:          /?payload=100
Document Length:        100 bytes

Concurrency Level:      500
Time taken for tests:   2.502 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      1970000 bytes
HTML transferred:       1000000 bytes
Requests per second:    3997.20 [#/sec] (mean)
Time per request:       125.087 [ms] (mean)
Time per request:       0.250 [ms] (mean, across all concurrent requests)
Transfer rate:          768.99 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0   28 165.0      0    1035
Processing:     8   54 150.3     25    1078
Waiting:        8   54 150.3     25    1078
Total:         13   82 238.3     25    1881

Percentage of the requests served within a certain time (ms)
  50%     25
  66%     30
  75%     33
  80%     35
  90%     68
  95%     96
  98%   1049
  99%   1250
 100%   1881 (longest request)

```

*Vitrix:*

`ab -n 10000 -c 500 http://127.0.0.1:8080/?payload=100`

```
Server Software:        
Server Hostname:        127.0.0.1
Server Port:            8080

Document Path:          /?payload=100
Document Length:        100 bytes

Concurrency Level:      500
Time taken for tests:   6.432 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      1400000 bytes
HTML transferred:       1000000 bytes
Requests per second:    1554.82 [#/sec] (mean)
Time per request:       321.581 [ms] (mean)
Time per request:       0.643 [ms] (mean, across all concurrent requests)
Transfer rate:          212.57 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0  108 327.2      0    3240
Processing:    35  186 303.0     94    1702
Waiting:       35  186 303.0     94    1702
Total:         35  294 555.8     95    4414

Percentage of the requests served within a certain time (ms)
  50%     95
  66%    100
  75%    113
  80%    134
  90%   1108
  95%   1419
  98%   2530
  99%   2696
 100%   4414 (longest request)

```

## Caso 3

- Cantidad de requests: 10000
- Concurrencia: 800
- Tamaño del payload: 500 bytes

Para ejecutarlos se necesita:

- nginx -c $PWD/caso3/nginx.conf
- crystal run ../src/server.cr -- $PWD/caso3/config.yaml
- node server.js

**Resultados**

*Sin proxy:*

`ab -n 10000 -c 800 http://127.0.0.1:8000/?payload=500`

```
Server Software:        
Server Hostname:        127.0.0.1
Server Port:            8000

Document Path:          /?payload=500
Document Length:        500 bytes

Concurrency Level:      800
Time taken for tests:   1.912 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      5750000 bytes
HTML transferred:       5000000 bytes
Requests per second:    5229.13 [#/sec] (mean)
Time per request:       152.989 [ms] (mean)
Time per request:       0.191 [ms] (mean, across all concurrent requests)
Transfer rate:          2936.28 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0   70 254.4      0    1034
Processing:    14   43  93.9     21     866
Waiting:       14   43  93.9     21     866
Total:         14  112 324.9     21    1897

Percentage of the requests served within a certain time (ms)
  50%     21
  66%     24
  75%     27
  80%     29
  90%     99
  95%   1042
  98%   1340
  99%   1467
 100%   1897 (longest request)

```

*Nginx:*

`ab -n 10000 -c 800 http://127.0.0.1:8001/?payload=500`

```
TODO estos tests empiezan a fallar por la cantidad máxima de sockets abiertos
```

*Vitrix:*

`ab -n 10000 -c 800 http://127.0.0.1:8080/?payload=500`

```
Server Software:        
Server Hostname:        127.0.0.1
Server Port:            8080

Document Path:          /?payload=500
Document Length:        500 bytes

Concurrency Level:      800
Time taken for tests:   3.603 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      5400000 bytes
HTML transferred:       5000000 bytes
Requests per second:    2775.16 [#/sec] (mean)
Time per request:       288.271 [ms] (mean)
Time per request:       0.360 [ms] (mean, across all concurrent requests)
Transfer rate:          1463.47 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0  117 323.9      0    1032
Processing:    42  115 151.9     87    1808
Waiting:       42  115 151.9     87    1808
Total:         42  232 428.2     88    2829

Percentage of the requests served within a certain time (ms)
  50%     88
  66%     97
  75%    104
  80%    110
  90%   1103
  95%   1347
  98%   1575
  99%   1956
 100%   2829 (longest request)
```



## Caso 4

- Cantidad de requests: 10000
- Concurrencia: 800
- Tamaño del payload: 500 byte
- Cantidad de backends: 2

Para ejecutarlos se necesita:

- nginx -c $PWD/caso4/nginx.conf
- crystal run ../src/server.cr -- $PWD/caso4/config.yaml
- node server.js 8000
- node server.js 8002


**Resultados**

*Nginx:*

`ab -n 10000 -c 800 http://127.0.0.1:8001/?payload=500`

```
TODO estos tests empiezan a fallar por la cantidad máxima de sockets abiertos
```

*Vitrix:*

`ab -n 10000 -c 800 http://127.0.0.1:8080/?payload=500`

```
Server Software:        
Server Hostname:        127.0.0.1
Server Port:            8080

Document Path:          /?payload=500
Document Length:        500 bytes

Concurrency Level:      800
Time taken for tests:   4.451 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      5400000 bytes
HTML transferred:       5000000 bytes
Requests per second:    2246.82 [#/sec] (mean)
Time per request:       356.059 [ms] (mean)
Time per request:       0.445 [ms] (mean, across all concurrent requests)
Transfer rate:          1184.85 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0  122 328.8      0    1029
Processing:    26  139 385.5     75    3419
Waiting:       26  139 385.6     75    3419
Total:         26  261 609.8     76    4439

Percentage of the requests served within a certain time (ms)
  50%     76
  66%     90
  75%    102
  80%    112
  90%   1083
  95%   1144
  98%   1950
  99%   4430
 100%   4439 (longest request)
```
