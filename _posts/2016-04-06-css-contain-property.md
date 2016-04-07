---
layout: post
category: css
published: true
tags: css contain
---

Lately I've been reviewing [CSS Working Group draft list](https://drafts.csswg.org/) for new features and noticed something related with my current interest of developing isolated webcomponents. While developing mentioned webcomponents, you'd like to probably have them separated in every aspect there is. When it comes to JavaScript, the things here are simple. In contrast CSS separation ain't that easy. If you want area that won't affect the rest of the layout and won't trigger a lot of unnecessary computations - things got trickier. That is the case when you might find the 'contain' property helpful.

#### What's it about?

According to W3C, the 'contain' property indicates whether the element’s subtree is independent from the rest of the page. In other words it gives us the power to say to the browser in what circumstances we'd like the particular element to interact to it's parent layout. By saying 'interact' I mean, some (or all) internal changes will or won't force the browser to make any additional computations related with CSS.

WGCSS distinguish five values which can be assigned to this property:

* **none** - This value indicates that the property has no effect - the element will interact with it's parent. It won't be contained anyhow.
* **strict** - This value turns on all forms of containment for the element - the element won't interact with it's parent in any way.
* **layout** - This value turns on layout containment for the element - [more about layout containment](https://drafts.csswg.org/css-containment-3/#containment-layout).
* **style** - This value turns on style containment for the element - [more about style containment](https://drafts.csswg.org/css-containment-3/#containment-style). 
* **paint** - This value turns on paint containment for the element - [more about paint containment](https://drafts.csswg.org/css-containment-3/#containment-paint). 

#### Conclusion:

In my opinion the 'contain' property is a great asset for website performance, especially when it comes about more dynamic pages. We also should keep in mind that it's status is still 'working draft'.

#### Referrences:
* [W3C specification](https://drafts.csswg.org/css-containment-3/#contain-property)

