NAMES = equalweights impliedweights equalweights-constrained ecg 
SCRIPTS = $(NAMES:%=%.run)

all: $(SCRIPTS)

%.run: %.m4 template.m4
	rm -f $@
	m4 $< > $@
	chmod ugo-w $@

test: all
	diff ../equalweights.run equalweights.run
	diff ../impliedweights.run impliedweights.run
	diff ../equalweights-constrained.run equalweights-constrained.run
	diff ../ecg.run ecg.run

clean:
	rm -f $(SCRIPTS)

