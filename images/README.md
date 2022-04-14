# BeamLive

The Only Unified Messaging Service
that Connects People, Information and Machines

## Getting Started

[nvm](https://github.com/creationix/nvm) to control node version manager.


### Prerequisites

```
[Node version 8+][https://nodejs.org/dist/latest-v8.x/docs/api/].
```

### Installing

```
npm install
npm run dev 
```

## Docker Deployment
```
docker build --tag beamapage .
docker run --name beam-mongo -d mongo --smallfiles
docker run -ti --name beamapage --link beam-mongo:mongodb -p 5000:5000 beamapage /bin/sh
docker stop beamApage; docker rm beamApage ; docker build --tag beamapage . ;  docker run -ti --name beamApage -e BEAM_URLS='development'  -p 5003:5000 beamapage sh  
docker stop beamApage; docker rm beamApage ; docker run -d --name beamApage -e BEAM_URLS='development'  -p 5003:5000 beamapage pm2-runtime start dist/allModels.js
```
