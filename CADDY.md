# Caddy

* https://caddyserver.com/docs/install

### How to install Caddy on Ubuntu Server

```bash
sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
sudo apt update
sudo apt install -y caddy
```

### Caddy Command

```bash
caddy run --config config.json # run caddy server with specify config
caddy start --config config.json # start caddy server with specify config on background
caddy reload # reload config
caddy stop # stop caddy server
```

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
