# Contrail builder docker image

Docker image for contrail build env

Usage:

```
docker run -ti nati/contrail_builder
```

You can also have source codes in your local machine.

```
docker run -v $LOCAL_DIR_IN_FULL_PATH:/opt/contrail --name contrail_builder -ti contrail_builder
```

Note that local dir should be full path in mac os X or Windows.

# Utilities:

- /setup.sh  : clone source code and 3rd party code
- /build.sh  : build source code using scons