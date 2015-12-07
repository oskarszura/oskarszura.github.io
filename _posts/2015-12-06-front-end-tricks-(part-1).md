---
layout: post
category: Others
published: false
---

CSS and HTML are those part of front-end development which are often neglected by vast majority of developers hence many of them don't know many interesting nuances of it. In this part I'm going to present few of them:

- HTML scope
- Document flow
- Inline-block gap
- Specificity

#### HTML Scope

#### Document flow

##### What is document flow?

The document flow is the concept in which DOM elements are being displayed in CSS by default (without any CSS modifications). In other words it describes the way that block elements are being displayed one below another and inline elements one next to another etc.

The document flow can be disturbed by only two CSS properties which are *float* and *position*. As for the first one (*float*) we can use a technique called clear-fix to get document-flow back on track, however the second one leaves us no options for returning default document-flow.

#### Inline-block gap

##### The issue

Many of developers are not even aware that it exists, when DOM elements occur one after another and their 'display' property is set to 'inline-block' and their HTML markups contain return or space a gap between them is created.

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

Unfortunately there's no straight-forward how-to on this issue but there are some workarounds which can help. The simplest one is just to skip the white spaces between the markups (between the closing and opening braces). The second might be setting some negative margins between the particular elements.

#### Specificity

Some developers may not know that rules which determines which styles are applied to a particular DOM are not random and are called *specificity*. Specificity is the value which says which style is more important over another will be applied to the particular DOM element. So now we know what the *specificity* is but there's one question left - how to actually count it?

Every selector type has assigned specificity factor:

* inline styles - x10000
* ids - x1000
* classes, pseudo classes, attributes - x100
* elements, pseudo-elements - x1

pretty simple, right? But let's go through some examples:

<pre><code>nav a {} // specificity = 1 + 1 = 2
#my-account .login // specificity = 1000 + 100 = 1100
a::before // specificity = 1 + 1 = 2
.nav-button.nav-button.nav-button // specificity = 100 + 100 + 100 = 300
</code></pre>

So for example when you gonna have two style sets with the following selectors:

<pre><code>&lt;nav class="my-nav"&gt;
  &lt;a class="nav-button" href="#"&gt;Nav-1&lt;
  &lt;a class="nav-button" href="#"&gt;Nav-2&lt;
  &lt;a class="nav-button" href="#"&gt;Nav-3&lt;
&lt;/nav&gt;
</code></pre>

* nav.my-nav a // specificity = 12
* .nav-button.nav-button.nav-button // specificity = 30