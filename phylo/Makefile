**make-default**: equalweights.log

all: equalweights.log impliedweights.log

equalweights.log: archbishop.tnt equalweights.run
	test -d previous || mkdir previous
	test -f equalweights.log && mv equalweights.log previous/
	test -f equalweights.tre && mv equalweights.tre previous/
	test -f equalweights-strict.tre && mv equalweights-strict.tre previous/
	./tnt/tnt.command $?,

impliedweights.log: archbishop.tnt impliedweights.run
	test -d previous || mkdir previous
	test -f impliedweights.log && mv impliedweights.log previous/
	test -f impliedweights.tre && mv impliedweights.tre previous/
	test -f impliedweights-strict.tre && mv impliedweights-strict.tre previous/
	./tnt/tnt.command $?,

