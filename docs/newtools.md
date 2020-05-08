# The Tools Handbook

# Table of contents

- [Pharo Tools](#PharoTools)

- [The Playground](#ThePlayground)
  - [The Playground](#StPlayground)

# The Playground
It is useful to explore ideas or learn something before writing it to a more definitive place.
In older versions of Pharo, this tool was known as Workspace.
The idea of a playground is not new in smalltalk systems and many other dynamic languages have implemented in one way or another some features of it, usually through a REPL, which shares much of a playground functionality. 
Some of the things a playground can do for you: 

- it can execute code (and print its results).
- it can debug some piece of code you just typed.
- it can search references, implementors and senders
- it can store variables (both locally or shared to all playgrounds).

## Opening:
You usually will open a playground by choosing it from the Pharo menu (Playground option), but it can also be opened programatically. 
```Smalltalk
StPlayground open.
StPlayground openContents: 'Some scripting'
```

## Using the playground
Most of the functionalities a playground does can be found in the context menu of it (<meta+t> or right button click), and we will not explain in detail each of them. But there are some usages that may requirse some more documentation than "self discovery". Here are some hints you may find useful: 
### Keyboard friendly
There is a shortcut, `<Meta+t>`, that will show the context menu corresponding to the playground. Additionaly, there will be entries to control also what you can find in the toolbar or status bar. This redundancy is intentional and it will allow the user to navigate through all the options of the playgrounds without needing a secondary device (which, of course, can be used anyway if desired).
### The print it popover
If you try to print results of a computation, you will see that you receive a popover with the results of the execution (e.g. `21*2` will show a popover with the `42` number). There are some other things you can do with this popover besides just dismiss it (pressing `<esc>`, `<backspace>` or just focusing somewhere else).
You can also: 

- press <cr> to print the result into your playground (it will be shown enclosed with "quotation marks", as a comment.
- press <meta+i> to inspect the result.

### The bindings window
The bindings window will be shown by selecting the "Bindings" option of the context menu or toolbar.
You will see the variables panel and an inspector allowing you to explore/modify the values of a variable. There is also a context menu in the variables list that will allow you some other options. One interesting option you will see is the "make variable shared" option. This option will make the variable common to all playgrounds! This is an easy way to explore some posibilities in a separated space, not modifying what you already have there.
See [StPlaygroundBindingsPresenter](#StPlaygroundBindingsPresenter)
### The pages window
The pages window will be shown by selecting the "Pages" option of the context menu or toolbar.
This window will list all playgrounds pages stored in the playground cache directory. You can choose any playground edited in any moment and load it into your playgroud.
See [StPlaygroundPagesPresenter](#StPlaygroundPagesPresenter)

**TODO:**: StPlaygroundBindingsPresenterI am a presenter to show all bindings of parent Playground.
I show a list of active bindings. 
A panel to inspect each of the bindings values is shown too.
**TODO:**: StPlaygroundPagesPresenterI am a presenter to show saved pages from a playground. 
A playground saves (or tries to save) everything you will put in a playground and it will store in the playground cache to make it available later (or even outside the image).
I show a list and a preview of a page content, to allow users to chose a page to load.