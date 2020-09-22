NAMES = equalweights equalweightsA equalweightsB impliedweights
SCRIPTS = $(NAMES:%=%.run)
LOGS = $(NAMES:%=results/%.log)

**make-default**: results/equalweights.log

all: $(LOGS)

results/%.log: %.run
	$(eval STEM := $(shell echo $@ | sed 's/^results\/\(.*\)\.log$$/\1/'))
	rm -f previous/$(STEM).*
	test -f results/$(STEM).log && mv results/$(STEM).* previous/ || :
	cp $(STEM).run results/
	./tnt/tnt.command $(STEM).run,

%.run: scripts/%.m4 scripts/template.m4
	rm -f $@
	m4 $< > $@
	chmod ugo-w $@

clean:
	rm -f $(SCRIPTS)

