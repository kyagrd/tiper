TIPER aims to automatically generate Type Inference Prototyping Engine from Relational specifications of type systems. Our ultimate goal for the TIPER project is to build a framework that automate the design and implementation of type systems just as the design and implementation of grammars are automated by parser generators, ever since Yacc was developed in the 70's. This project will reduce the high-cost of type system design and type inference engine implementation so that advancedments in type systems research would become much more avilaible to the developers as a technonlgy that is reasonlbly cost-effective to support in a langauge implementation.
You may take a look at the [talk slides on TIPER](http://slides.com/kyagrd/tiperdundee) if you are interested in further details.

In our preliminary case study, we have demonstrated that Logic Programming (LP) is suitable for declarative & executable specifications of polymorphic type systems including advanced features such as type-constructor polymorphism (a.k.a. higher-kinded polymorphism) and kind polymorphism, in addition to type polymorphism in the Hindley--Milner type system (HM). Because our specification is _relational_, rather than functional, we were able to specify both type checking and type inference without duplication. Being based on LP, our specification is _excutable_ on a machine. Executable specifications reduce the gap between a specification and an implementation. Our specification is not only executable for testing the result of type checking but also serves as a reference implementation for a type inference engine, because the specification can run both ways bidirectionally as a logic program.

## Interactive Examples on-line
Here are some examples from our FLOPS 2016 sumbission made accessible via online SWI-Prolog environments.
You can do simple experiments within these webpages, without installing SWI-Prolog on your local system.

* Simply-Typed Lambda Calculus (STLC)
  - http://ideone.com/WcKYu0
    powerd by IDEone (Fork to edit and run experiments)
  - http://kyagrd.koding.io:3050/example/STLC.swinb
    powerd by SWISH (with parsing)
* Hindley--Milner type sysstem (HM):
  - http://ideone.com/cI0oXR
    powerd by IDEone (Fork to edit and run experiments)
  - http://kyagrd.koding.io:3050/example/HM.swinb
    powerd by SWISH (with parsing)
* HM + type-constructor polymorphism + kind polymorphism:
  - http://ideone.com/q44ufk
    powerd by IDEone (Fork to edit and run experiments)
  - TODO examples to be posted soon as SIWSH notebook
* HM + tycon poly + kind poly + (non-nested) pattern macthing + Mendler-style recursion over algebraic data types:
  - http://ideone.com/Iv52Y5 TOOD still need some work on the example TODO
    powerd by IDEone (Fork to edit and run experiments)
  - TODO examples to be posted soon as SIWSH notebook

## Future Plans
* Error handling and parser integration.
* Support more features 
  - row polymorphism (as in PureScript)
  - term indices (as in Nax)
  - qualified types such as type classes
  - null-handling (as in Kotlin)
  - measures of unit
  - ... (and maybe more)
* Research/case-study on alternative LP semantics including S-resolution, which may be better suited for type checking/inference.
* Implementation based on an embedded DSL for LP such as micro-Kanren. (This will lift the dependency on SWI-Prolog)
* Plugins for IDEs and scriptable editors.

## Papres related to TIPER
* [Executable Relational Specifications of Polymorphic Type Systems using Prolog](https://www.sharelatex.com/project/557756cfdfb75ebd54bf5807), Ki Yung Ahn and Andreas Vezzosi, submitted to FLOPS 2016 ([talk slides](http://slides.com/kyagrd/tiperdundee))
* TODO add S-resolution and its application to type classes, coLP for OOPL type inference, etc ...
