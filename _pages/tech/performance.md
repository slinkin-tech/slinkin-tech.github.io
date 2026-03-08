---
title: /tech/performance
description: DC Engine performance
keywords: dc engine, performance
layout: page
permalink: /tech/performance/
---

<!--
<h1 hidden>DC Engine performance</h1>
-->

{% include back.html %}

## > performance

{% assign performance_files = site.data.release.json.performance %}

total: [{{ performance_files.size }} items]

<div class="toc-container">
{% for file_entry in performance_files %}
  {% assign test = file_entry[1] %}
  # <a href="#{{ test.test_name | slugify }}">{{ test.test_name }}</a><br>
{% endfor %}
</div>

## # configuration

{% assign config = site.data.release.json.config_summary.info %}

<table style="width: 100%; border-collapse: collapse; font-family: monospace; margin-bottom: 20px;">
  <thead>
    <tr>
      <th style="text-align: left; border-bottom: 1px solid #555; padding: 8px 0;">parameter</th>
      <th style="text-align: right; border-bottom: 1px solid #555; padding: 8px 0;">value</th>
    </tr>
  </thead>
  <tbody>
    <tr><td>active_tag_count</td><td style="text-align: right;">{{ config.active_tag_count }}</td></tr>
    <tr><td>inactive_tag_count</td><td style="text-align: right;">{{ config.inactive_tag_count }}</td></tr>
    <tr><td>expression_count</td><td style="text-align: right;">{{ config.expression_count }}</td></tr>
    <tr><td>classifier_tag_count</td><td style="text-align: right;">{{ config.classifier_tag_count }}</td></tr>
    <tr><td>domain_count</td><td style="text-align: right;">{{ config.domain_count }}</td></tr>
    <tr><td>ipv4_cidr_count</td><td style="text-align: right;">{{ config.ipv4_cidr_count }}</td></tr>
    <tr><td>ipv6_cidr_count</td><td style="text-align: right;">{{ config.ipv6_cidr_count }}</td></tr>
    <tr><td>dns_cache_tag_count</td><td style="text-align: right;">{{ config.dns_cache_tag_count }}</td></tr>
    <tr><td>longest_domain_path</td><td style="text-align: right;">{{ config.longest_domain_path }}</td></tr>
  </tbody>
</table>

<hr>

{% for file_entry in performance_files %}
  {% assign test = file_entry[1] %}
  
<h3 id="{{ test.test_name | slugify }}"># {{ test.test_name }}</h3>

### // general

**flow_count:** {{ test.flow_count }}
**duration:** {{ test.time_ms | divided_by: 1000.0 | round: 2 }}s [{{ test.time_ms }}ms]

### // performance metrics

{% if test.engine_performance == test.offload_performance %}
| metric | engine |
| :--- | :--- |
| packets | {{ test.engine_performance.total_packets }} |
| bytes | {{ test.engine_performance.total_bytes | divided_by: 1073741824.0 | round: 2 }} GB [{{ test.engine_performance.total_bytes }} B] |
| pps | {{ test.engine_performance.pps | round: 2 }} |
| gbps | {{ test.engine_performance.gpbs | round: 3 }} |
| mbps | {{ test.engine_performance.mpbs | round: 2 }} |
{% else %}
| metric | nic |
| :--- | :--- |
| packets | {{ test.offload_performance.total_packets }} |
| bytes | {{ test.offload_performance.total_bytes | divided_by: 1073741824.0 | round: 2 }} GB [{{ test.offload_performance.total_bytes }} B] |
| pps | {{ test.offload_performance.pps | round: 2 }} |
| gbps | {{ test.offload_performance.gpbs | round: 3 }} |
| mbps | {{ test.offload_performance.mpbs | round: 2 }} |
{% endif %}


### // top 10 tags by traffic

<table style="width: 100%; border-collapse: collapse;">
  <thead>
    <tr>
      <th style="text-align: left; border-bottom: 1px solid;">name</th>
      <th style="text-align: left; border-bottom: 1px solid;">packets</th>
      <th style="text-align: left; border-bottom: 1px solid;">bytes</th>
    </tr>
  </thead>
  <tbody>
    {% assign sorted_tags = test.tag_stat | sort: "bytes" | reverse %}
    {% for tag in sorted_tags limit: 10 %}
    <tr>
      <td style="padding: 5px 0;">{{ tag.name }}</td>
      <td style="padding: 5px 0;">{{ tag.packets }}</td>
      {% comment %} 1024*1024.0 = 1048576.0 {% endcomment %}
      <td style="padding: 5px 0;">{{ tag.bytes | divided_by: 1048576.0 | round: 2 }} MB</td>
    </tr>
    {% endfor %}
  </tbody>
</table>

&nbsp;

{% unless forloop.last %}<hr>{% endunless %}
{% endfor %}

<hr>

## # scheme

```bash
+--------------+
|  DPI Engine  |
+--------------+
|   Worker 0   |
+------+-------+
       |
       v
+--------------+
| Traffic dump |
+--------------+
|   RAM DISK   |
+--------------+
```

<hr>

## # ram-disk

```bash
df -h /dev/shm
# sudo mount -o remount,size=24G /dev/shm
cp ~/pcap/work_pcap_session/apple_devices.pcap /dev/shm/
```

<hr>

## # os

```bash
.uname -a
Linux sl-dev 6.8.0-100-generic #100-Ubuntu
SMP PREEMPT_DYNAMIC Tue Jan 13 16:40:06
UTC 2026 x86_64 x86_64 x86_64 GNU/Linux
```

<hr>

## # hardware

```bash
lscpu -e=CPU,CORE,SOCKET,NODE,ONLINE
CPU CORE SOCKET NODE ONLINE
  0    0      0    0    yes
  1    0      0    0    yes
  2    1      0    0    yes
  3    1      0    0    yes
```

```bash
lscpu

Architecture:                x86_64
  CPU op-mode(s):            32-bit, 64-bit
  Address sizes:             40 bits physical, 57 bits virtual
  Byte Order:                Little Endian
CPU(s):                      4
  On-line CPU(s) list:       0-3
Vendor ID:                   GenuineIntel
  Model name:                Intel Xeon Processor (Icelake)
    CPU family:              6
    Model:                   106
    Thread(s) per core:      2
    Core(s) per socket:      2
    Socket(s):               1
    Stepping:                0
    BogoMIPS:                5999.99
    Flags:                   ...
Virtualization features:     
  Hypervisor vendor:         KVM
  Virtualization type:       full
Caches (sum of all):         
  L1d:                       128 KiB (4 instances)
  L1i:                       128 KiB (4 instances)
  L2:                        8 MiB (2 instances)
  L3:                        16 MiB (1 instance)
NUMA:                        
  NUMA node(s):              1
  NUMA node0 CPU(s):         0-3
Vulnerabilities:             
  Gather data sampling:      Not affected
  Indirect target selection: Vulnerable
  Itlb multihit:             Not affected
  L1tf:                      Not affected
  Mds:                       Not affected
  Meltdown:                  Not affected
  Mmio stale data:           ...
  Reg file data sampling:    Not affected
  Retbleed:                  Not affected
  Spec rstack overflow:      Not affected
  ...
```

```bash
hwinfo --short

cpu:
	Intel Xeon Processor (Icelake), 3000 MHz
	Intel Xeon Processor (Icelake), 3000 MHz
	Intel Xeon Processor (Icelake), 3000 MHz
	Intel Xeon Processor (Icelake), 3000 MHz

...

memory:
	Main Memory
...
```

## # test-notes

- Release build
- Mobile traffic
- RAM disk usage. pcap dump is placed in `/dev/shm/` to avoid disk read speed limitations
- NUMA is not used
- Trace is turned off
- One worker thread with CPU affinity (CPU pinning) usage
- [tcmalloc](https://github.com/google/tcmalloc) is used


## # results-notes

- Hardware characteristics: CPU (Clock Speed, Core, Cache, Vector Processor, etc.), RAM, Type
- Allocator library usage [tcmalloc](https://github.com/google/tcmalloc)
- NUMA memory usage
- Packet capturing library
- Offload flows on NIC
- Trace configuration (State, Journal Levels)
- Service configuration (Domain names, IP CIDRs, Cache usage)
- Traffic profile
- Packet encapsulation