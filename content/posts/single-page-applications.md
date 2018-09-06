---
title: "Single Page Applications"
date: 2018-09-06T12:49:02-03:00
draft: true
---

Talvez este seja um dos conceitos com o nome mais ambíguo criado nos últimos tempos na tecnologia. A primeira vez que ouvi falar do termo
Single Page Applications (o que em português significa algo como "aplicações de uma página", ou "aplicações de página única") lembrei
diretamente daquelas páginas bonitonas que usam Parallax ou Scroll Infinito (como [essa aqui](http://www.sbs.com.au/theboat/)), ou seja,
sites estáticos (com lógica e comportamento quase exclusivamente de apresentação) que apresentam todo seu conteúdo numa página só, sem links
para outras páginas.

A verdade é que esse termo representa algo totalmente diferente do que eu pensava.

Resumidamente, o Wikipédia descreve SPAs como o sendo o seguinte:

> São aplicações web que interagem com o usuário ao reescrever a página dinamicamente em vez de carregar novas páginas do servidor.

Apesar de parecer uma maneira ligeiramente diferente de se estruturar uma aplicação, na prática, isso implica em diferenças drásticas nos
mais variados aspectos de uma aplicação web.

Para entender melhor o Single Page Applications, suas motivações, vantagens e difereças, precisamos antes entender um pouco sobre como o
HTTP e as aplicações web em si funcionam, talvez esse artigo possa ajudar. Antes do surgimento das SPAs, o padrão que reinava no mundo de
aplicações web era o da renderização do lado do servidor (mais comumente denominada por seu nome gringo: Server Side Rendering).
