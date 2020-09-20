echo =;
log NAME.log;
mxram 2048;
MAYBE_PIWE
proc archbishop.tnt;
MAYBE_XPIWE
taxcode -12 14 17 28 29 40 42 44;
taxcode +;
taxcode -;
taxname =;
hold 200000;

CONSTRAINTS
xmult=consense 2 noratchet verbose;
bbreak=tbr xbit safe;
export = NAME.tre;
export - NAME.export;

pcrprune;

nelsen*; tchoose {strict}; export = NAME-strict.tre;
tplot;

naked-;
tplot;

log NAME-apomorphies.log
tplot;
apo -;
apo;

log/;
quit;
