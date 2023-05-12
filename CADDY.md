### Caddy JSON Config

```json
{
  "storage": {
    "module": "file_system",
    "root": "./caddy"
  },
  "apps": {
    "tls": {
      "automation": {
        "policies": [
          {
            "issuers": [
              {
                "module": "acme",
                "ca": "https://acme-staging-v02.api.letsencrypt.org/directory"
              }
            ]
          }
        ]
      },
      "certificates": {
        "automate": [
          "test1.example.com",
          "test2.example.com"
        ]
      }
    },
    "http": {
      "servers": {
        "test1": {
          "listen": [
            ":443"
          ],
          "routes": [
            {
              "match": [
                {
                  "host": [
                    "test1.example.com"
                  ]
                }
              ],
              "handle": [
                {
                  "handler": "file_server",
                  "root": "/root/server/test1"
                }
              ]
            },
            {
              "match": [
                {
                  "host": [
                    "test2.example.com"
                  ]
                }
              ],
              "handle": [
                {
                  "handler": "reverse_proxy",
                  "upstreams": [
                    {
                      "dial": "127.0.0.1:2015"
                    }
                  ]
                }
              ]
            }
          ]
        },

        "example": {
          "listen": [":2015"],
          "routes": [
            {
              "handle": [{
                "handler": "static_response",
                "body": "Hello, world!"
              }]
            }
          ]
        }
      }
    }
  }
}
```

```yaml
storage:
  module: file_system
  root: "./caddy"
apps:
  tls:
    automation:
      policies:
      - issuers:
        - module: acme
          ca: https://acme-staging-v02.api.letsencrypt.org/directory
    certificates:
      automate:
      - test1.example.com
      - test2.example.com
  http:
    servers:
      test1:
        listen:
        - ":443"
        routes:
        - match:
          - host:
            - test1.example.com
          handle:
          - handler: file_server
            root: "/root/server/test1"
        - match:
          - host:
            - test2.example.com
          handle:
          - handler: reverse_proxy
            upstreams:
            - dial: 127.0.0.1:2015
      example:
        listen:
        - ":2015"
        routes:
        - handle:
          - handler: static_response
            body: Hello, world!

```
