echo =;
log results/NAME.log;
mxram 2048;
MAYBE_PIWE
proc archbishop.tnt;
MAYBE_XPIWE
taxcode -12 14 17 28 29 40 42 44;
taxcode +;
taxcode -;
taxname =;
hold 1000;

CONSTRAINTS
xmult=consense 1 noratchet verbose;
hold 200000;
bbreak=tbr xbit safe;
export = results/NAME.tre;
export - results/NAME.export;

pcrprune;

nelsen*; tchoose {strict}; export = results/NAME-strict.tre;
tplot;

naked-;
tplot;

log results/NAME-apomorphies.log
tplot;
apo -;
apo;

log/;
quit;
