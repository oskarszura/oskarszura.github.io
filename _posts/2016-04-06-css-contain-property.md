---
layout: post
category: Others
published: true
---

Lately I've been reviewing [https://drafts.csswg.org/](CSS Working Group draft list) for new feature and noticed something related with my current interest of developing isolated webcomponents. While developing webcomponents you'd like to probably have them separated in every aspect there is. When it comes to JavaScript the things here are simple, but what when you'd like to have an independend CSS area that won't affect the rest of the layout and won't trigger a lot of unnecessary computations? That is the case when you might concider to use the 'contain' property.

#### What's it about?

According to W3C, the 'contain' property indicates whether the element’s subtree is independent of the rest of the page. In other words it gives us the power to say to the browser in what circumstances we'd like the particular element to interact to it's parent layout.

WGCSS distinguish five values which can be assigned to this property:

* none - This value indicates that the property has no effect.
* strict - This value turns on all forms of containment for the element.
* layout - This value turns on layout containment for the element.
* style - This value turns on style containment for the element. 
* paint - This value turns on paint containment for the element. 

#### Conclusion:

In my opinion the 'contain' property is a great asset for website performance, especially when it comes to more dynamic pages, but we also should keep in mind that it's status is 'working draft' - which means, everything here can change.

#### Referrences:
* [https://drafts.csswg.org/css-containment-3/#contain-property](W3C specification)

