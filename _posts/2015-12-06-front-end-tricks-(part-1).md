---
layout: post
category: Others
---

CSS and HTML are those part of front-end development which are often neglected by vast majority of developers, hence many of them don't know many interesting nuances of it. In this part I'm going to present few of them:

- Document flow
- Inline-block gap
- Specificity

#### Document flow

##### What is the document flow?

The document flow is the concept in which DOM elements are being displayed in CSS by default (without any CSS modifications). In other words it describes the way that block elements are being displayed one below another and inline elements one next to another etc.

The document flow can be affected by only two CSS properties which are *float* and *position*. As for the first one (*float*) we can use a technique called clear-fix or property "clear: both" to get document-flow back on track. However the second one leaves us no options for returning default document-flow.

<embed type="image/svg+xml" src="/assets/images/2015-12-06-01.svg" />

Let's get through an example:

<pre><code>&lt;div&gt;
    &lt;div style="float: left;"&gt;Sample DIV&lt;/div&gt;
    &lt;div style="clear: both;"&gt;&lt;/div&gt;
&lt;/div&gt;
</code></pre>

In the above we use native *clear: both* in order to restore a floated div element to the normal document flow within the document.

Another, more popular method (but also the one which requires more modern browsers - because of the property *content: " "* ) it the 'clearfix' technique. The most beneficial thing coming from this technique is avoiding an extra tag at the very end.

<pre><code>.clearfix:after {
   content: " ";
   visibility: hidden;
   display: block;
   height: 0;
   clear: both;
}

&lt;div class="clearfix"&gt;
   &lt;div style="float: left;" class="clearfix"&gt;Sample DIV&lt;/div&gt;
&lt;/div&gt;
</code></pre>

##### Conclusion

Keep in mind what is the normal flow of the document and how it can be impacted. If you'll face already modified document flow, you now know how to restore it.

#### Inline-block gap

##### The issue

Many of developers are not even aware that it exists. When DOM elements occur one after another and their 'display' property is set to 'inline' or 'inline-block'  and their HTML markups contain return or space, a gap between them is created.

<pre><code>&lt;nav&gt;
  &lt;a href="#"&gt;Nav-1&lt;/a&gt; &lt;a href="#"&gt;Nav-2&lt;/a&gt;
  &lt;a href="#"&gt;Nav-3&lt;/a&gt;&lt;a href="#"&gt;Nav-4&lt;/a&gt;
&lt;/nav&gt;
</code></pre>

<pre><code>nav a {
  display: inline-block;
  padding: 2px 3px;
}
</code></pre>

will output the below

<div class="example">
<nav class="example-2015-12-06-1">
  <a href="#">Nav-1</a> <a href="#">Nav-2</a>
  <a href="#">Nav-3</a><a href="#">Nav-4</a>
</nav>
</div>

as you can see between each Nav-1, Nav-2 and Nav-3 tag there's a visible gap - that is because between closing and opening tags were white spaces, which doesn't occur between Nav-3 and Nav-4.

##### How to remove the spaces?

Unfortunately there's no straight-forward solution for this issue but there are some workarounds which can help:

* Skip the white spaces between the markups (between the closing and opening braces should be no space in any form)

<pre><code>&lt;nav&gt;
  &lt;a href="#"&gt;Nav-1&lt;/a&gt;&lt;a href="#"&gt;Nav-2&lt;/a&gt;&lt;a href="#"&gt;Nav-3&lt;/a&gt;&lt;a href="#"&gt;Nav-4&lt;/a&gt;
&lt;/nav&gt;</code></pre>

* Set negative margins between the particular elements.

<pre><code>nav a {
  display: inline-block;
  padding: 2px 3px;
  margin-left: -4px;
}
</code></pre>

* Remove the closing tags

<pre><code>&lt;nav&gt;
  &lt;a href="#"&gt;Nav-1
  &lt;a href="#"&gt;Nav-2
  &lt;a href="#"&gt;Nav-3
  &lt;a href="#"&gt;Nav-4
&lt;/nav&gt;
</code></pre>

* Set to the container property *font-size: 0*

<pre><code>nav a {
  display: inline-block;
  padding: 2px 3px;
  font-size: 12px;
}

nav {
  font-size: 0;
}
</code></pre>

##### Conclusion

This is the most common puzzler for any developers who start to code any basic front-end markups and you can waste a lot of time wondering about this empty gap. Remember that this is a native behaviour of the CSS styles and know how you can fix it.


#### Specificity

Some developers may not know that rules which determines which styles are applied to a particular DOM over another are not random and obey some precise logic and values. Those values are called the *specificity*. Specificity is the value which says which style is more important over another and will be applied to the particular DOM element. So now we know what the *specificity* is but there's one question left - how to actually calculate it?

Every selector type has assigned specificity factor:

* inline styles - x10000
* ids - x1000
* classes, pseudo classes, attributes - x100
* elements, pseudo-elements - x1

pretty simple, right? Let's take a look at some examples then.

<pre><code>nav a {} // specificity = 1 + 1 = 2
#my-account .login // specificity = 1000 + 100 = 1100
a::before // specificity = 1 + 1 = 2
.nav-button.nav-button.nav-button // specificity = 100 + 100 + 100 = 300
</code></pre>

The above examples are just sample calculations (you can use [this specificity calculator](https://specificity.keegan.st/) to play with some values). But let's take a look at some real-life example:

<pre><code>nav.my-nav a {
    color: #000099; // 0012
  }

  nav.my-nav a.nav-button {
    color: #009999; // 0022
  }

  .nav-button.nav-button.nav-button {
    color: #990000; // 0030 - the strongest
  }

&lt;nav class="my-nav"&gt;
  &lt;a class="nav-button" href="#"&gt;Nav-1&lt;/a&gt;
  &lt;a class="nav-button" href="#"&gt;Nav-2&lt;/a&gt;
  &lt;a class="nav-button" href="#"&gt;Nav-3&lt;/a&gt;
&lt;/nav&gt;
</code></pre>

<div class="example example-2015-12-06-2">
<nav class="my-nav">
  <a class="nav-button" href="#">Nav-1</a>
  <a class="nav-button" href="#">Nav-2</a>
  <a class="nav-button" href="#">Nav-3</a>
</nav>
</div>

As you see this example might not be the most intuitive, but if you'll calculate the selectors specificity *.nav-button.nav-button.nav-button* will be the strongest, hence it's color will be applied over the others.

The CSS styles are applied along with the specificity values and there are no exceptions from it, except... ;) correct, inline styles and *!important* flag. Those two have the highest priority of all the others (although *!important* is stronger than the inline styles).

##### Conclusion

The specificity is one of the most fundamental concepts in regards to the CSS. The knowledge of how styles are being applied can save a lot of time.

#### Additional materials
* <a href="/assets/presentations/2015-12-06-front-end-tricks-(part-1).pdf">Presentation</a>