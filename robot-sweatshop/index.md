---
layout: default
title: Robot Sweatshop
---

<ul>
{% for post in site.categories['robot-sweatshop'] %}
  <li><a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></li>
{% endfor %}
</ul>
