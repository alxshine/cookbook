DOCKERHUB_USER:=alxshine
images:=$(patsubst %.dockerfile,%.image,$(wildcard *.dockerfile))
remotes:=$(patsubst %.image,%.push,${images})

all: ${images}

push: ${remotes}

%.image: %.dockerfile
	docker build -t ${DOCKERHUB_USER}/$* -f $< .

%.push: %.image
	docker push ${DOCKERHUB_USER}/$*
