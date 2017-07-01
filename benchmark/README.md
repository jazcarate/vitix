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
Time taken for tests:   3.425 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      1400000 bytes
HTML transferred:       1000000 bytes
Requests per second:    2919.60 [#/sec] (mean)
Time per request:       171.256 [ms] (mean)
Time per request:       0.343 [ms] (mean, across all concurrent requests)
Transfer rate:          399.16 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0   62 241.8      0    1028
Processing:    26   84  53.3     79    1029
Waiting:       26   83  53.3     79    1029
Total:         26  146 275.3     79    1534

Percentage of the requests served within a certain time (ms)
  50%     79
  66%     86
  75%     92
  80%     96
  90%    119
  95%   1105
  98%   1336
  99%   1376
 100%   1534 (longest request)
```

## Caso 3

- Cantidad de requests: 10000
- Concurrencia: 800
- Tamaño del payload: 500 bytes

Para ejecutarlos se necesita:

- nginx -c $PWD/caso3/nginx.conf
- crystal run ../src/server.cr -- $PWD/caso3/config.yaml
- node server.js

**Nota**

A partir de este caso, nginx tiene que ser ejecutado cambiando el límite de descriptores de archivos abiertos en Linux (`ulimit -n 4096`) o empieza a fallar.

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
Server Software:        nginx/1.12.0
Server Hostname:        127.0.0.1
Server Port:            8001

Document Path:          /?payload=500
Document Length:        500 bytes

Concurrency Level:      800
Time taken for tests:   2.659 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      5970000 bytes
HTML transferred:       5000000 bytes
Requests per second:    3761.26 [#/sec] (mean)
Time per request:       212.695 [ms] (mean)
Time per request:       0.266 [ms] (mean, across all concurrent requests)
Transfer rate:          2192.84 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    2   6.9      0      35
Processing:    17  165 337.7     35    1468
Waiting:       17  165 337.7     35    1468
Total:         18  167 337.8     35    1468

Percentage of the requests served within a certain time (ms)
  50%     35
  66%     48
  75%     57
  80%    106
  90%   1022
  95%   1057
  98%   1096
  99%   1272
 100%   1468 (longest request)

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
Server Software:        nginx/1.12.0
Server Hostname:        127.0.0.1
Server Port:            8001

Document Path:          /?payload=500
Document Length:        500 bytes

Concurrency Level:      800
Time taken for tests:   1.640 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      5970000 bytes
HTML transferred:       5000000 bytes
Requests per second:    6097.22 [#/sec] (mean)
Time per request:       131.207 [ms] (mean)
Time per request:       0.164 [ms] (mean, across all concurrent requests)
Transfer rate:          3554.73 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0   28 157.7      0    1022
Processing:    15   91 117.1     72    1125
Waiting:       15   90 117.0     71    1125
Total:         46  118 197.1     74    1298

Percentage of the requests served within a certain time (ms)
  50%     74
  66%     83
  75%     90
  80%     97
  90%    128
  95%    171
  98%   1097
  99%   1104
 100%   1298 (longest request)
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
Time taken for tests:   3.529 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      5400000 bytes
HTML transferred:       5000000 bytes
Requests per second:    2833.41 [#/sec] (mean)
Time per request:       282.345 [ms] (mean)
Time per request:       0.353 [ms] (mean, across all concurrent requests)
Transfer rate:          1494.18 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0  127 336.4      0    1037
Processing:    28  113 195.1     78    1797
Waiting:       27  113 195.1     77    1797
Total:         28  240 463.7     79    2830

Percentage of the requests served within a certain time (ms)
  50%     79
  66%     90
  75%    104
  80%    113
  90%   1101
  95%   1149
  98%   1588
  99%   2750
 100%   2830 (longest request)
```