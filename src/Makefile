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

.DEFAULT_GOAL :=debian-10-base

all: debian-10-base # ubuntu-18.04-base centos-7-base fedora-30-base alpine-3.10-base ubuntu-18.04-base debian-9.9-base

#############################################################################
# make -j 10
#############################################################################

# [X] RHEL 8
rhel-8-base:
	[[ -d $(LOG_DIR) ]] || mkdir -p $(LOG_DIR)
	$(PACKER) inspect $(SPECS_DIR)/$@.json | tee -a $(LOG_DIR)/$@.log
	$(PACKER) build -only=$(BUILDS_ONLY) -on-error=ask -var-file=config.json -force $(SPECS_DIR)/$@.json | tee -a $(LOG_DIR)/$@.log
	$(VAGRANT) box remove $@ | tee -a $(LOG_DIR)/$@.log; true 
	$(VAGRANT) box add --name $@ $(BUILDS_DIR)/*$@/*$@.box | tee -a $(LOG_DIR)/$@.log
	$(VAGRANT) box list | tee -a $(LOG_DIR)/$@.log

# [X] CentOS 7
centos-7-base:
	[[ -d $(LOG_DIR) ]] || mkdir -p $(LOG_DIR)
	$(PACKER) inspect $(SPECS_DIR)/$@.json | tee -a $(LOG_DIR)/$@.log
	$(PACKER) build -only=$(BUILDS_ONLY) -on-error=ask -var-file=config.json -force $(SPECS_DIR)/$@.json | tee -a $(LOG_DIR)/$@.log
	$(VAGRANT) box remove $@ | tee -a $(LOG_DIR)/$@.log; true 
	$(VAGRANT) box add --name $@ $(BUILDS_DIR)/*$@/*$@.box | tee -a $(LOG_DIR)/$@.log
	$(VAGRANT) box list | tee -a $(LOG_DIR)/$@.log

# [X] Fedora 30
fedora-30-base:
	[[ -d $(LOG_DIR) ]] || mkdir -p $(LOG_DIR)
	$(PACKER) inspect $(SPECS_DIR)/$@.json | tee -a $(LOG_DIR)/$@.log
	$(PACKER) build -only=$(BUILDS_ONLY) -on-error=ask -var-file=config.json -force $(SPECS_DIR)/$@.json | tee -a $(LOG_DIR)/$@.log
	$(VAGRANT) box remove $@ | tee -a $(LOG_DIR)/$@.log; true 
	$(VAGRANT) box add --name $@ $(BUILDS_DIR)/*$@/*$@.box | tee -a $(LOG_DIR)/$@.log
	$(VAGRANT) box list | tee -a $(LOG_DIR)/$@.log

# [X] Ubuntu 18.04
ubuntu-18.04-base:
	[[ -d $(LOG_DIR) ]] || mkdir -p $(LOG_DIR)
	$(PACKER) inspect $(SPECS_DIR)/$@.json | tee -a $(LOG_DIR)/$@.log
	$(PACKER) build -only=$(BUILDS_ONLY) -on-error=ask -var-file=config.json -force $(SPECS_DIR)/$@.json | tee -a $(LOG_DIR)/$@.log
	$(VAGRANT) box remove $@ | tee -a $(LOG_DIR)/$@.log; true 
	$(VAGRANT) box add --name $@ $(BUILDS_DIR)/*$@/*$@.box | tee -a $(LOG_DIR)/$@.log
	$(VAGRANT) box list | tee -a $(LOG_DIR)/$@.log

# [X] Ubuntu 18.04
debian-10-base:
	[[ -d $(LOG_DIR) ]] || mkdir -p $(LOG_DIR)
	$(PACKER) inspect $(SPECS_DIR)/$@.json | tee -a $(LOG_DIR)/$@.log
	$(PACKER) build -only=$(BUILDS_ONLY) -on-error=ask -var-file=config.json -force $(SPECS_DIR)/$@.json | tee -a $(LOG_DIR)/$@.log
	$(VAGRANT) box remove $@ | tee -a $(LOG_DIR)/$@.log; true 
	$(VAGRANT) box add --name $@ $(BUILDS_DIR)/*$@/*$@.box | tee -a $(LOG_DIR)/$@.log
	$(VAGRANT) box list | tee -a $(LOG_DIR)/$@.log

