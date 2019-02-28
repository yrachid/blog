+++ 
draft = true
date = "2018-01-01T00:00:00-00:00"
title = "Strongly"
slug = "" 
tags = []
categories = []
+++

This is obvious and boring for those who are experienced.

My experience with strongly typed languages comes mostly from Java. 

My experience with weakly typed languages comes mostly from Python and JavaScript.

Safety
  - Compilers will prevent me from being a stupid human more often. 

  - I have better ways to express my data representation needs.

  - Operation results are more predictable.

  - (Faster) feedback

The most efficient documentation ever
  - The types guide you (like hateoas)
  - it's much easier to reason about complex problems and situations (since it's easier to understand what's going on what kind of data
    structures you're dealing with at that moment)

Confidence about testing
  - testing is just much easier

It's much easier to learn and teach programming with types

  - I learned a bit about monads by using Optionals
  - bugs introduced by weird dynamic behaviour are much harder to explain to beginners.

It's easier to build tools that help developers
  - annotations 
  - 

In a nutshell, it's much more productive in the long term to use a strongly typed system. 

While weak languages provide a tempting productivity boost at the beginning of a project, as the project grows, all the freedom starts
becoming a nightmare, things no longer make sense and unit tests don't inspire not nearly as much confidence from a strongly typed system
(specially when there are mocks and stubs involved).
