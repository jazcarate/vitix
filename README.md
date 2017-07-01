# vitix [![Build Status](https://travis-ci.org/jazcarate/vitix.svg?branch=master)](https://travis-ci.org/jazcarate/vitix)
Balanceador de carga para IASC 1C-2017.

[El enunciado](https://docs.google.com/document/d/1hGKI62Sm0U0BmGuITR31SfEJEYz6LRKKzl7ptXFOrxA/pub)

## Instalacion
Para hacer correr `Crystal` hacen falta [un par de bibliotecas](https://github.com/crystal-lang/crystal/wiki/All-required-libraries).
No se necesita nada más.

## Uso
`$ crystal run src/server.cr`

Si da `bind: Address already in use (Errno)`, podes encontrar el proceso que tiene tomado el puerto: `lsof -ti:8080` y matarlo

## Tests
`$ crystal spec`


## Benchmarks

Ver en [benchmarks](https://github.com/jazcarate/vitix/tree/master/benchmark)
