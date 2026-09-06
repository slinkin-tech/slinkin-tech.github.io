---
title: /blog
description: Blog, technical articles. Sharing our thoughts on technology and our experience.
keywords: blog, technical articles
layout: page
permalink: /blog
---

<!--
<h1 hidden>Technical articles and news.</h1>
-->

## > news

<div class="news">
<dl class="stats news-list">
{%- if site.categories.news.size > 0 %}
  {%- for p in site.categories.news %}
  <dt><a href="{{ p.url }}">{{ p.name | default: p.slug }}</a></dt><dd class="news-date"># {{ p.date | date: "%d.%m.%Y" }}</dd>
  {%- endfor %}
{%- else %}
  <dt class="news-empty">null</dt><dd class="news-date"></dd>
{%- endif %}
</dl>
</div>

## > articles

<div class="news">
<dl class="stats news-list">
{%- if site.categories.article.size > 0 %}
  {%- for p in site.categories.article %}
  <dt><a href="{{ p.url }}">{{ p.name | default: p.slug }}</a></dt><dd class="news-date"># {{ p.date | date: "%d.%m.%Y" }}</dd>
  {%- endfor %}
{%- endif %}
</dl>
</div>