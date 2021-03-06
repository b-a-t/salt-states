# nova-console

## Depends:

  -  [logstash](/salt/logstash)
  -  [nova-common](/salt/nova-common)
  -  [sensu-client](/salt/sensu-client)
  -  [supervisor](/salt/supervisor)

## Reverse Depends:

  -  [nova-consoleauth](/salt/nova-consoleauth)

## Relates:

  -  [logstash](/salt/logstash)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── depend-supervisor.sls
├── etc
│   ├── logstash
│   │   └── conf.d
│   │       └── input-file-nova-console.conf
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-nova-console.json
│   └── supervisor
│       └── conf.d
│           └── nova-console.conf
├── init.sls
├── relate-logstash.sls
└── relate-sensu-api.sls
```
