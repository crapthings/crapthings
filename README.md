<h1 align='center'>:tada: Jak Sie Masz :tada:</h1>

<h3 align='center'>I'm a fullstack vibe developer from 🇨🇳</h3>

<div align='center'>
  <img src='https://komarev.com/ghpvc/?username=crapthings&style=plastic&color=brightgreen&label=Party+Party+Yeah' />
</div>

---

<div align='center'>
  <img src='https://user-images.githubusercontent.com/1147704/142792552-de3e3e96-4277-4de6-b819-36644707b208.gif' />
</div>

---

#### Repos

[Readline ES](https://github.com/crapthings/readline-es) :heart: a tiny helper for read by line

[Meteor React Starter](https://github.com/crapthings/meteor-react-starter) :rocket: meteor react dev kit.

[Meteor Mqtt Starter](https://github.com/crapthings/meteor-mqtt-starter) :rocket: meteor mqtt dev kit.

[Parcel React Starter](https://github.com/crapthings/parcel-react-starter) :rocket: parcel react dev kit.

[Hardhat Parcel Dapp Starter](https://github.com/crapthings/hardhat-parcel-dapp-starter) :rocket: hardhat parcel dapp starter.

~~[Snowpack Starter](https://github.com/crapthings/snowpack-starter-kit) :rocket: Snowpack with react.~~

~~[Snowpack Plugin Hjson](https://github.com/crapthings/snowpack-plugin-hjson) :rocket: hjson parser for snowpack~~

~~[Hardhat Dapp Starter](https://github.com/crapthings/hardhat-dapp-starter) :rocket: a dapp starter kit with modern workflow.~~

~~[Snowpack Phaser Starter](https://github.com/crapthings/snowpack-phaser-starter) :rocket: phaser 2d game starter~~

[Fastify Starter](https://github.com/crapthings/fastify-starter) :rocket: fastify boilerplate

[Express Starter](https://github.com/crapthings/express-starter) :rocket: express boilerplate

#### Stats

![Crapthings's GitHub stats](https://github-readme-stats.vercel.app/api?username=crapthings&bg_color=30,e96443,904e95&title_color=fff&text_color=fff&show_icons=true&icon_color=fff)

[![Top Langs](https://github-readme-stats.vercel.app/api/top-langs/?username=crapthings&layout=compact&&langs_count=10)](https://github.com/anuraghazra/github-readme-stats)

#### Skills

|| :+1: |
| --- | --- |
| language | javascript, typescript, coffeescript, solidity |
| framework | meteor |
| frontend | react, svelte |

#### Contact

:mailbox_with_mail: [crapthings@gmail.com](mailto:crapthings@gmail.com)

#### Scripts

* Install Docker

```
curl -sSL https://raw.githubusercontent.com/crapthings/crapthings/main/install-docker.sh | bash
```

* Install Portainer

```
curl -sSL https://raw.githubusercontent.com/crapthings/crapthings/main/install-portainer.sh | bash
```

* Install SS

```
curl -sSL https://raw.githubusercontent.com/crapthings/crapthings/main/install-ss.sh | bash
```

* Install Caddy

```
curl -sSL https://raw.githubusercontent.com/crapthings/crapthings/main/install-caddy.sh | bash
```

* Install BT

```
wget -O install.sh https://download.bt.cn/install/install-ubuntu_6.0.sh && sudo bash install.sh ed8484bec
```

* Install Mongodb

```
curl -sSL https://github.com/crapthings/crapthings/blob/main/install-mongodb.sh | bash
```

* Install NVM

```sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
```

```sh
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
```

* Install NaiveProxy

```
git clone https://github.com/crapthings/docker-naive-proxy
cd docker-naive-proxy
sed -i 's/#domain#/xxx.xxx.xxx/g' config/Caddyfile
sed -i 's/#email#/xxx@xxx.xxx/g' config/Caddyfile
sed -i 's/#account#/user password/g' config/Caddyfile
docker compose up -d
```

* Mongodb

```
 docker run \
  --name mongodb \
  -v ./configdb:/data/configdb \
  -v ./db:/data/db \
  -p 27017:27017 \
  -d \
  mongodb/mongodb-community-server:latest
```
