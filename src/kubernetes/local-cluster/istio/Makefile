SHELL := /bin/bash

ISTIO_VERSION ?= 1.13.3
ISTIO_ARCH ?= linux-amd64

CUSTOMER ?= com.gft.tsbo
PROJECT ?= com.gft.tsbo.source
MODULE ?= infrastructure
COMPONENT ?= istio
TARGET ?= $(PROJECT).$(MODULE).$(COMPONENT)
KUBERNETES_NAMESPACE :=$(shell echo "$PROJECT" | sed 's/[^a-zA-Z0-9_-]/-/g' )

TIMESTAMP ?= $(shell date +%Y%m%d%H%M%S)
GITHASH ?= $(shell (  git rev-parse HEAD  ) )
_GITHASH := $(shell ( echo "$(GITHASH)" | sed 's/^ *//; s/  *$$//; s/  */\\|/g') )

BUILD_DIR ?= ./build/
DOWNLOAD_DIR ?= ./downloaded/

CD ?= cd
CP ?= cp -pv
MV ?= mv
MKDIR ?= mkdir -p
LN ?= ln
RM ?= rm
TAR ?= tar
WGET ?= wget
TOUCH ?= touch

.PHONY: clean istio dist dep lib include distclean bin clusterclean clustersetup

all: istio clustersetup

istio: $(BUILD_DIR)/istioctl-$(ISTIO_VERSION)-$(ISTIO_ARCH)

$(DOWNLOAD_DIR)/istio-$(ISTIO_VERSION)-$(ISTIO_ARCH).tar.gz:
	@echo "### KUB / ISTIO / DOWN / $(PROJECT).$(MODULE).$(COMPONENT)"
	@$(MKDIR) -p "$(DOWNLOAD_DIR)"
	@$(WGET) -O "$(DOWNLOAD_DIR)/istio-$(ISTIO_VERSION)-$(ISTIO_ARCH).tar.gz" "https://github.com/istio/istio/releases/download/$(ISTIO_VERSION)/istio-$(ISTIO_VERSION)-$(ISTIO_ARCH).tar.gz" 
	@echo "XXXX 1" 

$(BUILD_DIR)/istioctl-$(ISTIO_VERSION)-$(ISTIO_ARCH): $(DOWNLOAD_DIR)/istio-$(ISTIO_VERSION)-$(ISTIO_ARCH).tar.gz
	@echo "### KUB / ISTIO / DEPLOY / $(PROJECT).$(MODULE).$(COMPONENT)"
#	@ls -l "$(BUILD_DIR)/istioctl-$(ISTIO_VERSION)-$(ISTIO_ARCH)"
	@$(MKDIR) "$(BUILD_DIR)"
	@$(MKDIR) "$(BUILD_DIR)/tmp"
	@$(CD) "$(BUILD_DIR)/tmp" && $(TAR) xzvf "../../downloaded/istio-$(ISTIO_VERSION)-$(ISTIO_ARCH).tar.gz" "istio-$(ISTIO_VERSION)/bin/istioctl"
	@$(MV) "$(BUILD_DIR)/tmp/istio-$(ISTIO_VERSION)/bin/istioctl" "$(BUILD_DIR)/istioctl-$(ISTIO_VERSION)-$(ISTIO_ARCH)"
	@$(RM) -rf "$(BUILD_DIR)/tmp"
	@$(RM) -f "$(BUILD_DIR)/istioctl"
	@$(LN) -s "istioctl-$(ISTIO_VERSION)-$(ISTIO_ARCH)" "$(BUILD_DIR)/istioctl"
	@$(TOUCH) "$(BUILD_DIR)/istioctl-$(ISTIO_VERSION)-$(ISTIO_ARCH)"

clustersetup: 
	@echo "### KUB / ISTIO / SETUP / $(PROJECT).$(MODULE).$(COMPONENT)"
	@"$(BUILD_DIR)/istioctl" install --set profile=default -y

ls:

docker-ls:

dist:

docker: 

clean:
	@echo "### KUB / ISTIO / CLEAN  / $(PROJECT).$(MODULE).$(COMPONENT)"
	@$(RM) -rf $(BUILD_DIR)
	@$(MKDIR) $(BUILD_DIR)

docker-clean:

distclean:

docker-distclean: docker-clean

test:
	
docker-test:

clusterclean:
	@istioctl x uninstall --purge -y || exit 0
	@kubectl delete namespace istio-system || exit 0
