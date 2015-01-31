---
layout: default
title: Archive
---

{% for category in site.categories %}
  <h1>{{ category | first | wordify  }}</h1>
  <ul>
  {% for post in category[1] %}
    <li><a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></li>
  {% endfor %}
  </ul>
{% endfor %}
