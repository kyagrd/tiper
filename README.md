TIPER aims to automatically generate
Type Inference Prototyping Engine from Relational specifications of
type systems. Our ultimate goal for the TIPER project is to build a framework
that automates type system implementations just as parser implementations are
automated by parser generators, ever since Yacc was developed in the 70's.
This project will reduce the high-cost of type system implementations supporting
type inference so that advancements in type systems research would become much
more available to the developers as a cost-effective technology to support in
a language implementation. You may take a look at
the [talk slides on TIPER](http://slides.com/kyagrd/tiperdundee) if you are
interested in further details.

In our preliminary case study, we have demonstrated that Logic Programming (LP) is suitable for declarative & executable specifications of polymorphic type systems including advanced features such as type-constructor polymorphism (a.k.a. higher-kinded polymorphism) and kind polymorphism, in addition to type polymorphism in the Hindley--Milner type system (HM). Because our specification is _relational_, rather than functional, we were able to specify both type checking and type inference without duplication. Being based on LP, our specification is _excutable_ on a machine. Executable specifications reduce the gap between a specification and an implementation. Our specification is not only executable for testing the result of type checking but also serves as a reference implementation for a type inference engine, because the specification can run both ways bidirectionally as a logic program.

## Proof-of-Concept Interactive Examples
Here are some examples from [the draft of our FLOPS 2016 paper](https://www.sharelatex.com/project/557756cfdfb75ebd54bf5807) made
accessible via online SWI-Prolog environments. You can do simple experiments within these webpages, without installing SWI-Prolog on your local system.

* Simply-Typed Lambda Calculus (STLC)
  - http://ideone.com/WcKYu0
    powered by IDEone (Fork to edit and run experiments)
  - http://kyagrd.koding.io:3050/example/STLC.swinb
    powered by SWISH (with parsing)
* Hindley--Milner type system (HM):
  - http://ideone.com/cI0oXR
    powered by IDEone (Fork to edit and run experiments)
  - http://kyagrd.koding.io:3050/example/HM.swinb
    powerd by SWISH (with parsing)
* HM + type-constructor polymorphism + kind polymorphism:
  - http://ideone.com/q44ufk
    powered by IDEone (Fork to edit and run experiments)
  - TODO examples to be posted soon as SIWSH notebook
* HM + tycon poly + kind poly + (non-nested) pattern matching + Mendler-style recursion over algebraic data types:
  - http://ideone.com/Iv52Y5
    powered by IDEone (Fork to edit and run experiments)
  - TODO examples to be posted soon as SIWSH notebook

## Future Plans
* Error handling and parser integration.
* Support more features
  - extensible records by row polymorphism (as in PureScript)
    - *New update*: We already have all the ingredients to specify this in Prolog!
    See https://github.com/kyagrd/ExtensibleRecordsWithSetMembLP
  - term indices (as in Nax)
  - first class polymorphism and modules
  - Generalized Algebraic Data Type(GADT)s
  - qualified types such as type classes
  - null-handling (as in Kotlin)
  - measures of unit
  - ... (and maybe more including OO-related features) ...
* Research/case-study on alternative LP semantics including S-resolution, which may be better suited for type checking/inference.
* Implementation based on an embedded DSL for LP such as micro-Kanren. (This will lift the dependency on SWI-Prolog and make TIPER possible directly target many other languages where Kanren has already been implemented.)
* Plug-ins for IDEs and scriptable editors, which are do neccesarily depend on a specific compiler/interpreter implementation.  This will be possible when our project sucessfully delivers a mature (easy-to-use & portalbe) version of TIPER.

## Papers, Talks, and Projects related to TIPER
* [Executable Relational Specifications of Polymorphic Type Systems using Prolog](https://www.sharelatex.com/project/557756cfdfb75ebd54bf5807).
  Ki Yung Ahn and Andreas Vezzosi. FLOPS 2016.
  ([talk slides](http://slides.com/kyagrd/tiperdundee))

* [Structural Resolution (S-resolution)](http://staff.computing.dundee.ac.uk/katya/CoALP/)

* [Coinductive type systems for object-oriented languages](http://www.disi.unige.it/person/AnconaD/papers/Types_abstracts.html#AL-ECOOP09).
  D. Ancona and G. Lagori. ECOOP 2009 (LNCS 5653).

* [Delimited Continuations for Prolog](http://people.cs.kuleuven.be/~tom.schrijvers/portfolio/iclp2013.html).
  Tom Schrijvers and Bart Demoen and Benoit Desouter and Jan Wielemaker.
  ICLP 2013 (TPLP).
  ([talk slides](http://www-ps.informatik.uni-kiel.de/kdpd2013/talks/schrijvers.pdf))

* [miniKanren](http://miniKanren.org/)

## Members, Partners, Collaborators, and Contributors
* [Davide Ancona](http://www.disi.unige.it/person/AnconaD/)
* [Ki Yung Ahn](http://kyagrd.github.io/)
* [Peng Fu](http://staff.computing.dundee.ac.uk/pengfu/)
* [Ekaterina Komendanskaya](http://staff.computing.dundee.ac.uk/katya/)
* [Patricia Johan](http://cs.appstate.edu/~johannp/)
* [Tom Schrivers](http://people.cs.kuleuven.be/~tom.schrijvers/)
* [Andrea Vezzosi](http://www.cse.chalmers.se/~vezzosi/)
