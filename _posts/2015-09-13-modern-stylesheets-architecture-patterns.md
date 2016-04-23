---
layout: post
category: css
published: true
tags: css bem oocss architecture front-end
---

This week I was asked to prepare some presentation on how to embrace stylesheets in large scaled projects. A lot of front-end developers underestimate power of well structured stylesheets and think about stylesheets as a not challenging task - but it can be a tricky trap when it comes about future maintenance.

I've went through some CSS modern techniques and patterns and pretty quickly I've found this [post by Una Kravets](http://www.sitepoint.com/atomic-oobemitscss/) which explains patterns combination called (silly) OOBEMITSCSS. The acronym may not be so straight forward, but the technique itself it pretty simple to understand. OOBEMITSCSS is a concatenation from OOCSS + BEM + IT + SCSS. I've found also some extensions and variations to this method like 'Atomic OOBEMITSCSS' etc. but the most important thing about this pattern are it's ingredients:

* BEM (Block Element Modifier)
* OOCSS (Object Oriented CSS)
* ITCSS (Inverted Triangle CSS)
* Atomic - didn't try this one yet, so I won't talk it over.

In this short article, I won't explain in detail each of the patterns (cause I think each of them deserves more robust explanation and a lot of good examples) but rather, explain their main purposes and principles. Let's take a short tour on every of these methods then.

#### BEM - Block Element Modifier
Block Element Modifier is a CSS pattern [introduced](https://en.bem.info/method/history/) by a Yandex team in 2009, after almost 4 years of shaping it's principles. This method aims to solve the issue of naming CSS blocks and selectors. This pattern may not be the most valuable in one-person based projects but it's definitely valuable in large-scaled projects which have many collaborators. Basically this method is a set of rules which organise HTML markups into 'blocks' and those may be built-up of 'elements' (prefixed with doubled low dash). Blocks are independent and reusable, separated and generic objects, which correspond to specific business layer elements (like comment box, menu etc.). Every block and/or element can be modified by a modifiers (prefixed by doubled dash) class (or mixes - unrelated with anything modifiers). 

Let's take a quick example of how this pattern can be applied in practice:

```scss
    .is-hidden { /* mix (not a mixin) */
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
```

```html
  <ul class="list">
    <li class="list__position">
      Position 1
    </li>
    <li class="list__position--odd">
      Position 2
    </li> 
    <li class="list__position">
      Position 3
    </li>
    <li class="list__position--odd is-hidden">
      Position 4
    </li>         
  </ul>
  
  <ul class="list list--orange">
    <li class="list__position">
      No positions :(
    </li>  
  </ul>
  
  <p class="is-hidden">
    Secret message
  </p>
</code></pre>
```

In the above example the .list class is a (independent) block. It's built-up from .list__position elements. Both the .list block and the .list__position element have it's modifiers - respectively .list--orange and .list__position--odd. Modifiers are tightly related with it's blocks or elements, and can be applied only to them. As you've may also noticed there's .is-hidden mix - those can be applied to any block or element (or actually anything else) and they're not related logically with any of them.
 
There's also one interesting and important detail in the SCSS code. After transpilation process from SCSS to CSS all selectors will be flat. It's because BEM wants all the selectors (whether it's block, element or modifier) to be flat. A good justification for such the structure is it's a good remedy for the specificity issues. 

[Learn more about BEM](https://www.smashingmagazine.com/2012/04/a-new-front-end-methodology-bem/)

#### OOCSS - Object Oriented CSS
Object oriented CSS has been [introduced](http://www.slideshare.net/stubbornella/object-oriented-css) by Nicole Sullivan at Web Directions North in 2008. Today it's widely applied technique which makes the code more reusable, DRY and light-weight. This technique has two fundamental principles:

<blockquote>
"There are two main principles [in object-oriented CSS]: the first is to separate the structure from the skin and the second is to separate the container from the content." - Nicole Sullivan
</blockquote>

The above quote is the philosophy of the OOCSS pattern in a nutshell, but it would be quite helpful to have some concepts explained first. Let's start with explanation, of what is an object ("structure") in OOCSS. We can use the author's quote as the explanation:

<blockquote>
“It's a repeating visual pattern, that can be abstracted into an independent snippet of HTML, CSS and possibly JavaScript.” - Nicole Sullivan
</blockquote>

I think it was pretty intuitive to you to conclude that an object (or a "structure") in OOCSS is just a generic snippet of CSS code which is reusable and represents a separated and independent object on the business layer. The objects we've described are just generic, raw elements but eventually, every website has to have applied some fancy design. In order to achieve that, objects can be "skinned" by a separated CSS classes which describes their look and feel - so called "skins". Regarding to the last part of the "philosophy" of OOCSS, which is "separate container from the content", just treat every object as a generic class which can be placed everywhere within the markups. Don't bind it with any tag, like (footer or main) neither with any specific ID. Just keep it as generic as possible.  

At this moment, we have cleared all the concepts so let's get through a simple example of how to implement such the principles in the real world.

```scss
  .menu { // object
    width: 100%;
    display: block;
    
    .position {
        display: inline-block;
    }
  }
  
  .menu-skin-blue { // skin
    background-color: 1px solid $color-blue-subtle;
  
    .position {
      border: 1px solid $color-bright-blue;
    }
  }
  
  .menu-skin-red { // skin
    background-color: 1px solid $color-red-angry;
  
    .position {
      border: 1px solid $color-bright-red;
    }
  }
```

```html
  <main>
    <div class="menu menu-skin-blue">
      <div class="position">
        Position 1
      </div>
      <div class="position">
        Position 2
      </div>
      <div class="position">
        Position 3
      </div>        
    </div> 
  </main>
```

As you can see we keep the skins separated from the structures as well as the containers from it's content - hence we may apply the object (the .menu class) to any element there is and skin it freely.

[Learn more about OOCSS](https://www.smashingmagazine.com/2011/12/an-introduction-to-object-oriented-css-oocss/)

#### IT CSS - Inverted triangle CSS
This method raised to solve the [specificity wars](https://stuffandnonsense.co.uk/archives/css_specificity_wars.html) conundrum. It's more a writing technique rather than a pattern. In many cases when you write CSS code it's hard to guess after a while what specificity should you assign to a particular selector - as previously there's probably a lot of nesting, IDs and importants. So why not keeping it clear and simple from the start? IT CSS says to write the most generic code at the very top and the most specific code at the bottom. Let's analyse the code below:
 
```scss
  // bad code 
  
  .selector-1 { // specificity 0,0,1,0
    // styles  
  
    .selector-1-1 { // specificity 0,0,2,0
      // styles
    }
  }
  
  #selector-a { // specificity 0,1,0,0
    // styles
  }
  
  .selector-2 { // specificity 0,0,1,0
    // styles
  
    #selector-b { // specificity 0,1,1,0
      // styles
    }
  
    .selector-2-2 { // specificity 0,0,2,0
      // styles
    }
  }  
  
  .selector-3 { // specificity 0,0,1,0
    // styles
    
    &.selector-3-a { // specificity 0,0,2,0
      // styles
    
      &.selector.3-b { // specificity 0,0,3,0
        // styles
      }
    }
  }
```

The above selectors specificity has a visual graph representation below. You can probably see that it's a bit messy, and every nest or ID will keep you confused about a specificity. Now let's sort the selectors in a proper order. 

<img src="/assets/images/2015-09-13-01.png" />

```scss
  // good code 
  
  .selector-1 { // specificity 0,0,1,0
    // styles
  }
  
  .selector-2 { // specificity 0,0,1,0
    // styles
  }
  
  .selector-3 { // specificity 0,0,1,0
    // styles
  }
  
  .selector-1 { 
     .selector-1-1 { // specificity 0,0,2,0
       // styles
     }
   }
 
  .selector-2 { 
    .selector-2-2 { // specificity 0,0,2,0
      // styles
    }
  }  
  
  .selector-3 { 
    &.selector-3-a { // specificity 0,0,2,0
      // styles
    }
  }
  
  .selector-3 { 
    &.selector-3-a { 
      &.selector.3-b { // specificity 0,0,3,0
        // styles
      }
    }
  }
  
  #selector-a { // specificity 0,1,0,0
    // styles
  }  
  
  .selector-2 {
    #selector-b { // specificity 0,1,1,0
      // styles
    }
  }
```

As you probably have noticed, when we have those selectors ordered from the most generic to the most specific - it's relatively easy to add some further code, without over writing the previously created styles. 

<img src="/assets/images/2015-09-13-02.png" />

[Learn more about ITCSS](http://csswizardry.com/2014/10/the-specificity-graph/)


#### Conclusion

We've went through few patterns and now you know how to apply each of those methods. From my personal experience I can say that applying those patterns at my projects was life-saving in regards to the CSS maintenance. There's no much examples of how to actually apply OOBEMITSCSS, but here's a quickly made [example](https://github.com/oskarszura/sample-oobemitcss-implementation). 


