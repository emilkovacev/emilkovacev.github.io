---
layout: default
title: Blog
display: Blog
---

<div class="blog">
  {% for post in site.posts %}
    <div class="content">
        {{ post.category }} – <em>{{ post.date | date_to_string }}</em>
        <h1><a href="{{ post.url }}">{{ post.title }}</a></h1>
        <p>{{ post.excerpt }}</p>
    </div>
  {% endfor %}
</div>
