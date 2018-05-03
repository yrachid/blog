---
title: "Node: O sistema de módulos"
date: 2018-05-03T11:27:48-03:00
draft: false
---

Toda linguagem em que já programei possui um mecanismo que permite a modularização de um programa. Dividir um programa em módulos é algo que
se faz desde os primórdios do software. Com o Node, isso não é exceção. Ele permite que a gente quebre nosso código Javascript em módulos
(ou arquivos) que permitem que criemos pedaços concisos e reutilizáveis de código.

## O Legado dos navegadores de internet

Javascript é uma linguagem que nasceu para ser usada dentro dos navegadores de internet (Google Chrome, Firefox, Internet Explorer, etc.) e
a maneira que tinhamos de modularizar o código Javascript era através da utilização de tags `<script>` dentro dos arquivos HTML.

__Vejamos um exemplo:__

Temos que fazer uma calculadora baseada em HTML e JavaScript, para isso, teremos dois módulos JavaScript contendo a lógica da calculadora e
um arquivo HTML que será renderizado pelo navegador.

- O primeiro módulo Javascript será responsável apenas por executar os cálculos
- O segundo módulo JavaScript irá manipular o [DOM](https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model/Introduction),
  lendo e escrevendo dados no HTML

### O código

Primeiro módulo: `calculadora.js`

```javascript
function soma(umValor, outroValor) {
  return umValor + outroValor;
}

function subtrai(umValor, outroValor) {
  return umValor - outroValor;
}
```

Segundo módulo: `entrada-e-saida.js`

```javascript
var primeiroValor = document.querySelector('#primeiro-valor');
var segundoValor = document.querySelector('#segundo-valor');
var botaoSoma = document.querySelector('#botao-soma');
var botaoSubtracao = document.querySelector('#botao-subtracao');
var resultado = document.querySelector('#resultado');

function escreveResultado(valor) {
  resultado.innerHTML = 'Resultado: ' + valor;
}

botaoSoma.addEventListener('click', function() {
  // Aqui, chamamos a funcao 'soma' do modulo 'calculadora.js'
  var resultadoSoma = soma(parseInt(primeiroValor.innerHTML), parseInt(segundoValor.innerHTML));
  escreveResultado(resultadoSoma);
});

botaoSubtracao.addEventListener('click', function() {
  // Aqui, chamamos a funcao 'subtrai' do modulo 'calculadora.js'
  var resultadoSubtracao = subtrai(parseInt(primeiroValor.innerHTML), parseInt(segundoValor.innerHTML));
  escreveResultado(resultadoSubtracao);
});
```

É importante perceber que o segundo módulo depende das funções do primeiro.

_Mas como fazemos para que o segundo módulo consiga ter acesso à estas funções?_

Temos que usar as tags `<script>` dentro do nosso HTML para importar estes módulos:


```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset=”utf-8">
    <title>Calculadora</title>
  </head>
  <body>
    <h1>Calculadora</h1>
    <input type="text" id="primeiro-valor" />
    <input type="text" id="segundo-valor" />
    <br />
    <button id="botao-soma">Somar</button>
    <button id="botao-subtracao">Subtrair</button>
    <p id="resultado"></p>

    <!-- Aqui importamos o modulo calculadora.js-->
    <script src="./calculadora.js"></script>

    <!-- Aqui importamos o modulo entrada-e-saida.js-->
    <script src="./entrada-e-saida.js"></script>
  </body>
</html>
```
