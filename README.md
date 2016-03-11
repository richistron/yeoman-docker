# Docker file for yeoman applications

simple docker file for yeoman

## Usage

Make sure you have docker running locally. For more information about how to install docker please see the [official docker install guide](https://docs.docker.com/engine/installation/).

Once you have docker seted up you will need to create and run the docker image.

```bash
docker build -t yeoman .

docker run -t -i -v $(pwd):/src yeoman
```
