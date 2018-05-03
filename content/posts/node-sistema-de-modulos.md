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

Desta maneira, conseguimos dividir as responsabilidades de cada módulo. Um é responsável por calcular, o outro, por escrever e ler coisas da
tela.

Parece bom, basta usar uma tag e temos um módulo disponível para uso, no entanto, esta maneira de modularizar o Javascript apresenta alguns
problemas.

No segundo módulo (`entrada-e-saida.js`), foi possível usar as funções `soma`  e `subtrai` do primeiro módulo (`calculadora.js`)
diretamente. Pensando um pouco mais sobre isso, podemos ver quais problemas isso traz:

> E se eu quisesse ter uma função privada no primeiro módulo? Ou seja, uma função que não fosse visível para os demais módulos da minha
  aplicação?

Ou ainda

> E se eu tivesse uma função `soma` no segundo módulo também? Como eu faço para diferenciar a função soma do primeiro e do segundo módulo?

Ou seja, esta forma tradicional de modularizar scripts em Javascript possui problemas de `encapsulamento`, pois eu não consigo isolar um
módulo de outro completamente.

Pensando nesses problemas, começaram a surgir padrões de projetos e bibliotecas para resolver estas questões de modularização de JavaScript
no navegador. Tais padrões e bibliotecas surgiram antes mesmo de existir o que entendemos como `Node.js`, ou seja, elas eram utilizadas
exclusivamente dentro dos navegadores. Uma destas bibliotecas é o [require-js](http://requirejs.org), que foi adotada pelo Node para criar
um sistema de módulos.

## O require

Neste artigo, não entraremos em detalhes sobre como o require funciona nos navegadores ou sobre como ele funciona internamente e como ele
resolve a questão dos módulos, vamos focar em entender como utilizá-lo no Node.

Um programa que é feito para ser executado no node nada mais é do que um arquivo simples com código Javascript. Assim como em outras
linguagens como Python, Ruby ou Java, podemos quebrar nosso programa em vários arquivos, importando-os conforme a nossa necessidade.

### Definindo e usando módulos com require

Diferentemente das tags `<script>` do HTML, o `require` nos permite controlar o que queremos expor de um módulo, o que nos permite que
tenhamos funções e variáveis privadas que ficam invisíveis para outros módulos.

Para que isso funcione, dentro de cada arquivo `js` da nossa aplicação, teremos acesso à uma variável "global" do require chamada
`module.exports`, a qual nos permite definir o que queremos que o nosso módulo contenha.

Pelo fato de `module.exports` ser uma simples variável Javascript, podemos criar um módulo que contenha qualquer coisa, um objeto, uma
função, uma string, um número, um array, etc.

Ou seja, se quisermos ter um módulo que se chama `cinco.js` e que contenha apenas o valor `5`, podemos fazê-lo:

```javascript
// conteúdo do arquivo cinco.js
module.exports = 5
```

Para usar um módulo dentro de outro módulo, chamamos a função global `require`. Se tivermos um módulo `numeros.js` e, neste módulo,
queiramos usar o módulo `cinco.js`, podemos fazer o seguinte:

```javascript
// numeros.js
const cinco = require('./cinco.js')

console.log(cinco)
```

Observe que guardamos o retorno da função require em uma variável chamada `cinco`. Sempre fazemos isso, pois esta variável irá referenciar o
módulo que importamos, ou seja, é o mecanismo que temos para utilizar o módulo importado.

_Imagine agora, que no módulo `cinco` queiramos valores privados, que não sejam acessíveis por outros módulos. Como fazemos isso?_

__Basta não atribuir estes valores ao `module.exports`!__

Assim:

```javascript
// conteúdo do arquivo cinco.js
const souInvisivel = 10

module.exports = 5
```

Todo e qualquer módulo que importar `cinco.js` não terá acesso à variável `souInvisivel`, pois ela não foi atribuída à `module.exports`.

Como mencionado anteriormente, o require não se limita apenas à números, podemos importar (chamar require) e exportar (atribuir um valor ao
module.exports) qualquer outra coisa. É muito comum exportar objetos e funções por exemplo. Vejamos isso com um exemplo mais complexo.

### A Calculadora em Node com require

Vejamos então como definir o módulo `calculadora` usando o `require`.

Primeiro, escrevemos nosso código normalmente:

```javascript
function soma(umValor, outroValor) {
  return umValor + outroValor
}

function subtrai(umValor, outroValor) {
  return umValor - outroValor
}
```

Agora, como queremos exportar as duas funções (soma e subtrai), podemos criar um novo objeto com estas funções e exportar este objeto:

```javascript
function soma(umValor, outroValor) {
  return umValor + outroValor
}

function subtrai(umValor, outroValor) {
  return umValor - outroValor
}

// Criamos um objeto que contém as duas funções
const operacoes = {
  soma,
  subtrai
}

// E entao exportamos este objeto:
module.exports = operacoes
```

Agora, se quisermos usar as funções do módulo calculadora em outros módulos, basta importá-lo via `require`.

```javascript
const calculadora = require('./calculadora.js')

console.log(calculadora.soma(1, 1)) // 2
console.log(calculadora.subtrai(1, 1)) // 0
```

