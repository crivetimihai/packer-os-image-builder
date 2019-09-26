# Makefile variables
export PACKER=packer
export VAGRANT=vagrant
export SPECS_DIR=specs
export LOG_DIR=../builds/log

# Used in builds
export BUILDS_DIR=../builds
export ISO_DIR=../../iso

# Packer variables
export PACKER_LOG_PATH=$(LOG_DIR)/packer.log
export CHECKPOINT_DISABLE=1
export PACKER_LOG=1
export PACKER_CACHE_DIR=../builds/.packer_cache
export PACKER_KEY_INTERVAL=10ms

# What to build. Change to null to debug. Supports: virtualbox-iso,vmware-iso, qemu
export BUILDS_ONLY=virtualbox-iso

.DEFAULT_GOAL :=all

all:; @$(MAKE) _all -j8
_all: centos-8-base centos-7-base rhel-8-base fedora-30-base ubuntu-18.04-base debian-10-base

#############################################################################
# make -j 10
#############################################################################

# [X] RHEL 8
rhel-8-base:
	[[ -d $(LOG_DIR) ]] || mkdir -p $(LOG_DIR)
	vboxmanage controlvm virtualbox-$@ poweroff || true
	vboxmanage unregistervm virtualbox-$@ --delete || true
	$(PACKER) inspect $(SPECS_DIR)/$@.json | tee -a $(LOG_DIR)/$@.log
	$(PACKER) build -only=$(BUILDS_ONLY) -on-error=ask -var-file=config.json -force $(SPECS_DIR)/$@.json | tee -a $(LOG_DIR)/$@.log
	$(VAGRANT) box remove $@ | tee -a $(LOG_DIR)/$@.log; true
	$(VAGRANT) box add --name $@ $(BUILDS_DIR)/*$@/*$@.box | tee -a $(LOG_DIR)/$@.log
	$(VAGRANT) box list | tee -a $(LOG_DIR)/$@.log

# [X] CentOS 8
centos-8-base:
	[[ -d $(LOG_DIR) ]] || mkdir -p $(LOG_DIR)
	vboxmanage controlvm virtualbox-$@ poweroff || true
	vboxmanage unregistervm virtualbox-$@ --delete || true
	$(PACKER) inspect $(SPECS_DIR)/$@.json | tee -a $(LOG_DIR)/$@.log
	$(PACKER) build -only=$(BUILDS_ONLY) -on-error=ask -var-file=config.json -force $(SPECS_DIR)/$@.json | tee -a $(LOG_DIR)/$@.log
	$(VAGRANT) box remove $@ | tee -a $(LOG_DIR)/$@.log; true
	$(VAGRANT) box add --name $@ $(BUILDS_DIR)/*$@/*$@.box | tee -a $(LOG_DIR)/$@.log
	$(VAGRANT) box list | tee -a $(LOG_DIR)/$@.log


centos-8-pci:
	[[ -d $(LOG_DIR) ]] || mkdir -p $(LOG_DIR)
	vboxmanage controlvm virtualbox-$@ poweroff || true
	vboxmanage unregistervm virtualbox-$@ --delete || true
	$(PACKER) inspect $(SPECS_DIR)/$@.json | tee -a $(LOG_DIR)/$@.log
	$(PACKER) build -on-error=ask -var-file=config.json -force $(SPECS_DIR)/$@.json | tee -a $(LOG_DIR)/$@.log
	$(VAGRANT) box remove $@ | tee -a $(LOG_DIR)/$@.log; true
	$(VAGRANT) box add --name $@ $(BUILDS_DIR)/*$@/*$@.box | tee -a $(LOG_DIR)/$@.log
	$(VAGRANT) box list | tee -a $(LOG_DIR)/$@.log


# [X] CentOS 7
centos-7-base:
	[[ -d $(LOG_DIR) ]] || mkdir -p $(LOG_DIR)
	vboxmanage controlvm virtualbox-$@ poweroff || true
	vboxmanage unregistervm virtualbox-$@ --delete || true
	$(PACKER) inspect $(SPECS_DIR)/$@.json | tee -a $(LOG_DIR)/$@.log
	$(PACKER) build -only=$(BUILDS_ONLY) -on-error=ask -var-file=config.json -force $(SPECS_DIR)/$@.json | tee -a $(LOG_DIR)/$@.log
	$(VAGRANT) box remove $@ | tee -a $(LOG_DIR)/$@.log; true
	$(VAGRANT) box add --name $@ $(BUILDS_DIR)/*$@/*$@.box | tee -a $(LOG_DIR)/$@.log
	$(VAGRANT) box list | tee -a $(LOG_DIR)/$@.log

# [X] Fedora 30
fedora-30-base:
	[[ -d $(LOG_DIR) ]] || mkdir -p $(LOG_DIR)
	vboxmanage controlvm virtualbox-$@ poweroff || true
	vboxmanage unregistervm virtualbox-$@ --delete || true
	$(PACKER) inspect $(SPECS_DIR)/$@.json | tee -a $(LOG_DIR)/$@.log
	$(PACKER) build -only=$(BUILDS_ONLY) -on-error=ask -var-file=config.json -force $(SPECS_DIR)/$@.json | tee -a $(LOG_DIR)/$@.log
	$(VAGRANT) box remove $@ | tee -a $(LOG_DIR)/$@.log; true
	$(VAGRANT) box add --name $@ $(BUILDS_DIR)/*$@/*$@.box | tee -a $(LOG_DIR)/$@.log
	$(VAGRANT) box list | tee -a $(LOG_DIR)/$@.log

# [X] Ubuntu 18.04
ubuntu-18.04-base:
	[[ -d $(LOG_DIR) ]] || mkdir -p $(LOG_DIR)
	vboxmanage controlvm virtualbox-$@ poweroff || true
	vboxmanage unregistervm virtualbox-$@ --delete || true
	$(PACKER) inspect $(SPECS_DIR)/$@.json | tee -a $(LOG_DIR)/$@.log
	$(PACKER) build -only=$(BUILDS_ONLY) -on-error=ask -var-file=config.json -force $(SPECS_DIR)/$@.json | tee -a $(LOG_DIR)/$@.log
	$(VAGRANT) box remove $@ | tee -a $(LOG_DIR)/$@.log; true
	$(VAGRANT) box add --name $@ $(BUILDS_DIR)/*$@/*$@.box | tee -a $(LOG_DIR)/$@.log
	$(VAGRANT) box list | tee -a $(LOG_DIR)/$@.log

# [X] Ubuntu 18.04
debian-10-base:
	[[ -d $(LOG_DIR) ]] || mkdir -p $(LOG_DIR)
	vboxmanage controlvm virtualbox-$@ poweroff || true
	vboxmanage unregistervm virtualbox-$@ --delete || true
	$(PACKER) inspect $(SPECS_DIR)/$@.json | tee -a $(LOG_DIR)/$@.log
	$(PACKER) build -only=$(BUILDS_ONLY) -on-error=ask -var-file=config.json -force $(SPECS_DIR)/$@.json | tee -a $(LOG_DIR)/$@.log
	$(VAGRANT) box remove $@ | tee -a $(LOG_DIR)/$@.log; true
	$(VAGRANT) box add --name $@ $(BUILDS_DIR)/*$@/*$@.box | tee -a $(LOG_DIR)/$@.log
	$(VAGRANT) box list | tee -a $(LOG_DIR)/$@.log

clean:
	vboxmanage controlvm virtualbox-centos-7 poweroff || true
	vboxmanage unregistervm virtualbox-centos-7 --delete || true
