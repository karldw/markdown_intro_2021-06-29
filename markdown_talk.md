
---
title: "Intro to Markdown"
author: "[Karl Dunkle Werner](https://karldw.org)"
date: "June 29, 2021<br><br>Slides: https://github.com/karldw/markdown_intro_2021-06-29"
output:
  revealjs::revealjs_presentation:
    transition: none
    incremental: false
    slide_level: 1
    css: revealjs_slides.css
    mathjax: default
    pandoc_args:
       - "--filter"
       - "pandoc-citeproc"
       - "--bibliography"
       - "refs.bib"
    reveal_options:
        controls: false
        slideNumber: "c"
        disableLayout: true
---

# Thank you, Pamela!


- #econ_prosem is a great service


# What?

- Plain text
    - ([Which is a very good thing!](https://plain-text.co/))
- Readable by itself
- That gets converted into HTML



# Why?

- Lighter weight than LaTeX
    - Easier to jot things down
    - Less fiddly
    - Failure to compile is very rare
- Usable in places Word and LaTeX aren't
    - e.g. every Github page you've seen
    - Your own website (come back July 13!)


# Why?

- Easy to use with version control (e.g. Git)
    - Track changes to your code *and your words* over time
    - Easily search through history
- Prettier than just writing in a `.txt` file



# How do you write it?

- Recommended: Find a general-purpose text editor you like
    - VS Code, Atom, Emacs, Nano, Sublime, Vi, ...
- Or: edit in-website
    - Github
    - Today: [Hedgedoc](https://hedgedoc.org/)

# Syntax Details

- https://www.markdownguide.org/basic-syntax
- https://www.markdownguide.org/extended-syntax

# Basics

- Headings
- Items
- Enumerations
- Code
- Links
- Images
- Math

# Headings


::: {.container}
:::: {.col}
![header markdown](demo_headers1.png)

::::
:::: {.col}
![header rendered](demo_headers2.png)

::::
:::



# Items



::: {.container}
:::: {.col}

```
Groceries:

- Yeast
- Flour
- Basil


Or with checkboxes (not universal):

- [x] Mozzarella
- [ ] Chili flakes
```
::::
:::: {.col}
Groceries:

- Yeast
- Flour
- Basil

Or with checkboxes (not universal):

- [x] Mozzarella
- [ ] Chili flakes
::::
:::


# Enumerations



::: {.container}
:::: {.col}
```
Colors I know:

1. Magenta
1. Cyan
1. Black

Colors I don't know:

4. Taupe
8. Chartreuse
7. Puce
```
::::
:::: {.col}
Colors I know:

1. Magenta
1. Cyan
1. Black

Colors I don't know:

4. Taupe
8. Chartreuse
7. Puce
::::
:::


# Emphasis


::: {.container}
:::: {.col}
```
*Italic* or _italic_

**Bold** or __bold__

***Bold italic*** or ___bold italic___

~~strikethrough~~
```
::::
:::: {.col}
*Italic* or _italic_

**Bold** or __bold__

***Bold italic*** or ___bold italic___

~~strikethrough~~

::::
:::

# Math (inline)

- In: `$a^2 + b^2 = c^2$`
- Out: $a^2 + b^2 = c^2$


# Math (display)

```
\[
\begin{align}
\int_0^\infty f(\cos^2(\psi)) &= z_0\\
&= \pi r^2
\end{align}
\]
```

\[
\begin{align}
\int_0^\infty f(\cos^2(\psi)) &= z_0\\
&= \pi r^2
\end{align}
\]

Caveats:

1. Depends on [Mathjax](https://www.mathjax.org/), which is in some, but not all markdown renderers
1. The [list of supported commands](https://docs.mathjax.org/en/latest/input/tex/macros/index.html) is very long, but it's not a LaTeX substitute




# Comments and Escapes

```
<!--
Block comments

escape everything inside (except in a code block)

This is the same as comments in HTML code
-->

```

<!--
Block comments

escape everything inside

And are the same as HTML comments
-->

- Escape special characters with `\`


# Links

- Plain URLs and emails get auto-linked (usually)
    - https://twitter.com/hashtag/econ_prosem
    - karldw@berkeley.edu
- Text links have the form `[words to display](URL)`
    - In: `[Twitter](https://twitter.com)`
    - Out: [Twitter](https://twitter.com)
- We can also link within the document:
    - In: `[Last section](#/comments-and-escapes)`
    - Out: [Last section](#/comments-and-escapes)

# Links to images
- Images are almost identical, but with `!` before `[`
    - In: `![penguin logo](palmerpenguins_logo.png)`
    - Out:

![penguin logo](palmerpenguins_logo.png)

# Tables

- Sometimes easy to read
- Always a pain to write
- Have a computer do it for you (e.g. knitr in R)


::: {.container}
:::: {.col}
```
| Reg. A      | Reg. B          |
| ----------- | --------------- |
| 3.14        | 0.01            |
| [1.0, 10.0] | [-0.001, 0.015] |
```
::::
&#8594;
<!-- right arrow -->

:::: {.col}
| Reg. A      | Reg. B          |
| ----------- | --------------- |
| 3.14        | 0.01            |
| [1.0, 10.0] | [-0.001, 0.015] |

::::
:::









# More fancy markdown

- References
- R Markdown (`.Rmd`)
    - Works with Stata too, with [some setup](https://www.ssc.wisc.edu/~hemken/Stataworkshops/Stata%20and%20R%20Markdown/StataMarkdown)
- Direct HTML/CSS
- Footnotes (support varies)
- [Pandoc](https://pandoc.org/) conversion to other formats



# References

- Citations (via [Pandoc](https://pandoc.org/) & [Citeproc](https://github.com/jgm/citeproc))
    - Input: `@Pigouvian_taxes:1932` (from my bib file)
    - Output: @Pigouvian_taxes:1932

```
<!-- Code to ask pandoc to print refs: -->
::: {#refs}
:::
```

::: {#refs}
:::

<!--
Notes:

- Tables are easy-ish to read, but a pain to write
    - Tools like R Markdown will do it for you
-


-->

# [R Markdown](https://rmarkdown.rstudio.com/)

- Combines code and text
- Never have to copy updated tables, figures, or numbers into your text
- Works with Markdown or LaTeX

![R markdown flow](rmarkdownflow.png)

# What does R Markdown [output](https://github.com/allisonhorst/palmerpenguins) look like?

![palmerpenguins README screenshot rendered](palmerpenguins_rmd1.png)

# What does R Markdown &#8594; [Markdown](https://raw.githubusercontent.com/allisonhorst/palmerpenguins/master/README.md) look like?

![palmerpenguins README screenshot markdown file](palmerpenguins_rmd2.png)

# What does the original [R Markdown](https://github.com/allisonhorst/palmerpenguins/blob/master/README.Rmd) look like?

![palmerpenguins README screenshot R markdown file](palmerpenguins_rmd3.png)


# Questions?

- Let's try it out in Hedgedoc (link in the chat)