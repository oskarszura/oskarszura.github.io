---
layout: post
category: Others
published: true
---

This week I was asked to prepare some presentation on how to embrace stylesheets in large scaled projects. A lot of front-end developers underestimate power of well structured stylesheets and think about stylesheets as a not challenging task - but it can be a tricky trap when it comes about future maintenance.

I've went through some CSS modern techniques and patterns and pretty quickly I've found this [post by Una Kravets](http://www.sitepoint.com/atomic-oobemitscss/) which explains a pattern combination called (silly) OOBEMITSCSS. As the acronym may not be so straight forward, but the technique itself it pretty simple to understand. OOBEMITSCSS is a concatenation from OOCSS + BEM + IT + SCSS. I've found also some extensions and variations to this method like 'Atomic OOBEMITSCSS' etc. but the most important thing about this pattern are it's ingredients:

* BEM (Block Element Modifier)
* OOCSS (Object Oriented CSS)
* ITCSS (Inverted Triangle CSS)
* Atomic - didn't try this one yet, so I won't talk it over.

Let's take a short tour on every of these methods.

#### BEM
**Purpose:** This method aims to solve on 'how to name particular selectors'. It may not be the most valuable obstacle to solve in one-person based projects but it's definitely valuable in projects which have many collaborators. Basically this method is a set of rules which organise HTML markups into 'blocks' and those may be build of 'elements'. Every block and/or element can be modified by a 'modifier' class (or mixes - unrelated with enything modifiers). 

**Example:**

Let's take a quick example of that

<pre><code>
    .is-hidden { // mix (not a mixin)
      display: none;
    }

    .list { // block
        position: relative;
        background-color: white;

        &__position { // element
            border: 1px solid black;

            &--odd { // element modifier
                background-color: gray;
            }

        }

        &--orange { // block modifier
            background-color: orange;
        }

    }
</code></pre>

in the above example the .list class is a block and it's built-up from .list__position elements. Both the .list block and the .list__position element have modifiers - respectively .list--orange and .list__position--odd.
 
Maybe you've noticed already one important thing within the code. After transpilation process from SCSS to CSS all selectors will be flat. it's because BEM wants all the selectors (whether it's block, element or modifier) to be flat. 

**More:** [www.getbem.com](http://getbem.com)

#### OOCSS
**Purpose:** Object oriented CSS is widely applied technique which makes the code more reusable and DRY - it implicates the styles more light-weight.



#### Inverted triangle CSS
Why: This method raised to solve the ['specificity wars'][(https://stuffandnonsense.co.uk/archives/css_specificity_wars.html) issue.

What's it about:


