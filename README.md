# Broadcast Chat

Um servidor de chat simples desenvolvido em **Crystal**, utilizando sockets TCP para comunicação em tempo real entre múltiplos clientes.

### Como rodar
Instale as dependências.
```
shards install
```

rode o projeto
```
crystal run src/chat.cr
```

- Rodando o projeto com asdf

Caso o projeto for rodado usando ASDF, utilize o script abaixo para corrigir dependências de instalação do `crystal`.
```
./setup-asdf.sh
```