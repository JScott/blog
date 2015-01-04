---
layout: default
title: Robot Sweatshop
---

<li>
  <ul>
  {% for posts in site.categories['robot-sweatshop'] %}
    {% for post in posts %}
      <li><a href="{{ post.url }}">{{ post.title }}</a></li>
    {% endfor %}
  {% endfor %}
  </ul>
</li>
