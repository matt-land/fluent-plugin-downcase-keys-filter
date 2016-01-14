# fluent-downcase-keys, a plugin for [Fluentd](http://fluentd.org)

## Status
YMMV

## Overview

Fluentd output plugin. Downcases all keys and re-emits for ingestion to firehose/s3/redshift.

This plugin is created to resolve the invalid key names when importing into Redshift.

## Installation

Install with gem or fluent-gem command as:

```
# for fluentd
$ gem install fluent-plugin-downcase-keys

# for td-agent OSX (Homebrew)
$ /usr/local/Cellar/td-agent/1.1.17/bin/fluent-gem install fluent-plugin-downcase-keys

# for td-agent
$ sudo /usr/lib64/fluent/ruby/bin/fluent-gem install fluent-plugin-downcase-keys
```

## Configuration
Optional
  remove_tag_prefix
  append_tag

### Examples

<match input.test>
  type downcase_keys
  remove_tag_prefix input
  append_tag downcase_keys
</match>


```
License   :  Apache License, Version 2.0

