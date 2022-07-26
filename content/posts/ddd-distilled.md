---
title: "DDD Distilled"
date: 2020-08-08T01:30:18
draft: true
---

These are some notes from what I learned watching Vaugh Vernon's live lesson about DDD:
https://learning.oreilly.com/videos/domain-driven-design-distilled

> DDD is about crunching knowledge, about knowledge acquisition. The amount of knowledge that you are going to crunch when using
> domain-driven design is significant. Like a funnel of all kinds of thoughts, ideas, experiments, documentation, and that funnel is
> stilling all of that knowledge into the very, very significant drop of knowledge that contains the highest concentration of understanding.

### Good, Bad, and Effective design

He points out that some teams try to economize by following a `no-design` philosophy, which consists of focusing solely on the code itself,
where the __developers often feel their way around code without giving much deep initial thought about what they are doing__. The only
design in this situation is, therefore, the act of picking something from the backlog column and moving it to the in progress column.

Everything else will happen on the go.

> There no such thing as no-design. Not thinking about it will, therefore, lead us to always come up with a bad design.

He tries to explain such differences by using the road analogy:

> There are certain roads on the countryside that exist for many centuries. They were built when the needs were different than they are
> today, so they evolved poorly by barely adapting to today's reality. In contrast, super highways were engineered to support contemporary
> needs of high velocity and automobiles, offering a much more comfortable and convenient way to go. The same happens with software design,
> we need to think about which needs we have to address.

It's also interesting how he points out the difference between good and effective design:

- __Good:__ Applies good design techniques (maybe clean code or design patterns can be used as examples here)
- __Effective:__ Centered around the business goals

#### Insidiuous practices

These are certaing practices that hurt design and software development in general:

- Software teams being treat as a cost rather than a profit source
- Developers chasing shiny technologies without thinking deeper about the business goals
- Database and Data modeling given priority over business process and operations
- Lack of proper emphasis on adopting business language (ubiquotous language) in objects and operations naming
- Business logic housed in UI and persistence code, leading to slow queries and lock block database results
- Wrong model abstractions that miss concrete business needs

To be continued...

Up next:

- Domain experts and Business Drivers

__Strategic design tools:__

- Bounded contexts
- Ubiquotous language
- Context mapping
- Sub-domains

__Tactical modeling tools:__

- Aggregates
- Domain events
