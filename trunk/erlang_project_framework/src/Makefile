
ERLC=erlc

DEPS_FILE=deps.mk
EBIN_DIR=../ebin
INCLUDE_DIR=../include
SOURCES=$(wildcard ./*.erl)
INCLUDES = $(wildcard $(INCLUDE_DIR)/*.hrl) 
ERLC_OPTS=-I $(INCLUDE_DIR) -o $(EBIN_DIR) -Wall -v +debug_info
BEAMS = $(SOURCES:%.erl=$(EBIN_DIR)/%.beam)
BEAM_TARGETS=$(patsubst ./%.erl, $(EBIN_DIR)/%.beam, $(SOURCES))
TARGET_APP = $(APP:%=$(EBIN_DIR)/%)
TARGETS=$(BEAM_TARGETS) $(TARGET_APP)
APP = $(wildcard *.app)

#all: $(BEAMS) $(TARGET_APP)
all: $(TARGETS)

$(DEPS_FILE): $(SOURCES) $(INCLUDES)
	rm -f $@
	echo $(subst : ,:,$(foreach FILE,$^,$(FILE):)) | escript ../generate_deps $@ $(EBIN_DIR)

$(EBIN_DIR)/%.beam: ./%.erl | $(DEPS_FILE)
	$(ERLC)	$(ERLC_OPTS) -pa $(EBIN_DIR) $<

$(EBIN_DIR)/%.app: %.app
	cp $< $(EBIN_DIR)

clean:
	rm $(DEPS_FILE)
	rm -f *.beam *~ $(EBIN_DIR)/*.beam $(EBIN_DIR)/*.app

-include $(DEPS_FILE)
