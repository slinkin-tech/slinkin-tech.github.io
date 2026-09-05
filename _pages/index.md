---
title: /
description: Network software - network traffic analysis, internet service classification, metadata extraction.
keywords: dpi, deep packet inspection, traffic classification, nta, network traffic analyzer, integration solution, network monitor, dpi framework, dpi library, dpi engine, industrial dpi, sl dc engine, dc engine
#layout: home
layout: page
permalink: /
---

<!--
<h1 hidden>Network software - network traffic analysis, internet service classification, metadata extraction.</h1>
-->

## > dc-engine

{% assign stats = site.data.json.stat %}
{% assign protocols_count = stats.protocols.count %}
{% assign attributes_count = stats.protocol_fields.total %}
{% assign metadata_count = stats.metadata.count %}
{% assign services_count = stats.services.count %}

{% include dc-engine.html %}

---

## > news

<div class="news">
<p class="news-cmd">cat ~/updates</p>
<dl class="stats news-list">
{%- for p in site.posts limit: 2 %}
  <dt><a href="{{ p.url }}">{{ p.slug }}</a></dt><dd class="news-date">{{ p.date | date: "%Y-%m-%d" }}</dd><dd class="news-comment"># article</dd>
{%- endfor %}
{%- for r in site.data.json.news limit: 3 %}
  <dt><a href="{{ r.url }}{% if r.text %}#:~:text={{ r.text }}{% endif %}">{{ r.name }}</a></dt><dd class="news-date">{{ r.date }}</dd><dd class="news-comment"># release</dd>
{%- endfor %}
</dl>
<p class="news-more"><a href="/blog"># all updates</a></p>
</div>

---

## > network protocols

<div class="feature plain">
<div class="feature-media"><img src="/assets/dc_engine/img/protocols.png" alt="network protocols" /></div>
<div class="feature-body"><p>We help improve network activity analytics based on network protocols: protocol detection, structure verification, and extracting the most significant fields needed for analysis. Field values play an important role in traffic classification, and the list of extracted values affects the classification type: Internet service, cyber attack, network problems, potential data leakage, etc. Protocol coverage expands continuously.</p></div>
</div>

## > internet services

<div class="feature plain flip">
<div class="feature-media"><img src="/assets/dc_engine/img/services.png" alt="internet services" /></div>
<div class="feature-body"><p>We solve problems with the classification of Internet services (YouTube, WhatsApp, Telegram, etc.) and the determination of the nature of traffic (audio, video, chat, etc.). We maintain and update the database of signatures, IP addresses, CDN, and classification methods. Signature database updates are delivered regularly and can be applied without rebuilding your product. Support for new services is driven by customer requests and by our own monitoring of changes in popular applications.</p></div>
</div>

## > ml/ai

<div class="feature plain">
<div class="feature-media"><img src="/assets/dc_engine/img/ml_ai.png" alt="ml and ai" /></div>
<div class="feature-body"><p>We process traffic and extract the maximum possible number of fields/properties/metrics, after which we generate a granular dataset for training your AI systems. The set of produced information is constantly updated with the release of new product versions, which expand the list of supported protocols, fields, and metadata. Datasets are exported in formats convenient for your pipeline, with per-flow and per-packet granularity. Field sets are configurable.</p></div>
</div>

## > ipdr

<div class="feature plain flip">
<div class="feature-media"><img src="/assets/dc_engine/img/ipdr.png" alt="ipdr" /></div>
<div class="feature-body"><p>The ability to independently configure events for traffic processing. The event processing module generates records with a pre-configured set of properties and sends them to the server for subsequent processing/analysis. Records can be filtered, aggregated and enriched before export, reducing the load on your storage and letting you keep only the events that matter to you.</p></div>
</div>