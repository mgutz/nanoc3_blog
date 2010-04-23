---
created_at: 2010/03/12
excerpt: Templa is a statically compiled, simpler, and more object-oriented approach to templating for the JVM.
kind: article
publish: false
tags: [scala, web]
keywords: scala template engine, scala code infusion, jvm code infusion
title: "Templa Is Code Infusion"
---

_Templa_ is a statically compiled, simpler, and more object-oriented approach to templating for the JVM.

_Templa_ infuses code from an external source into a function.
The code is usually in an alternate format such as, but not limited to, 
XML, HTML, HAML, JSP. The template is first transformed into Scala 
and then infused into a source file.

## Why?

Template engines have evolved to 
become a language unto their own, rich with inheritance, partials 
or even components. Why is that a good thing when a developer's primary language such as Java, Scala or C# already does that very well?

Template engines have creative ways to deal with context binding, speed
and lack of static type checking. Ruby probably has the most template
engines because the language provides meta-programming facilities
beyond most static typed languages.  Static typed languages use 
reflection, which is probably faster than Ruby despite being frowned upon when used,
to build the binding context for the template. This often requires
the developer to pass render arguments complete with type information. In
some cases, naming conventions are used to derive the type.

_Templa_ offers a different approach by infusing code into
functions. The code is the output of text transformation from template
markup such as JSP, HAML, etc. As part of the function, the infused code access to any local
variables (private or public) as well as instance and class variables.
_Templa_ lets developers
think in their favorite language instead of yet another language.
Partials become functions. Layouts and page view hierarchy is achieved through inheritance and/or
composition.

More to come in an upcoming article.


## Example

Template + Class Skeleton == Infused Class

    # indexview_render.ham
    <p>Hello, my name is #{name}!</p>

    # index.scala
    object IndexView {
      var name = "noOb"
      
      def render:String = {
        //#infuse src="index_render.ham"
      }
    }

    # output
    IndexView.render //=> "<p>Hello, my name is noOb!</p>"

The `//#infuse src="index_render.ham"` line instructs _Templa_ to
transform the file, `index_render.ham`, into code by using the default template
processor and then replace the line. `index.scala` becomes:

    object IndexView {
      var name = "noOb"
      
      def render:String = {
        { // BEGIN INFUSION
          val output = new StringBuilder
          output.append("<p>Hello, my name is ")
          output.append(name)
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
