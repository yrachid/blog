+++
title = "Migrando do Java para o Kotlin idiomático"
date = 2021-05-08T10:52:25-03:00
author = "Yasser Rachid"
authorTwitter = "yrachid" #do not include @
cover = ""
tags = ["kotlin", "java"]
keywords = ["kotlin", "java"]
description = "Conceitos que me ajudaram a me familiarizar com o jeito idiomático de escrever Kotlin."
showFullContent = false
draft = true
+++

Meu primeiro contato com Kotlin foi num projeto que trabalhei na ThoughtWorks. Meu time (composto por devs Java) herdou um projeto escrito
originalmente em Java que fora convertido para Kotlin (provavelmente apertando um botão no IntelliJ). O resultado foi um projeto escrito em
Kotlin com cara de Java. Ainda que sejam linguagens parecidas em muitos aspectos, o sotaque do Java acaba deixando o código um pouco confuso
de ler e, muitas vezes, mais difícil de escrever. Trabalhar nesse projeto foi uma oportunidade excelente, aprendemos muito sobre o que não
fazer e como corrigir o nosso sotaque de Java.

Tenho agora outra oportunidade de trabalhar com Kotlin na Creditas, onde a linguagem é difundida na empresa inteira. Resolvi compilar este
artigo com alguns conceitos que me ajudaram a migrar do Java e que hoje ajudam meu time a escrever código simples, testável e legível, somos
muito felizes com Kotlin. :)

### O que é idiomático?

Quando estamos aprendendo uma linguagem nova, é muito comum tentarmos escrever código da forma que fazemos numa linguagem que já conhecemos,
gerando um certo sotaque, que causa fricção no nosso trabalho, pois estamos forçando conceitos que talvez não funcionem tão bem numa
linguagem que foi projetada para ser usada de uma forma diferente. Entretanto, linguagens como Scala e Kotlin, por exemplo, foram
propositalmente projetadas para sere similares ao Java em alguns aspectos (com a intenção de facilitar nossa transição), então a tendência
de escrevermos com sotaque acaba sendo ainda maior. Com o tempo nossa intuição de dev nos ajuda a sentir quando estamos nadando contra a
corrente em uma linguagem nova:

> Esse código está esquisito, deve ter um jeito mais simples de fazer isso, não é possível!

Logo, a ideia desse post é ajudar a escrever Kotlin com cara de Kotlin, usando os recursos da linguagem para escrever código simples,
declarativo e fácil de ler.

## Resolvendo um problema de rotina com Kotlin

- Sistema de classes
- Funções
- Interoperabilidade com Java
- Biblioteca padrão
- Bibliotecas Open Source


## Classes

Classes de dados: value objects

Parâmetros nomeados

Classes seladas
- Operador when

Objetos

## Funções

Primeira ordem

Extensão

Infixas

### Operadoras

Declarando uma função operadora

```kotlin
data class Money(val currency: String, val amount: BigDecimal) {
  operator fun plus(other: Money) = Money(amount + other.amount)
}

@Test
fun `funcao operadora de soma declarada pelo usuario`() {
  val dezReais = Money(currency = "BRL", amount = BigDecimal("10"))
  val cincoReais = Money(currency = "BRL", amount = BigDecimal("5"))

  assertEquals(dezReais + cincoReais, Money("BRL", BigDecimal("15")))
}

```

Interoperabilidade com classes Java

```kotlin

@Test
fun `funcao operadora de compareTo funciona com classes Java`() {
  val twoDays = Duration.between(
    LocalDate.parse("2021-05-08"), 
    LocalDate.parse("2021-05-10")
  )

  assertTrue(twoDays > Duration.ofDays(1L))
  assertTrue(twoDays >= Duration.ofDays(1L))
  assertTrue(Duration.ofDays(1L) < twoDays)
}

```

## Biblioteca padrão e null safety

### Operações seguras com valores possivelmente nulos

### Lidando com erros sem lançar exceções

### Escrevendo uma DSL de teste em cinco linhas

- Classes: dados, seladas, objetos, funções solitárias
- Funções: primeira ordem, extensão, infixas, backticks
- Operações seguras com valores possivelmente nulos
  - Operadores e tipos
- Lidando com erros sem lançar exceções: Either
- Escrevendo uma DSL de teste em cinco linhas
