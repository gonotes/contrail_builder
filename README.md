# Contrail builder docker image

Docker image for contrail build env
在原有的基础上修改repo的操作，使得不用fq也能获取代码

# Usage

## fetch build env

```
docker pull nati/contrail_builder
docker run -ti nati/contrail_builder
```

## Edit source code in your host machine

You can also have source codes in your local machine.

- Step1: Clone source code in $/Users/nueno/work/contrail_dev
- Step2: make a hard link for that /Users/nueno/work/contrail_dev

```
docker run -v $LOCAL_DIR_IN_FULL_PATH:/opt/local/contrail -ti nati/contrail_builder

cp -r /opt/contrail/* /opt/local/contrail
repo sync
mv /opt/contrail/controller /opt/contrail/controller_backup
ln -s /opt/local/contrail/controller  /opt/contrail/controller
scons --kernel-dir=/usr/src/linux-headers-4.2.0-27-generic

```

Note that local dir should be full path in mac os X or Windows.
(eg /Users/nueno/work/contrail_dev )

# Build latest docker image

```
docker build -t nati/contrail_builder .
```

# Utilities:

- /setup.sh  : clone source code and 3rd party code
- /build.sh  : build source code using scons
