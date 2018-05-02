---
title: "JavaScript: Objetos, funções e arrays"
date: 2018-05-02T17:09:26-03:00
draft: false
---

Javascript é uma linguagem que possui uma sintaxe muito simples, em outras palavras, se pode expressar uma ideia imensa com poucas linhas de
código.

Entendendo o que são `Arrays`, `Objetos` e `Funções`, se pode fazer praticamente tudo em JavaScript.

## Objetos

Em Javascript, objetos nada mais são do que um mapa, ou mais simplesmente, um conjunto de pares de informações no formato chave/valor.

Objetos são representados por um par de `{}`.

__Exemplos:__

Podemos ter um objeto vazio:

```javascript
  const umObjetoVazio = {}
```

Um objeto com campos:

```javascript
  const pessoa = {
    nome: 'Silva',
    idade: 30
  }
```

Um objeto que contém outros objetos:

```javascript
  const pessoaComPet = {
    nome: 'Silva',
    idade: 30,
    pet: {
      nome: 'Silvinha',
      tipo: 'gato',
      idade: 5
    }
  }
```

__Acessando elementos de um objeto:__

Existem diferentes maneiras de se acessar elementos de um objeto, a mais comum é através do ponto (`.`). Considerando os exemplos acima:

```javascript
  console.log(pessoa.nome) // 'Silva'
  console.log(pessoaComPet.pet.nome) // 'Silvinha'
```
