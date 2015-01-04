---
layout: default
title: Robot Sweatshop
---

<ul>
{% for posts in site.categories['robot-sweatshop'] %}
  {% for post in posts %}
    <li><a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></li>
  {% endfor %}
{% endfor %}
</ul>
