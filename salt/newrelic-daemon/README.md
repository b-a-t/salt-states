# newrelic-daemon

## Depends:

  -  [newrelic](/salt/newrelic)
  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── etc
│   └── sensu
│       └── conf.d
│           └── checks-newrelic-daemon.json
├── init.sls
└── relate-sensu-api.sls
```
