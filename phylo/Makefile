**make-default**: equalweights

all: equalweights impliedweights

equalweights: equalweights.log

equalweights.log: archbishop.tnt equalweights.run
	test -d previous || mkdir previous
	-cp equalweights.run previous/
	-test -f equalweights.log && mv equalweights.log previous/
	-test -f equalweights.tre && mv equalweights.tre previous/
	-test -f equalweights.export && mv equalweights.export previous/
	-test -f equalweights-strict.tre && mv equalweights-strict.tre previous/
	./tnt/tnt.command equalweights.run,

impliedweights: impliedweights.log

impliedweights.log: archbishop.tnt impliedweights.run
	test -d previous || mkdir previous
	-cp impliedweights.run previous/
	-test -f impliedweights.log && mv impliedweights.log previous/
	-test -f impliedweights.tre && mv impliedweights.tre previous/
	-test -f impliedweights.export && mv impliedweights.export previous/
	-test -f impliedweights-strict.tre && mv impliedweights-strict.tre previous/
	./tnt/tnt.command impliedweights.run,

