# vitix
Balanceador de carga para IASC 1C-2017

## Instalacion
Para hacer correr `Crystal` hacen falta [un par de bibliotecas](https://github.com/crystal-lang/crystal/wiki/All-required-libraries).
No se necesita nada más

## Uso
`$ crystal run src/server.cr`

Si da `bind: Address already in use (Errno)`, podes encontrar el proceso que tiene tomado el puerto: `lsof -ti:8080` y matarlo

## Tests
`$ crystal spec`
