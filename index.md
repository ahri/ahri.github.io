---
layout: page
title: devpaint
tagline: A collage of ranting, painting and programming
---
{% include JB/setup %}

## Ranting
At the world in general, but more specifically about politics, society and technology.

## Painting
Of miniatures in the Game Workshop style.

## Programming
On personal projects in a number of languages, expounding opinions on style.

# Blog Posts
<ul class="posts">
  {% for post in site.posts %}
    <li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></li>
  {% endfor %}
</ul>
