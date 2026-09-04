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

<div class="packages-grid" markdown="1">

| | |
| :--- | :--- |
| <img src="/assets/img/icons/eye.png" width="48" height="48" style="float: left; margin-right: 16px;" /> **protocol detection** <br> identifying network protocols, extracting fields, decoding values. | <img src="/assets/img/icons/block.png" width="48" height="48" style="float: left; margin-right: 16px;" /> **internet services classification** <br> classification of services and workflow definition (audio/video/file transfer). |
| <img src="/assets/img/icons/integration.png" width="48" height="48" style="float: left; margin-right: 16px;" /> **integration into other solutions** <br> ips/ids, siem, dlp, etc. | <img src="/assets/img/icons/folder.png" width="48" height="48" style="float: left; margin-right: 16px;" /> **network activity logging** <br> logging of network activity that can be used in the investigation of incidents. |
| <img src="/assets/img/icons/ai.png" width="48" height="48" style="float: left; margin-right: 16px;" /> **data collection for ai** <br> collecting an array of data for use in AI systems. | <img src="/assets/img/icons/user.png" width="48" height="48" style="float: left; margin-right: 16px;" /> **user control** <br> putting users under control (saving all or selected information for certain users). |
| <img src="/assets/img/icons/billing.png" width="48" height="48" style="float: left; margin-right: 16px;" /> **collecting information for billing** <br> accumulation of information on streams for use in billing. | <img src="/assets/img/icons/fire.png" width="48" height="48" style="float: left; margin-right: 16px;" /> **hotfix of new vulnerabilities** <br> prevention of exploitation of new vulnerabilities, before the release of official fixes. |

</div>


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

## > solution

The **DC Engine** is distributed as a modular software solution tailored to your specific network visibility, security, and performance requirements. Our commercial model consists of a permanent **Core** architecture combined with flexible, add-on **Extension Packages**.

This decoupled approach ensures you only license the exact functionality your infrastructure demands, optimizing your Total Cost of Ownership (TCO) while allowing seamless scalability as your network evolves.

### # dc-engine [core]

- Protocol detection: Deep protocol analysis, field dissection, and decoding.
- Service classification: Mapping traffic to internet services and types (media/files).
- Metadata extraction: Extracting packet/flow data (codecs, credentials, JA4 hashes).
- Flow statistics: Tracking time, bytes, packets, bitrate, and IAT metrics.

### # packages

<div class="packages-grid" markdown="1">

| | |
| :--- | :--- |
| **service_update** `[ready]` <br> Daily service classification configuration updates (data patterns, IPs, domains) <br> `> protocols:` no <br> `> extensions:` probe | **workflow** `[ready]` <br> Classification audio/video calls, chat, file transfer <br> `> protocols:` no <br> `> extensions:` rtc_media, spid |
| **security** `[roadmap]` <br> ICMP/DNS tunnel detection, invalid certs, C&C server access, file extraction, leaks, DDoS <br> `> protocols:` no <br> `> extensions:` sec, filecarver, sensdata, ddos | **network** `[roadmap]` <br> QoS estimation, error detection (re-transmissions, inactive flows, ping unreachables) <br> `> protocols:` modbus, dnp3, profinet <br> `> extensions:` qos, netcon |
| **industrial** `[roadmap]` <br> The set of industrial protocols (detection, deep field dissection) <br> `> protocols:` todo <br> `> extensions:` no | **dlog** `[roadmap]` <br> IPDR transmission to remote service/server (NetFlow, HTTP, JSON formats) <br> `> protocols:` no <br> `> extensions:` dlog |

</div>

**Questions or ready to request?** Contact us at [info@slinkin.tech](mailto:info@slinkin.tech?subject=DC%20Engine%20Request) to get a proposal or tech details.

---

## > technical information

Technical information is <a href="/tech">here</a>.