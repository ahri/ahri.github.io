---
layout: page
title: devpaint
tagline: A collage of ranting, painting and programming
---
{% include JB/setup %}

---
> ## It's those stripping our freedoms that are the real terrorists; Polititians and the corporations and corruption behind them. Militants are trivial, transient and ineffective. The loss of freedom and privacy is scarier than any bomb.
---

# Blog Posts
<ul class="posts">
  {% for post in site.posts %}
    <li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></li>
  {% endfor %}
</ul>
