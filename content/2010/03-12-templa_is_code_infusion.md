---
created_at: 2010/03/12
excerpt: Templa is a simple, compiled and object-oriented approach for templates on the JVM.
kind: article
publish: true
tags: [scala, web]
keywords: scala template engine, scala code infusion, java code infusion, java template engine
title: "Templa Is Code Infusion"
---

_Templa_ is a simple, compiled and object-oriented approach for templates on the JVM.

_Templa_ infuses code from an external source into a function.
The code is usually in an alternate format such as, but not limited to, 
XML, HTML, HAML, JSP. The template is first transformed into Scala source code
and then infused into a source file.

## Why?

Template engines have evolved to 
become a language unto their own, rich with inheritance, partials 
or even components. Why is that a good thing when a developer's primary language such as Java, Scala or C# already does that very well?

Template engines have creative ways to deal with context binding, speed
and lack of static type checking. Ruby probably has the most template
engines because the language provides meta-programming facilities
beyond what most static typed languages provide. Static typed languages resort to 
reflection, which is probably faster than Ruby despite being frowned upon when used,
to create the binding context for a template. Often times, there is not enough information and 
the developer has to pass render arguments complete with type information. In
some cases, naming conventions are used to derive the type.

_Templa_ offers a different approach by infusing code into
functions. The code is the output of text transformation from template
markup such as JSP, HAML, etc. As part of the function, the infused code has access to any 
local, instance or class variable whether it be public or private.
_Templa_ lets developers think in their favorite language.
Partials become functions. Layouts and page view hierarchy is achieved through inheritance and/or
composition.

More to come in an upcoming article.


## Example

Template + Class Skeleton == Infused Class

    ## index_render.ham
    <p>Hello, my name is #{name}, aka #{aka}, from #{planet}!</p>

    ## index.scala
    object Index {
      var name = "noOb"

      def render(planet:String):String = {
        val aka = "newb"
        //#infuse src="index_render.ham"
      }
    }

    ## output
    Index.render("Mars") //=> "<p>Hello, my name is noOb, aka newb, from Mars!</p>"

The `//#infuse src="index_render.ham"` line instructs _Templa_ to
transform the file, `index_render.ham`, into code by using the default template
processor and then replace the line. Here is the generated file:

    ## generated/index.scala
    object Index {
      var name = "noOb"

      def render(planet:String):String = {
        val aka = "newb"
        { // BEGIN INFUSION
          val output = new StringBuilder
          output.append("<p>Hello, my name is ")
          output.append(name)
          output.append(", aka ")
          output.append(aka)
          output.append(", from ")
          output.append(planet)
          output.append("!</p>")
          output.toString
        } // END INFUSION
      }
    }

## Status

_Templa_ is being tested first as a task in `sbt`. I will post the Scala source
on github once a simple website example is functional and a screencast :) 
Future plans include integration in the Play Framework 1.1, once it goes into Beta as well
as integration into my fork of the lightweight Sinatra-like `step` framework.
