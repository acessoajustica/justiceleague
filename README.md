LabXP 2015: Acesso à Justiça
==============================

[![Build Status](https://img.shields.io/travis/acessoajustica/acessoajustica.svg)]
                (https://travis-ci.org/acessoajustica/acessoajustica)
[![Coverage Status](https://img.shields.io/coveralls/acessoajustica/acessoajustica.svg)]
                   (https://coveralls.io/r/acessoajustica/acessoajustica?branch=dev)
[![Dependency Status](https://img.shields.io/gemnasium/acessoajustica/acessoajustica.svg)]
                     (https://gemnasium.com/acessoajustica/acessoajustica)
[![Code Climate](https://img.shields.io/codeclimate/github/acessoajustica/acessoajustica.svg)]
                (https://codeclimate.com/github/acessoajustica/acessoajustica)
[![Scrutinizer](https://img.shields.io/scrutinizer/g/acessoajustica/acessoajustica.svg)]
               (https://scrutinizer-ci.com/g/acessoajustica/acessoajustica)
[![License](https://img.shields.io/github/license/acessoajustica/acessoajustica.svg)]
           (https://github.com/acessoajustica/acessoajustica/blob/master/LICENSE)

[![Backlog](https://badge.waffle.io/acessoajustica/acessoajustica.svg?title=Backlog)]
           (http://waffle.io/acessoajustica/acessoajustica)
[![Ready](https://badge.waffle.io/acessoajustica/acessoajustica.svg?title=Ready)]
         (http://waffle.io/acessoajustica/acessoajustica)
[![In Progress](https://badge.waffle.io/acessoajustica/acessoajustica.svg?title=In Progress)]
               (http://waffle.io/acessoajustica/acessoajustica)
[![Testing](https://badge.waffle.io/acessoajustica/acessoajustica.svg?title=Testing)]
           (http://waffle.io/acessoajustica/acessoajustica)
[![Done](https://badge.waffle.io/acessoajustica/acessoajustica.svg?title=Done)]
        (http://waffle.io/acessoajustica/acessoajustica)

This repository contains a ruby on rails project for the
[Legal Department XI de Agosto](http://djonzedeagosto.org.br/). The project
started in the
[eXtreme Programming course of 2015](http://ccsl.ime.usp.br/wiki/LabXP2015),
of the University of São Paulo.

## Dependencies

We use Docker and Compose, but still haven't hosted a Docker
image at DockerHub.
To get your dev environment up and running, simply follow the instructions to
install [Docker](https://docs.docker.com/installation/) and
[Compose](https://docs.docker.com/compose/install/) for your
operating system. Then get sure that the Docker daemon is running and
finally, run:

```
git clone https://github.com/acessoajustica/acessoajustica.git
./script/alfredo all
```

This will build the containers, create and seed the database, run the migration and then starts the server

If docker fails to download images or the ruby bundler
fail due to problems in the internet connection, you'll have
to restart the docker daemon. Run:

```
sudo service docker restart
```

Or:

```
sudo systemctl restart docker.service
```

## The alfredo script

The ```alfredo``` script provides the following functionalities:

```
# Builds images and containers.
./script/alfredo build

# Runs bundle update.
./script/alfredo update

# Stops and removes all containers.
./script/alfredo clean

# Runs the app on the latest container
./script/alfredo run

# Runs the migrations.
./script/alfredo migrate

# Runs unit tests.
./script/alfredo rspec

# Runs acceptance tests.
./script/alfredo cucumber
```

Before run any test, set the test enviroment up
To set up test enviroment, run:

```
RAILS_ENV=TEST ./script/alfredo create
RAILS_ENV=TEST ./script/alfredo seed
RAILS_ENV=TEST ./script/alfredo migrate
```

For more information, run the help option:

```
./script/alfredo help
```

The app runs at ```localhost:3000```.

## Troubleshooting

Refer to https://docs.docker.com/compose/rails/.
