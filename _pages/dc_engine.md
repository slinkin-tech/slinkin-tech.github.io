---
title: /dc-engine
description: DPI Engine - packet and protocols dissection, flow classification.
keywords: dpi, deep packet inspection, traffic classification, nta, network traffic analyzer, integration solution, network monitor, dpi framework, dpi library, dpi engine, industrial dpi, sl dc engine, dc engine
layout: page
permalink: /dc-engine/
---

<!--
<h1 hidden>Dissection and Classification engine. DPI Engine solution.</h1>
-->

## > dc-engine

{% assign stats = site.data.json.stat %}
{% assign protocols_count = stats.protocols.count %}
{% assign attributes_count = stats.protocol_fields.total %}
{% assign metadata_count = stats.metadata.count %}
{% assign services_count = stats.services.count %}

{% include dc-engine.html %}

---

## > functionality

### # protocol detection
identifying network protocols, extracting fields, decoding values.

### # internet services classificaion
classification of services and workflow definition (audio/video/file transfer).

### # integration into other solutions
ips/ids, siem, dlp, etc.

### # network activity logging
logging of network activity that can be used in the investigation of incidents.

### # data collection for ai
collecting an array of data for use in AI systems.

### # user control
putting users under control (saving all or selected information for certain users).

### # collecting information for billing
accumulation of information on streams for use in billing.

### # hotfix of new vulnerabilities
prevention of exploitation of new vulnerabilities, before the release of official fixes.

---

## > technical advantages

### # integration into other software solutions

SL DC Engine is a DPI Engine class solution and can be integrated into third-party products. DC Engine provides the ability to dissect packets, obtain protocol fields, collect statistics on network flows, and configure classification rules. DC Engine also makes it possible to expand the basic functionality through an extension mechanism that allows users to add their code to the traffic processing pipeline and use the results of its execution in classification rules.

### # detailed package analysis

Each processed packet is divided into layers which belong to a specific protocol. SL DC Engine parses each supported protocol and maps its fields, after which their values can be obtained via the API. In addition to, the DC Engine also maintains a hierarchy of fields to provide the ability to visualize a layer's structure in detail. After processing the packet, a user can obtain information about the state of each layer, and if errors occur during the dissection process, the DC Engine will report what exactly went wrong.

### # many supported protocols

SL DC Engine is designed as a universal framework for processing network traffic, which does not depend on which network traffic is processed. DC Engine can process traffic from local, mobile, and industrial networks; the Internet network, and also supports protocols used by IoT devices.

### # logging system

One of the main elements when monitoring a network is activity logging. The DLog module is responsible for collecting logs and allows the user to configure what data should be included in each log journal. The log may include data received from custom extensions. DLog also provides the ability to set policies for log rotation. In addition, the user can configure the count of processing threads according to the characteristics of their hardware, which will increase performance.

### # traffic filtering opportunities

Traffic control allows you to solve problems such as load balancing in the network, restricting access to prohibited resources, preventing malicious network activity, and assigning quotas to individual network users. These problems are common to any type of network, from local to mobile. Solving such problems allows users to comply with regulatory requirements, ensure stable network operation, and respond in time to malicious network activity, preventing its further spread.

### # network services classification

Classification tasks are typical for such areas as information security, where data is classified as malicious or malicious, system administration, where incorrect network operation is diagnosed, and in the field of mobile operators and Internet providers, where network flows are classified as popular Internet services. SL DC Engine provides functionality to classify network activity through a tagging mechanism. This means that the user can independently create any tag and describe the rule for assigning it to a packet or flow (for example, tethering, fraud, etc.). This approach implies universality in matters of classification and allows users to create their tags for any purpose.

---

## > solution packages

The engine is built around a powerful core with flexible extension packages tailored for specific network analysis workflows.

### [core]
* **protocol & service** — Protocol detection, structure verification, and internet service classification.
* **metadata extraction** — Extract packet/flow metadata (media codecs, credentials, JA3/JA3S/JA4 hashes).
* **flow statistics** — Track time, bytes, packets, bitrate, IAT (Inter-Arrival Time), and metrics.

### [packages]

* #### package: service_update `[ready]`
  * `> description:` Daily service classification configuration updates (data patterns, IPs, domains)
  * `> extensions:` probe
  * `> protocols:` no

* #### package: workflow `[ready]`
  * `> description:` Classification audio/video calls, chat, file transfer
  * `> extensions:` rtc_media, spid
  * `> protocols:` no

* #### package: security `[roadmap]`
  * `> description:` ICMP and dns tunnel detection; invalid/expired certificates; C&C/C2 servers access detection (IP; domains; JA hashes); file extraction; sensetive data leaks, ddos
  * `> extensions:` sec, filecarver, sensdata, ddos
  * `> protocols:` no

* #### package: network `[roadmap]`
  * `> description:` QoS estimation; network error detection (re-transmission burts, no flow activities, ping destination unreachable)
  * `> extensions:` qos, netcon
  * `> protocols:` modbus, dnp3, profinet

* #### package: industrial `[roadmap]`
  * `> description:` The set of industrial protocols (detection, field dissection)
  * `> extensions:` no
  * `> protocols:` todo

* #### package: dlog `[roadmap]`
  * `> description:` IPDR transmission to remote service/server; netflow, http, json formats
  * `> extensions:` dlog
  * `> protocols:` no

---

## > technical information

Technical information is <a href="/tech">here</a>.