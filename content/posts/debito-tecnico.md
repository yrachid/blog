+++
draft = false
date = "2019-05-15T00:00:00-00:00"
title = "Débito técnico: O que é e como aplicar em um projeto"
slug = ""
tags = []
categories = []
+++

Este artigo foi escrito para as alunas da [Aceleradora Ágil](https://info.thoughtworks.com/aceleradora) que têm interesse de aprender mais
sobre débitos técnicos.

Tempo é a força regente do processo de desenvolvimento de software e faz parte do papel de quem desenvolve (principalmente nós,
programadoras/es) conseguir conciliar o cumprimento dos prazos estipulados com demais necessidades de um projeto (ou produto).

Nesse desafio de conciliação, é inevitável que tenhamos que decidir como chegar nos tais prazos e essas decisões geralmente giram em torno
de sacrifícios, ou seja, frequentemente decidimos tomar atalhos e implementar uma solução que resolve o problema, mas, que ainda assim, não
é a solução ideal (por inúmeros motivos). 

Ainda que seja natural pensar em soluções rápidas que nem sempre são ideais, é nosso papel ponderar e entender os limites entre velocidade e
qualidade. Precisamos ter um olhar pragmático sobre como gerenciamos a qualidade do código do projeto para que não percamos velocidade a
longo prazo, afinal, se sempre tomamos atalhos, o código tende a ficar cada vez mais difícil de manter ao longo do tempo, o que, por
consequência, diminui a velocidade do time.

Este badge propõe o aprendizado e aplicação da metáfora dos débitos técnicos: uma técnica criada para que times de desenvolvimento de
software possam ter essa estratégia pragmática de gerenciar a qualidade do código.

## O que você aprenderá

Este badge propõe o estudar e aplicar:

  - Como identificar débitos técnicos (através de Code Smells e outras técnicas)

  - Como registrar débitos técnicos

  - Como priorizar débitos técnicos


## Como estudar os tópicos desse badge

Recomendamos que você leia os tópicos abaixo para entender melhor os conceitos que estamos propondo neste badge para que você consiga
cumprir os desafios propostos. Se possível, não deixe de revisar o material opcional presente no checklist de tarefas como uma forma de
reforçar os conceitos.

## Identificando débitos técnicos

As tais dívidas técnicas se apresentam em todos os tipos e tamanhos, podendo ser uma arquitetura mau desenhada ou apenas um método ou classe
que está fazendo coisas demais, por exemplo. Por serem tão vastos os exemplos, acaba se tornando um pouco subjetiva a tarefa de lidar com
débitos técnicos, mas isso não nos impede de fazê-lo, portanto, vamos explorar um pouco algumas situações ou casos de exemplo onde podemos
acabar gerando dívidas técnicas.

### Escolhas conscientes

Comumente, enquanto estamos desenvolvendo alguma história, escolhemos tomar atalhos. Sabemos que aquele código não é ideal, mas resolve o
problema que precisa ser resolvido. Ainda que não seja um problema termos esta atitude (algumas vezes sendo até o melhor caminho a seguir),
é fundamental que não deixemos essas decisões passarem sem registro, precisamos manter no nosso campo de visão toda decisão que comprometerá
a qualidade do código.

Você entenderá melhor como fazer isso no tópico que fala sobre registro de débitos técnicos. Lembre-se:

> *Quando você decidir escrever um código de qualidade "mais ou menos", não esqueça que é também seu trabalho registrar esta decisão e que
> este código deve ser melhorado, ou ele voltará no futuro para lhe assombrar (e ao resto do time também).*

### Escolhas inconscientes

Em algumas situações, criamos débito técnico quando desconhecemos a melhor forma de usar a tecnologia empregada no projeto para resolver um
problema. Um exemplo clássico em Java deste tipo de situação é o uso do tipo `Double` para representar valores monetários, quando idealmente
deve-se usar algo como `BigDecimal`.

> *Antes de fechar um pull request, pergunte ao resto do time e/ou busque mais informação na internet e na documentação das tecnologias para
> entender quais são suas possibilidades de resolver o problema. Estando no contexto da Aceleradora, lembre-se que você também sempre poderá
> recorrer à mentoria para pedir opinião sobre possíveis soluções.*

### Pull Requests

É importante nos atentarmos aos comentários de pull requests como possíveis identificações de débitos técnicos. Algumas vezes, um comentário
de um Pull Request revela um problema muito mais profundo, que demandará bastante tempo para ser reparado. Precisamos exercitar nosso
pensamento nessas situações. Ao decidir o que fazer com um comentário de um Pull Request podemos acabar concluindo que a melhor ação será
criar um registro de débito técnico para que possamos trabalhar nos comentários e sugestões que surgiram durante a revisão do nosso pull
request.

### Fricção de manutenção

Uma outra forma um pouco menos direta de identificarmos dívidas técnicas é sentindo a fricção do código, ou seja: quando sentimos que está
difícil manter ou evoluir um pedaço do código. Este é quase sempre um forte sintoma de que as nossas dívidas técnicas já estão cobrando seus
juros, nós apenas não sabíamos disso. Em relação a estas situações sempre precisamos refletir:

Às vezes o problema que estamos tentando resolver é mesmo complexo, o que torna esta fricção algo natural, no entanto, devemos pensar:

> *Está difícil fazer meu trabalho porque eu não sei como resolver o problema ou é porque o código está difícil de entender?*

Se o código for um obstáculo, é provável que devamos investir um tempo tentando melhorar este aspecto para que possamos focar exclusivamente
na complexidade do problema, não do código.

Conforme vamos aprendendo mais sobre práticas de engenharia de software, vamos ganhando mais recursos que nos ajudam a lidar melhor com
estas situações (SOLID, Padrões de Projeto e Código Limpo podendo ser bons exemplos de práticas úteis para estas tais situações), que são um
tanto subjetivas, ficando a cargo nosso ponderar e entender onde de fato está o problema que estamos sentindo.

Não é o propósito deste badge se aprofundar nestas práticas mencionadas, mas podemos explorar e praticar alguns conceitos que nos ajudarão
nestas situações, como é o caso dos **maus cheiros de código**.

### Code Smells (mau cheiro de código)

Conforme vamos sentindo a tal fricção mencionada anteriormente, nos damos conta de que existe algo errado, mas nem sempre sabemos ao certo o
que é que está errado. Os tais *code smells*, ou *maus cheiros de código* são alguns padrões identificáveis que normalmente indicam que o
código precisa de uma repaginada. São exemplos de code smells:

- Métodos/funções com muitos parâmetros
- Métodos/funções muito longas, que fazem muita coisa

Abaixo temos alguns materiais com mais detalhes e exemplos dos code smells mais comuns:

- https://docs.google.com/document/d/1JJSrlI6CONDqVzmc02yRaX1mkwboWeFYImOBwaFL7Ik/edit

- https://blog.codinghorror.com/code-smells/

## Registrando débitos técnicos

Cada time segue uma estratégia para registrar suas dívidas técnicas. Alguns criam histórias no Kanban, outros mantém comentários ou arquivos
de registro (no formato markdown mesmo, como o readme do projeto) dentro do repositório do projeto. No contexto deste badge e com base nas
ferramentas que utilizamos na Aceleradora, *recomendamos a criação de histórias no Kanban do Github do projeto devidamente sinalizadas com
um label de "débito técnico"*.

Não existe um padrão ou template para preencher o formato de um cartão de débito técnico, mas é sempre uma boa ideia explicar o problema em
mais detalhe, descrevendo porque você crê que aquela situação é um problema e como ela pode afetar o trabalho do time hoje ou no futuro.
Além de descrever o problema e seu impacto, também é interessante deixar registradas possíveis soluções que você tenha em mente (caso você
tenha alguma ideia) para aquele problema, como um meio de iniciar discussões no time caso necessário. Estas soluções podem ser até mesmo no
estilo brainstorming, bem livre, não precisam ser a solução definitiva para o problema.

## Priorizando débitos técnicos

É comum chegarmos em um ponto onde teremos muitos débitos técnicos e não saberemos como nem quando mitigá-los. Assim como histórias de
negócio, devemos priorizar estes débitos e geralmente o fazemos considerando dois fatores: *esforço* e *dor*.

### Esforço

O esforço é o fator que indica o quão complexo será implementar a correção para a dívida. Pode ser tanto em termos de dificuldade (não temos
muita certeza de como fazer) quanto em termos de tamanho (sabemos como fazer, mas será trabalhoso e demandará tempo).

### Dor

A dor é o fator que indica o quanto aquele problema está atrapalhando o time em seu dia a dia. Ter que executar rotinas de deploy manuais,
por exemplo, é uma dor imensa, pois é algo repetitivo, trabalhoso e propenso a erros humanos. Certamente este problema estará no caminho do
time frequentemente e causará problemas grandes, logo, é sensato entender esta como uma dívida de alta dor.

### Relacionando Esforço e Dor

Podemos formar um plano cartesiano à partir dos dois fatores para agrupar nossos débitos em quadrantes. Esta é uma forma visual eficiente de
priorizar o trabalho:

![Exemplo de quadrantes de débito técnico](/images/2019/05/19/quadrantes-de-debito-tecnico.png)

Intuitivamente, recomenda-se sempre tentar resolver aqueles que são identificados como `Alta dor` e `Baixo esforço`, pois são os que,
teoricamente, trariam mais valor ao time mais rapidamente.

### Importante

O objetivo é apenas posicionar cada card em um quadrante, não é relevante entender o quão para dentro ou para fora do quadrante está um
card, ou seja, todos os cards que estão no quadrante `Alta dor` e `alto esforço`, serão de mesmo tamanho. Esta regra simplifica o processo
de estimativa dos cards.

É interessante que o time revise esta priorização em conjunto de vez em quando para realizar atualizações nos cards de dívida técnica e
estimar os valores de dor e esforço de cada um.

## Pagando débitos técnicos com refatoração

A refatoração de código é o método mais comum de pagarmos nossos débitos técnicos. Como comentado lá no começo, podemos ter débitos técnicos
de todos os tipos e tamanhos, mas a maioria deles sempre será sobre como o código está desenhado, por isso, a refatoração tem um papel
central no pagamento de débitos técnicos.

Abaixo você encontrará um material explicando rapidamente o que é e como aplicar refatoração:

- https://helabs.com/artigos/2013/06/17/refatoracao-parte-i-o-que-e/
- https://helabs.com/artigos/2014/03/31/refatoracao-parte-ii-maus-cheiros/
