# Beapp Logzio Filebeat mage

This image is based on `docker.elastic.co/beats/filebeat` to push file logs on [Logz.io](https://logz.io).

# How to use

You need to supply one or more Filebeat configuration file in `/usr/share/filebeat/prospectors.d/` folder by mouting the files from your host.

The image already contains Filebeat's `output` configuration to push logs on Logz.io.
You just need to provide the Logz.io token as an environment variable `LOGZIO_TOKEN`.

You can also inject additional fields on your logs with some optional environment variables :

* `FIELD_PROJECT` : Inject a `project` field
* `FIELD_ENVIRONMENT` : Inject a `prod` field

## Running directly

```
docker run -d --name=logzio --restart=always \
    -v /var/log:/var/log:ro \
    -v /filebeat/myapp.yml:/usr/share/filebeat/prospectors.d/myapp.yml \
    -e LOGZIO_TOKEN=<my_logzio_token> \
    -e FIELD_PROJECT=<my_project> \
    beappers/logzio-filebeat
```


_/filebeat/myapp.yml:_

```
filebeat.inputs:
- type: log
  paths:
    - /var/log/nginx/access-api*.log
    - /var/log/nginx/access-admin*.log
  fields_under_root: true
  fields:
    logzio_codec: plain
    type: nginx
  encoding: utf-8
  ignore_older: 24h
```