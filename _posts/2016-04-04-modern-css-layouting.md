---
layout: post
category: css
published: true
tags: css css-grid flex-box layouting
---

In the last couple of months we were able to see more and more posts about website layouting. There are number of ways which can obscure the proper direction when it comes about it, hence I'll try to highlight here the right path for you. At least, what I think is the right path. Also, please keep in mind that it's not a layouting, flex-box nor grid tutorial. It's just a short write-up about, where the modern layouting is heading. 

#### A little bit of the history

Till this day we've went a long way of how we used to create website layouts. We all remember immortal tables, floats and/or absolute and relative positionings - but we also probably remember how much of a hassle was to develop a safe, stable and generic layout.
  
Putting aside floats and positionings which in my opinion, are not even worth to talk about, tables are who reigned the layouting kingdom for a while and you may ask yourself why?  

The answer is pretty simple, but not that obvious though. One of the most wanted features in the layouting science, is elements correlation. What I mean my that, is awareness of particular elements that they are just components of something bigger. With that manner they're able to adopt for changes present in different cells than themselves. The tables were the closest solution we had at the time, cause every cell was able to squeeze or expand when necessary.

#### Box-sizing approach

A huge mile stone in website layouting were modules like Twitter's Bootstrap grid. Those were possible, because of shipping new CSS properties like box-sizing. Along with this new feature, we were able to define total cell's size (including all additional properties like padding or borders). So what where is the catch in this solution? Although this approach seems to be fairly sufficient, there are some lacks in this method:
 
* unsemantic markups
* markups overhead
* markups define website's look (it shouldn't)
* markups define the ordering (it shouldn't)
* no relations between the cells (every cell has no knowledge of it's relatives, nor parents)

This is how a sample markups implementation looks like:

``` html
  <div class="container">
    <div class="row">
      <div class="col-sm-3">
        cell-1-1
      </div>
      <div class="col-sm-3">
        cell-1-2
      </div>
      <div class="col-sm-3">
        cell-1-3
      </div>    
      <div class="col-sm-3">
        cell-1-4
      </div>        
    </div> 
    <div class="row">
      <div class="col-sm-3">
        cell-2-1
      </div>
      <div class="col-sm-3">
        cell-2-2
      </div>
      <div class="col-sm-3">
        cell-2-3
      </div>    
      <div class="col-sm-3">
        cell-2-4
      </div>        
    </div>     
  </div>
```
 
looks messy, right? Let's move to the flex-box and see, what's there. 
 
[Can I use 'box-sizing'](http://caniuse.com/#feat=css3-boxsizing) - global support 95.41% (April 2016)

#### CSS flex-box approach 

As you've might noticed already, while reading some posts about web layouting, flex-box is considered as one of the most popular methods for it. It's probably because of it's flexing child elements which do all the responsive job under the hood for you. What you have to know though, is flex-box ain't a tool for layouting. Why? Simple. It's purpose is ONLY to be used while creating some small stand alone widgets or other small components. If you gonna dive into it's technicals, you'll know that you only have control over it in one dimension, horizontal or vertical - but not both.

Flexbox introduces six abstractions:

* Flexbox container - container for all flexbox items 
* Flexbox items - all flexing items within the container (only first children apply)
* Main axis - axis with which flexing items will be placed along (it can be horizontal or vertical - along with the ```css flex-direction``` property)  
* Main start, Main end - starting and ending point of the main axis
* Main size - flex items size in line with the main axis
* Cross axis - perpendicular axis to the main axis (opposite to the main axis direction)
* Cross start, Cross end - starting and ending point of the cross axis
* Cross size - flex items size in line with the cross axis
  
This is how a sample flex-box layout implementation would look like:

```html 
<div class="wrapper">
  <header class="header">Header</header>
  <main class="main">Main</main>
  <aside class="aside aside-1">Aside 1</aside>
  <aside class="aside aside-2">Aside 2</aside>
  <footer class="footer">Footer</footer>
</div>
```

```css
.wrapper {
  display: flex;
  flex-flow: row wrap;
}

.header, .aside, .footer {
  flex: 1 100%;
}

.aside-1 { order: 1; }
.main { 
  flex: 2 0px;
  order: 2; 
}
.aside-2 { order: 3; }
.footer { order: 4; }
```

It looks much better than Twitter's Bootstrap grid... but still doesn't resolve all our problems (like two dimensional layouting). 

[Can I use 'flexbox'](http://caniuse.com/#feat=flexbox) - global support 94.1% (April 2016)

#### CSS grid approach

The least popular method, or at least not so spectacular as flex-box (probably because of it's browsers support) is [css-grid module](https://www.w3.org/TR/css-grid-1/). This one was invented strictly to handle well the modern layouting conundrum - is it the holly grail we've been waiting for? Let's see.

The css-grid module introduces six abstractions:

* Grid container - container for all the grid items (has to have ```css display: grid``` property set)
* Grid item - grid cells (only first children apply)
* Grid line - horizontal or vertical line separating (it occur between both, columns and rows)
* Grid track - horizontal or vertical line built of cells and limited by two adjacent grid lines
* Grid cell - a single grid unit
* Grid area - area built of grid cells (separeted by two horizontal and two vertical grid lines)

CSS grids allows the cells to have the knowledge where exactly they belong. In contrary to flexbox items we can place grid items wherever we want, however we want and limit them as we want. They just have to have explicitly given boudaries like areas or starting and ending lines.

You may also wonder about it's responsiveness. Don't worry - it has been implemented as well. The grids have something called fractions (shorthand: fr). They work, pretty similar to flexbox 'flex' property filling out available space in givem proportions.

```html
<div class="container">
  <header class="item-a">Header</header>
  <main class="item-b">Main</main>
  <aside class="item-c">Sidebar</aside>
  <footer class="item-d">Footer</footer>
</div>
```

{% highlight css %}
.item-a{
  grid-area: header;
}
.item-b{
  grid-area: main;
}
.item-c{
  grid-area: sidebar;
}
.item-d{
  grid-area: footer;
}

.container{
  grid-template-columns: 50px 50px 50px 50px;
  grid-template-rows: auto;
  grid-template-areas: "header header header header"
                       "main main . sidebar"
                       "footer footer footer footer"
}
{% endhighlight %}


[Can I use 'grids'](http://caniuse.com/#feat=css-grid) - global support 8.1% (April 2016)

#### Bottom line

So you may ask now... "ok, so what I should go with then?". In my opinion, it's worth to wait a little while for the CSS grids, as they should be shipped with the new versions of the browsers really soon. The flex-box compatibility coverage might be tempting, but as we've highlighted, it's purpose is not to be used for the layouting. I'd stick with the classic Bootstrap's grid technique in the meantime, while waiting for the silver bullet to come. 

I also strongly advise you to listen [Rachel Andrew's presentation](https://youtu.be/MXEzJ-IncX0) at Fluent Conference, on modern layouting.
