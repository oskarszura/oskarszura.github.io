---
layout: post
category: css
published: true
tags: css css-grid flex-box layouting
---

In the last couple of months we were able to see more and more posts about website layouting. There are number of ways which can obscure the proper direction when it comes about it, hence I'll try to highlight here the right path for you. At least, what I think is the right path.

#### A little bit of the history

Till this day we've went a long way of how we used to create website layouts. We all remember immortal tables, floats and/or absolute and relative positionings - but we also probably remember how much of a hassle was to develop a safe, stable and generic layout.
  
Putting aside floats and positionings which in my opinion, are not even worth to talk about, tables are who reigned the layouting kingdom for a while and you may ask yourself why?  

The answer is pretty simple, but not that obvious though. One of the most wanted features in the layouting science, is elements correlation. What I mean my that, is awareness of particular elements that they are just components of something bigger. With that manner they're able to adopt for changes present in different cells than themselves. The tables were the closest solution we had at the time, cause every cell was able to squeeze or expand when necessary.

#### Box-sizing approach

A huge mile stone in website layouting were frameworks like Twitter's Bootstrap. Those were possible, because of shipping new CSS properties like box-sizing.

 
[Can I use 'box-sizing'](http://caniuse.com/#feat=css3-boxsizing) - global support 95.41% (April 2016)

#### CSS flex-box approach 

As you've might noticed already, while reading some posts about web layouting, flex-box is considered as one of the most popular methods for it. It's probably because of it's flexing child elements which do all the responsive job under the hood for you. what you have to know though, is flex-box ain't a tool for layouting. Why? Simple. It's purpose is ONLY to be used while creating some small stand alone widgets or other small components. If you gonna dive into it's technicals, you'll know that you only have control over it in one dimension, horizontal or vertical - but not both.  

[Can I use 'flexbox'](http://caniuse.com/#feat=flexbox) - global support 94.1% (April 2016)

#### CSS grid approach

[Can I use 'grids'](http://caniuse.com/#feat=css-grid) - global support 8.1% (April 2016)

#### Bottom line

So you may ask now... "ok, so what I should go with then?". In my opinion, it's worth to wait a little while for the CSS grids, as they should be shipped with the new versions of the browsers really soon. The flex-box compatibility coverage might be tempting, but as we've highlighted, it's purpose is not to be used for the layouting. I'd stick with the classic Bootstrap's grid technique in the meantime, while waiting for the silver bullet to come. 

I also strongly advise you to listen [Rachel Andrew's presentation](https://youtu.be/MXEzJ-IncX0) at Fluent Conference, on modern layouting.