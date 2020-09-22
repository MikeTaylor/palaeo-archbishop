NAMES = equalweights impliedweights equalweightsA equalweightsB
SCRIPTS = $(NAMES:%=%.run)

all: $(SCRIPTS)

%.run: %.m4 template.m4
	rm -f $@
	m4 $< > $@
	chmod ugo-w $@

clean:
	rm -f $(SCRIPTS)

