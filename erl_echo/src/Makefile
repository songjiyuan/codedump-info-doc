
ERLC=erlc
ERLC_FLAGS= +debug_info

INCLUDES = $(wildcard *.hrl)
SOURCES = $(wildcard *.erl)
BEAMS = $(SOURCES:%.erl=../ebin/%.beam)
APP = $(wildcard *.app)
TARGET_APP = $(APP:%=../ebin/%)

all: $(BEAMS) $(TARGET_APP)

../ebin/%.beam: %.erl $(INCLUDES)
	$(ERLC)	-pa ../ebin -W $(ERLC_FLAGS) -o ../ebin $<

../ebin/%.app: %.app
	cp $< ../ebin

clean:
	rm -f *.beam *~ ../ebin/*.beam ../ebin/*.app
