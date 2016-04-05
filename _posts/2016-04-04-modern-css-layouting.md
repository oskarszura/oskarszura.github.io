---
layout: post
category: Others
published: true
---

In the last couple of months we were able to see more and more posts about CSS native support for website layouting. There are number of ways which can obscure the proper direction when it comes about the modern CSS layouting.

Till this day we've went a long way of how we used to create websites layouts. We all remember immortal tables, floats and/or absolute and relative positionings - but we also probably remember how much of a hassle was to develop a safe, stable and generic layout.  

A huge mile stone in website layouting were frameworks like Twitter's Bootstrap which were possible thanks to shipping new CSS properties like box-sizing, but still, it wasn't a silver bullet for the layouting corundum.

#### Box-sizing approach

Along with CSS3 introduction we had a great opportunity to welcome the 'box-sizing' property which (with 'border-box' value) allowed us for the first time to build stable and reusable layouts. This is the today's most common used approach.

<pre><code>.column-1 {
  box-sizing: border-box;
  min-height: 1px;
  position: relative;
  display: block;
  float: left;
  width: 10%;
}

&lt;div class="row-columns"&gt;
   &lt;div class="column-1"&gt;Column 1&lt;/div&gt;
   &lt;div class="column-1"&gt;Column 2&lt;/div&gt;
   &lt;div class="column-1"&gt;Column 3&lt;/div&gt;
   &lt;div class="column-1"&gt;Column 4&lt;/div&gt;
   &lt;div class="column-1"&gt;Column 5&lt;/div&gt;
   &lt;div class="column-1"&gt;Column 6&lt;/div&gt;
   &lt;div class="column-1"&gt;Column 7&lt;/div&gt;
   &lt;div class="column-1"&gt;Column 8&lt;/div&gt;
   &lt;div class="column-1"&gt;Column 9&lt;/div&gt;
   &lt;div class="column-1"&gt;Column 10&lt;/div&gt;
&lt;/div&gt;
</code></pre>

<div class="example">
<div class="example-2016-04-04-1">
  <div class="row-columns">
    <div class="column-1">
      Column 1
    </div>
    <div class="column-1">
      Column 2
    </div>
    <div class="column-1">
      Column 3
    </div>
    <div class="column-1">
      Column 4
    </div>
    <div class="column-1">
      Column 5
    </div>
    <div class="column-1">
      Column 6
    </div>
    <div class="column-1">
      Column 7
    </div>
    <div class="column-1">
      Column 8
    </div>
    <div class="column-1">
      Column 9
    </div>
    <div class="column-1">
      Column 10
    </div>                                
  </div>
</div>
</div>
 
[Can I use 'box-sizing'](http://caniuse.com/#feat=css3-boxsizing) - global support 95.41% (April 2016)

#### CSS flex-box approach 

[Can I use 'flexbox'](http://caniuse.com/#feat=flexbox) - global support 94.1% (April 2016)

#### CSS grid approach

[Can I use 'grids'](http://caniuse.com/#feat=css-grid) - global support 8.1% (April 2016)