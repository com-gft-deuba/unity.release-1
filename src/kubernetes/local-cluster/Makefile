SHELL := /bin/bash

CUSTOMER ?= com.gft.deuba
PROJECT ?= com.gft.deuba.unity.release-1
TIMESTAMP ?= $(shell date +%Y%m%d%H%M%S)
GITHASH ?= $(shell ( git rev-parse HEAD  ) )
_GITHASH := $(shell ( echo "$(GITHASH)" | sed 's/^ *//; s/  *$$//; s/  */\\|/g') )

SUBDIRS = istio kiali dashboard step-1 step-2 step-3 

all: istio kiali dashboard docker 

.PHONY: lib bin docker clean distclean dep include kiali certificates istio dashboard clusterclean clustersetup

lib:

include:

bin:

dist:

dep:

docker:
	@make -C ../../docker all

kubernetes: docker 
	@for dir in $(SUBDIRS) ; do \
	    TIMESTAMP="$(TIMESTAMP)" \
	    GITHASH="$(GITHASH)" \
	    CUSTOMER="$(CUSTOMER)" \
	    PROJECT="$(PROJECT)" \
		make -C  $$dir kubernetes; \
	done

istio:
	@TIMESTAMP="$(TIMESTAMP)" \
	GITHASH="$(GITHASH)" \
	CUSTOMER="$(CUSTOMER)" \
	PROJECT="$(PROJECT)" \
	make -C  $$dir istio

dashboard:
	@TIMESTAMP="$(TIMESTAMP)" \
	GITHASH="$(GITHASH)" \
	CUSTOMER="$(CUSTOMER)" \
	PROJECT="$(PROJECT)" \
	make -C  $$dir dashboard

kiali:
	@TIMESTAMP="$(TIMESTAMP)" \
	GITHASH="$(GITHASH)" \
	CUSTOMER="$(CUSTOMER)" \
	PROJECT="$(PROJECT)" \
	make -C  $$dir kiali

ls:
	@echo "### KUB / LS    $(KUBERNETES_NAMESPACE)"
	@for o in $$( kubectl api-resources --namespaced=true --verbs=delete -o name | sort ) ; do \
	  kubectl get -n $(KUBERNETES_NAMESPACE) "$$o" 2>/dev/null | sed -e '1i\'$$'\n'"    $$o" -e 's/^/        /' ; \
	done

clean:
	@for dir in $(SUBDIRS) ; do \
	    TIMESTAMP="$(TIMESTAMP)" \
	    GITHASH="$(GITHASH)" \
	    CUSTOMER="$(CUSTOMER)" \
	    PROJECT="$(PROJECT)" \
		make -C  $$dir clean ; \
	done

distclean:
	@for dir in $(SUBDIRS) ; do \
	    TIMESTAMP="$(TIMESTAMP)" \
	    GITHASH="$(GITHASH)" \
	    CUSTOMER="$(CUSTOMER)" \
	    PROJECT="$(PROJECT)" \
		make -C  $$dir distclean ; \
	done

clusterclean:
	@kubectl delete namespace "$(PROJECT)" || exit 0
	@make -C kiali clusterclean
	@make -C istio clusterclean

clustersetup:
	@make -C istio clustersetup
	@make -C kiali clustersetup
	@cd step-3 && kubectl apply -f .


docker-clean:

docker-distclean:

ls:

docker-ls:

test:

docker-test:

