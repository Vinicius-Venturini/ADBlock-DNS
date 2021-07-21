# ADBlock a nível de DNS

## Conceito do projeto

Este projeto tem a intenção de ser um servidor DNS para a rede local, no qual os dispositivos conectados terão requisições DNS para servidores considerados maliciosos, ou servidores de anúncios, bloqueadas. Dessa forma, os usuários poderão ter uma navegação mais segura e sem anúncios aparecendo em sua tela.
  
## Pré-requisitos e recursos utilizados

Foram utilizados a liguagem de programação [python](https://www.python.org/) em sua versão python3, e também o sistema de banco de dados [MYSQL](https://www.mysql.com/) no qual armazena as URLs que são bloqueadas no servidor. Não é necessário ter ambos pré-instalados caso seja utilizado uma Distribuição Linux, já que o script de instalação, feito em Shell Script, instala todas as dependências necessárias para a execução do servidor em sua máquina!

## Instalação

Para instalar o DNS em sua máquina, clone o repositório utilizando o comando:
```
git clone https://github.com/Vinicius-Venturini/ADBlock-DNS.git
```
Após isso, dentro da pasta clonada, execute o script de instalação com o comando ```./install.sh``` (caso não tenha permissão para utilizar o script, utilize o comando ```chmod +x install.sh```). Será pedido sua senha de usuário, insira e pressione enter. Em um certo momento da instalação (como mostrado na imagem abaixo) será pedido uma outra senha, se você não tiver o mysql previamente instalado apenas pressione enter (o que está sendo pedido é a senha do usuário root do servidor mysql, a senha padrão é vazia, por isso não inserir nada e apenas pressionar enter), caso você já tivesse o mysql instalado antes de rodar o script de instalação, insira sua senha de root e pressione enter nessa parte!

<p align="center">
  <img src="https://github.com/Vinicius-Venturini/ADBlock-DNS/blob/main/images/mysql-password.png">
</p>

## Execução

Para a execução do servidor, dentro da pasta dos arquivos clonados execute o comando:
```
sudo python3 server.py
```
Dessa forma seu servidor já estará funcionando, agora basta alterar o servidor DNS nos dispositivos que você quer que se conecte no servidor (seu celular, computador, smartTV, etc...), lembrando que esse servidor é apenas IPV4, então desative o DNS em IPV6 no dispositivo que irá se conectar caso queira que toda sua conexão passe pelo servidor.
  
Todas as últimas 10000 requisições, autorizadas ou bloqueadas, serão documentadas no arquivo **server.log**, assim você poderá ter um controle sobre sua rede e o que está acontecendo.

Caso queira adicionar novas URLs a serem bloqueadas no seu banco de dados, coloque-as no arquivo **blocklist.list** com um enter no final de cada url, e execute o comando:
```
sudo python3 addurl.py
```

<p align="center">
  <img src="https://github.com/Vinicius-Venturini/ADBlock-DNS/blob/main/images/urls.png">
</p>

Todas as URLs contidas no arquivo serão adicionadas no banco de dados, e o arquivo ficará limpo para uma próxima adição.

## Bugs/problemas conhecidos

Esse DNS não é 100% efetivo, visto que ele utiliza uma lista de URLs, é impossível de impedir que todos os anúnicos ou sites maliciosos cheguem até o usuário final.

## Autor

* Vinícius Carvalho Venturini ([Vinicius-Venturini](https://github.com/Vinicius-Venturini))


## Referências

- Este projeto foi inspirado no [PiHole](https://pi-hole.net/) para ser feito
- A lista inicial de URLs foi uma junção de várias listas disponibilizadas pelo projeto [The Block List Project](https://github.com/blocklistproject/Lists)
- Como ajuda para fazer o script do servidor DNS, foi utilizada a playlist [https://youtube.com/playlist?list=PLBOh8f9FoHHhvO5e5HF_6mYvtZegobYX2](https://youtube.com/playlist?list=PLBOh8f9FoHHhvO5e5HF_6mYvtZegobYX2) do canal [howCode](https://www.youtube.com/howCode)
