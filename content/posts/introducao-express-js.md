---
title: "O HTTP e o Express Js"
date: 2018-05-04T11:27:25-03:00
draft: false
---

O Express é um micro-framework criado para quem quer desenvolver aplicações web usando Node.js. Uma de suas principais responsabilidades é a
de abstrair os conceitos de requests e responses HTTP, permitindo a criação de mecanismos que empoderam a aplicação para receber requests,
processá-los e enviar uma resposta (response) http de volta a o cliente (programa que enviou o request).

Antes de entendermos o que é o Express ou até mesmo como criar uma aplicação web em Node sem o Express, precisamos entender alguns conceitos
básicos sobre como a internet funciona.

## Como a internet funciona?

De uma maneira extremamente simplificada, podemos entender que a internet nada mais é do que uma rede de computadores conectados,
conversando entre si.

Para que essas conversas ocorram, é necessário que os computadores tenham linguagens formais para que todo mundo possa se entender. Imagine
alguém que somente fala italiano tentando falar com alguém que fala somente espanhol, seria impossível estabelecer uma comunicação
eficiente.

_Tais linguagens são conhecidas como_ _**protocolos**_.

Cada **protocolo** é utilizado para um tipo específico de conversa, por exemplo:

* **SMTP:** é um dos protocolos utilizados para a troca de emails
* **FTP:** é utilizado para trocar arquivos entre computadores
* **HTTP:** utilizado para a transferência de conteúdo hipertexto

### O HTTP

O protocolo HTTP pode ser entendido como **a fundação da internet**, pois ele permite que se envie informações de arquivos HTML, CSS e
JavaScript de um computador para o outro, o que é fundamental para a vida das páginas web \(a forma principal de comunicação utilizada na
internet\).

**Isso quer dizer que, quando alguém acessa um site, para poder vê-lo funcionando num browser é preciso antes receber os dados contendo as
definições HTML, CSS e JavaScript deste site através do HTTP.**

Evidentemente, não basta apenas receber tais dados, eles precisam ser interpretados para que façam sentido e se tornem uma página bonita e
funcional. Essa é mais uma tarefa para os browsers: interpretar os dados recebidos por HTTP e transformá-los em páginas utilizáveis por
seres humanos.

### Browser e HTTP passo a passo

Então, observando o que acontece quando uma pessoa acessa um site qualquer, podemos ver tudo que um browser faz por nós, humanos:

**Comunicação HTTP:**

* Alguém acessa o site no endereço _www.google.com.br_
* O browser faz uma **requisição HTTP** para o servidor que está no endereço _www.google.com.br_
  * Em outras palavras, o browser diz, falando em HTTP com o servidor: _"Por favor, me passe os dados da página"_
* O servidor, de maneira formal, responde ao browser com uma **resposta HTTP** contendo as informações pedidas de forma organizada e
  padronizada, de um jeito que browser consegue entender o que foi recebido

**Renderização de uma página:**

* O browser recebe o conteúdo HTML, CSS e JS que foi enviado pelo servidor através do HTTP
* O browser começa a interpretar tal conteúdo, transformando-o em uma página
  * Baseada na estrutura descrita pelo HTML
  * Nos estilos descritos nos CSS
  * E em tudo mais que estiver nos JavaScripts

### Como se parece uma requisição HTTP?

No exemplo anterior, o browser fez uma requisição para o site **www.google.com.br**. Na prática, ele enviou, através de uma comunicação
HTTP, um texto, mais ou menos como este:

```http
GET  HTTP/1.1
Host: www.google.com.br
Cache-Control: no-cache
```

E o servidor da Google, por sua vez, respondeu com algo mais ou menos assim:

```html
<!doctype html><html itemscope="" itemtype="http://schema.org/WebPage" lang="pt">
  <head>
  <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  <meta content="/images/branding/googleg/1x/googleg_standard_color_128dp.png" itemprop="image">
  <title>Google</title>
  <script>
    (function(){
      window.google={kEI:'2vToWbWNOcObwQSXhKLADA',kEXPI:'1352821,1353383,1354277,1354401,1354915,1355159,1355218,1355325,1355527,1355735,1355800,1355820,3700263,3700440,3700476,4029815,4031109,4043492,4045841,4048347,4072774,4076999,4078430,4081039,4081164,4092182,4093169,4095909,4097153,4097470,4097922,4097929,4098721,4098728,4098752,4102238,4103475,4103861,4104258,4104414,4108824,4109316,4109489,4110656,4110685,4111016,4113215,4114597,4115289,4116926,4116935,4117328,4117980,4118226,4118437,4118798,4119272,4119740,4120415,4120660,4121035,4121518,4122185,4122352,4124091,4124174,4124411,4124497,4124850,4124893,4124968,4124975,4125837,4125873,4125962,4126204,4127473,4127555,4127657,4127744,4127775,4127776,4128586,4128874,4129520,4129555,4129633,4130575,4130783,4131247,4131286,4131834,4132255,4132566,4132784,4132953,4133090,4133113,4133245,4133416,4133424,4134266,4134327,4134560,4135088,4135300,4135576,4135954,4135968,4136205,4136223,4136399,4136549,4137482,4137548,10200083,10200096,10201956,16200027,19003868,19003881,19003883,19003900,19003901,19003907,19003909,19003910,19003913,19003927',authuser:0,kscs:'c9c918f0_2vToWbWNOcObwQSXhKLADA',u:'c9c918f0',kGL:'BR'};google.kHL='pt';
    })();

...
```

Ou seja, a resposta do browser foi um documento HTML, contento scripts JavaScript e links para outros documentos CSS e mais scripts. Esta é
a informação que o browser interpretará e transformará na famosa página de busca da Google.

Em princípio, isso é tudo que precisamos saber sobre como os computadores se comunicam através da internet, no entanto, este é um assunto
que se aprofunda muito e possui inúmeros conceitos e tópicos que valem a pena serem aprendidos em algum momento.

### HTTP na prática

Caso você queira ver essa comunicação acontecendo na prática, pode usar o comando `telnet`:

Primeiro, estabeleça a conexão com a Google via telnet:

```sh
telnet google.com 80
```

Após a execução deste comando, a seguinte mensagem deve aparecer:

```
Trying 172.217.4.46...
Connected to google.com.
Escape character is '^]'.
```

Após esta mensagem, digite o seguinte e pressione `enter`:

```sh
GET /
```

Depois disso, o servidor da Google irá responder com um monte de HTML (que é o que o nosso browser recebe quando navegamos até google.com) e
então encerrará a conexão.

Neste último comando, existem duas informações muito importantes à respeito de como se organiza uma aplicação web:

- O verbo HTTP (no caso do comando, usamos o `GET`)
- A rota (no caso, usamos `/`)

```sh
GET   /
^^^   ^
Verbo Rota
```

