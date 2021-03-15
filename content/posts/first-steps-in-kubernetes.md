+++
title = "Entendendo o Kubernetes e sua relação com o Docker"
date = "2021-01-12T10:00:00"
author = "Yasser Rachid"
authorTwitter = "" #do not include @
cover = ""
tags = ["kubernetes", "containers", "infra", "pt-BR"]
keywords = ["", ""]
description = ""
showFullContent = false
draft = true
+++

Como desenvolvedor, utilizo o Docker há uns quatro anos para tarefas do dia-a-dia de desenvolvimento e para deploy de aplicações,
entretanto, o Kubernetes dominou o cenário de aplicações conteinerizadas, tornando-se fundamental compreendê-lo ao menos em um nível básico
para entender os novos caminhos para produção que surgem com sua adoção. Portanto, esse texto é um compilado do que estou aprendendo
nos meus estudos sobre Kubernetes. Estou buscando as respostas às seguintes perguntas:
  - Posso substituir Kubernetes por Docker e Docker Compose no desenvolvimento local? 
    - Se posso, eu devo? Que vantagens isso me trará?
  - Como funcionam os deploys de aplicações com Kubernetes?
    - Como a ferramenta lida com deployments graduais e rollbacks?
    - Como fazer a promoção de uma nova versão entre os ambientes? Por exemplo, como promover uma versão que chegou em staging até produção?

### Antes de mais nada, como se fala Kubernetes?

[Como se escreve](https://translate.google.com/?sl=et&tl=pt&text=kubernetes&op=translate), esse negócio de "qiuberniris" é coisa de gringo,
afinal, Kubernetes é uma palavra grega que significa algo como piloto.

### O que é Kubernetes?

É um gerenciador de containers Linux que foca em entregar uma configuração declarativa e um bom nível de automação. É um projeto concebido
pela Google, que já vem utilizando containers em produção há mais de quinze anos, logo, toda essa expertise está materializada na
ferramenta!

Oferece, dentre outras coisas:

- Descoberta de serviços
- Escalonamento de containers
- Autocura de containers que falham

> __Gerenciar != Orquestrar__
>
> A documentação oficial frisa muito o fato de o Kubernetes ser um gerenciador, não um orquestrador! O conceito de orquestração implica que
uma tarefa ou serviço A precisa acontecer/iniciar antes de B, por exemplo. Kubernetes não resolve isso.

### O que não é Kubernetes?

- PaaS
- Orquestrador


### O caminho do código: tudo que acontece entre a minha máquina e produção


### Qual a relação do Kubernetes com Docker?

Docker é o motor de container

Docker Compose é uma ferramenta que facilita a inicialização de múltiplos containers numa máquina

Docker Swarm é uma ferramenta que gerencia containers em múltiplos hosts

### Quero trocar Docker Compose por Kubernetes desenvolver localmente

Minikube

Posso usar Kubernetes para desenvolver localmente? Dá pra substituir o Docker Compose?


### Fontes

- [Documentação oficial do Kubernetes](https://kubernetes.io/docs/concepts/overview/what-is-kubernetes/)
- [Thread do StackOverflow sobre Docker vs Kubernetes](https://stackoverflow.com/questions/47536536/whats-the-difference-between-docker-compose-and-kubernetes)
- Kubernetes up and running
