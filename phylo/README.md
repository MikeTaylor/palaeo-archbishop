# Phylogenetic analysis

This area contains a phylogenetic analysis to place the Archbishop within the phylogeny of [Mannion et al. (2019) (The _Jiangshanosaurus_ paper)](https://royalsocietypublishing.org/doi/10.1098/rsos.191057), which is a direct descendant of that of Mannion et al. (2013) (the _Lusotitan_ paper).

The goal is firstly to reproduce the results of from the _Jiangshanosaurus_ paper; then to add the Archbishop as an extra taxon and score it, and see where it comes out; and then to add any necessary extra characters that emerge from the description, and score all the taxa for them.


## Data

The timeline of relevant papers, together which which characters in the matrix were added by each (as supplied by Phil Mannion):

* Mannion et al. (2013) (_Lusotitan_) - C1-279
* Upchurch et al. (2015) (_Haestasaurus_) - C280-285
* Poropat et al. (2016) (_Savannasaurus_) - C286-397
* Mannion et al. (2017) (_Vouivria_) - C398-416
* Gonzalez Riga et al. (2018) (_Mendozasaurus_) - C417-423
* Mannion et al. (2019a) (Tendaguru sauropods) - C424-542
* Mannion et al. (2019b) (_Jiangshanosaurus_) - C543-548

The data for the present analysis in in the TNT data file [`archbishop.tnt`](archbishop.tnt). This is modified from the _Jiangshanosaurus_ matrix, which is part of [the online supplementary material for that paper](https://rs.figshare.com/collections/Supplementary_material_from_New_information_on_the_Cretaceous_sauropod_dinosaurs_of_Zhejiang_Province_China_impact_on_Laurasian_titanosauriform_phylogeny_and_biogeography_/4614920). (There are two files in the supplementary information, but they are byte-for-byte identical.)

XXX In fact, at the time of writing, this is just a copy of the matrix used in the _Jiangshanosaurus_ matrix, but I will expand it once I am happy that I am replication the Mannion et al. (2019) analysis correctly.

The characters are described in [`CharacterList.doc`](CharacterList.doc), kindly supplied by Phil Mannion.



## Analysis

The analysis for the present study was run on a MacBook Pro with MacOS High Sierra v10.13.6, using [TNT version 1.5 for Mac 64 with no taxon limit](http://www.lillo.org.ar/phylogeny/tnt/tnt-mac-no-tax-limit.zip), version of May 2020 (Many versions have been released as "1.5"). This software is [available from Fundación Miguel](http://www.lillo.org.ar/phylogeny/tnt/). To replicate the present results, this program should be downloaded and unpacked in a directory called `tnt`.

The intention is to replicate the protocol of Mannion et al. (2019), which is described on pages 12-13 of [the PDF](https://royalsocietypublishing.org/doi/pdf/10.1098/rsos.191057) as follows:

> Several unstable and fragmentary taxa were excluded from the analyses (_Astrophocaudia_, _Australodocus_, _Brontomerus_, _Fukuititan_, _Fusuisaurus_, _Liubangosaurus_, _Malarguesaurus_, _Mongolosaurus_). Using equal weighting of characters, this pruned data matrix was analysed using the ‘Stabilize Consensus’ option in the ‘New Technology Search’ in TNT v. 1.5. Searches employed sectorial searches, drift and tree fusing, with the consensus stabilized five times, prior to using the resultant trees as the starting topologies for a ‘Traditional Search’, using Tree Bisection-Reconstruction. We then re-ran the analysis, using the same pruned matrix and protocol, but also applying extended implied weighting in TNT.

Translating this textual description of the protocol into a TNT command file was difficult. I asked for help in [an SV-POW! post](https://svpow.com/2020/08/07/help-running-phylogenetic-analyses-in-tnt/) and received [a fantastically detailed response from Ben Moon](https://svpow.com/2020/08/07/help-running-phylogenetic-analyses-in-tnt/#comment-218222) and some further helpful comments from Steve Vidovic in [a Twitter thread](https://twitter.com/SteveVidovic/status/1291772175553310723). I would have struggled to get this to work without their help, which I gratefully acknowledge.

[The sequence of commands recommended by Ben Moon](https://svpow.com/2020/08/07/help-running-phylogenetic-analyses-in-tnt/#comment-218222) is stored in [`moon.run`](moon.run), and [those recommended by Steve Vidovic](https://twitter.com/SteveVidovic/status/1291772618580926464) in [`vidovic.run`](vidovic.run). These files are _not_ intended to be run directly, but were the starting points of efforts to understand and integrate their largely compatible but differing command sequences.

The result of this work is the file [`archbishop.run`](archbishop.run), which can be run in TNT using the shell command `./tnt/tnt.command archbishop.run,`. (Do _not_ omit the trailing comma. Seriously: TNT needs it.) The `archbishop.run` script pulls in the TNT data file `archbishop.tnt` (see above).

XXX At the time of writing, this file uses `consense 3` rather than `consense 5`, because it is much faster (half an hour rather than many hours). This lets me experiment more quickly, but it will need to be changed back before I run the analysis for real.

Running this analysis leaves behind the following files:
* `archbishop.out` -- a log of the run.
* `archbishop_ew.tre` -- trees found by equal-weighting search
* `archbishop_all_ew_strict.tre` -- strict consensus of equal-weighting trees
* `archbishop_iw.tre` -- trees found by extended-implied-weighting search
* `archbishop_iw_strict.tre` -- strict consensus of extended-implied-weighting trees

