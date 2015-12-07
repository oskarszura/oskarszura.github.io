---
layout: post
category: Others
published: false
---

This week I was asked to prepare some presentation on how to embrace stylesheets in large scaled projects. A lot of front-end developers underestimate power of well structured stylesheets and think about stylesheets as a not challenging task - but it can be a tricky trap when it comes about future maintenance.

I've went through some stylesheets modern techniques and patterns and pretty quickly I've found this [post by Una Kravets](http://www.sitepoint.com/atomic-oobemitscss/) which explains a pattern combination called (silly) OOBEMITSCSS. As the acronym may not be so straight forward the technique itself it pretty simple to understand. OOBEMITSCSS is a concatenation from OOCSS + BEM + IT + SCSS. I've found also some extensions and variations to this method like 'Atomic OOBEMITSCSS' etc. but the most important thing about this pattern are it's ingredients:
* BEM (Block Element Modifier)
* OOCSS (Object Oriented CSS)
* ITCSS (Inverted Triangle CSS)
* Atomic - didn't try this one yet, so I won't talk it over.

Let's take a short tour on every of this methods.

#### BEM
**Why:** This method aims to solve on 'how to name particular selectors'. It may not be the most valuable obstacle to solve in one-person based projects but it's definitely valuable in projects which have many collaborators.

**How:** Basically this method is a set of rules which say to organise HTML markups into 'blocks' and those may be build of 'elements'. Every block and/or element can be modified by a 'modifier' class. Let's take a quick example of that

<pre><code>
    .list { // block

        &__position { // item

            &--odd { // item modifier

            }

        }

        &--orange { // block modifier

        }

    }
</code></pre>

in the above example the .list class is a block and it's built-up from .list__item elements,

**More:** [Externals: http://getbem.com](www.getbem.com)

#### OOCSS
Why: Object oriented CSS is widely applied technique which makes the code more reusable and DRY - it implicates the styles more light-weight.

What's it about:

#### Inverted triangle CSS
Why: This method raised to solve the ['specificity wars'][(https://stuffandnonsense.co.uk/archives/css_specificity_wars.html) issue.

What's it about:


