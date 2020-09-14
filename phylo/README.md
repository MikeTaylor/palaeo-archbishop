# Phylogenetic analysis

<!-- md2toc -l 2 README.md -->
* [Overview](#overview)
* [Data](#data)
* [Analyses](#analyses)
* [Running the analyses](#running-the-analyses)
    * [Note on importing trees](#note-on-importing-trees)
* [Other files and directories](#other-files-and-directories)
* [Visualising trees](#visualising-trees)
* [To Do](#to-do)
* [See also](#see-also)


## Overview

This area contains two phylogenetic analyses (with equal weights and with extended implied weights, both based on the same matrix) to place the Archbishop within the phylogenies of [Mannion et al. (2019) (The _Jiangshanosaurus_ paper)](https://royalsocietypublishing.org/doi/10.1098/rsos.191057). These analyses are direct descendants of those of Mannion et al. (2013) (the _Lusotitan_ paper).

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

The master data for the present analysis in the Nexus data file [`archbishop.nex`](archbishop.nex), which is edited using [Mesquite](https://www.mesquiteproject.org/). From here, it is exported in TNT format to the file [`archbishop.tnt`](archbishop.tnt), which is what TNT can consume. This Nexus file was modified from the _Jiangshanosaurus_ matrix, which is supposed to be part of [the online supplementary material for that paper](https://rs.figshare.com/collections/Supplementary_material_from_New_information_on_the_Cretaceous_sauropod_dinosaurs_of_Zhejiang_Province_China_impact_on_Laurasian_titanosauriform_phylogeny_and_biogeography_/4614920). (There are two files in the supplementary information, but they are byte-for-byte identical copies of the TNT export -- but Phil Mannion sent me the Nexus file.)

The characters are described in [`CharacterList.doc`](CharacterList.doc), kindly supplied by Phil Mannion.


## Analyses

The analyses for the present study were run on a MacBook Pro with MacOS High Sierra v10.13.6, using [TNT version 1.5 for Mac 64 with no taxon limit](http://www.lillo.org.ar/phylogeny/tnt/tnt-mac-no-tax-limit.zip), version of May 2020 (Many differently dated versions have been released as "1.5"). This software is [available from Fundación Miguel](http://www.lillo.org.ar/phylogeny/tnt/). To run these analyses, this program should be downloaded and unpacked in a directory called `tnt`.

The intention is to replicate the protocol of Mannion et al. (2019), which is described on pages 12-13 of [the PDF](https://royalsocietypublishing.org/doi/pdf/10.1098/rsos.191057) as follows:

> Several unstable and fragmentary taxa were excluded from the analyses (_Astrophocaudia_, _Australodocus_, _Brontomerus_, _Fukuititan_, _Fusuisaurus_, _Liubangosaurus_, _Malarguesaurus_, _Mongolosaurus_). Using equal weighting of characters, this pruned data matrix was analysed using the ‘Stabilize Consensus’ option in the ‘New Technology Search’ in TNT v. 1.5. Searches employed sectorial searches, drift and tree fusing, with the consensus stabilized five times, prior to using the resultant trees as the starting topologies for a ‘Traditional Search’, using Tree Bisection-Reconstruction. We then re-ran the analysis, using the same pruned matrix and protocol, but also applying extended implied weighting in TNT.

Translating this textual description of the protocol into TNT command files was difficult. I asked for help in [an SV-POW! post](https://svpow.com/2020/08/07/help-running-phylogenetic-analyses-in-tnt/) and received [a fantastically detailed response from Ben Moon](https://svpow.com/2020/08/07/help-running-phylogenetic-analyses-in-tnt/#comment-218222) and some further helpful comments from Steve Vidovic in [a Twitter thread](https://twitter.com/SteveVidovic/status/1291772175553310723). Both Ben and Steve have subsequently answered follow-up queries by email. I would have struggled to get this to work without their help, which I gratefully acknowledge.

[The original sequence of commands recommended by Ben Moon](https://svpow.com/2020/08/07/help-running-phylogenetic-analyses-in-tnt/#comment-218222) is stored in [`moon.run`](moon.run), and [those recommended by Steve Vidovic](https://twitter.com/SteveVidovic/status/1291772618580926464) in [`vidovic.run`](vidovic.run). These files are _not_ intended to be run directly, but were the starting points of efforts to understand and integrate their largely compatible but differing command sequences.

The result of this work is the two [`equalweights.run`](equalweights.run) and [`impliedweights.run`](impliedweights.run).


## Running the analyses

The two TNT analyses can be run in TNT using the shell commands `./tnt/tnt.command equalweights.run,` and `./tnt/tnt.command impliedweights.run,`. (Do _not_ omit the trailing comma. Seriously: TNT needs it.) Both of these scripts pulls in the TNT data file `archbishop.tnt` (see above).

XXX At the time of writing, the scripts uses `consense 3` rather than `consense 5`, because it is much faster (half an hour rather than many hours). This lets me experiment more quickly, but they will need to be changed back before I run the analyses for real.

Running `equalweights.run` leaves behind the following files:
* [`equalweights.log`](equalweights.log) -- a log of the run.
* [`equalweights.tre`](equalweights.tre) -- trees found by equal-weighting search
* [`equalweights.export`](equalweights.export) -- same trees in TNT format (see below)
* [`equalweights-strict.tre`](equalweights-strict.tre) -- strict consensus of equal-weighting trees

And running `impliedweights.run` leaves behind the analogous files:
* [`impliedweights.log`](impliedweights.log) -- a log of the run.
* [`impliedweights.tre`](impliedweights.tre) -- trees found by implied-weighting search
* [`impliedweights.export`](impliedweights.export) -- same trees in TNT format (see below)
* [`impliedweights-strict.tre`](impliedweights-strict.tre) -- strict consensus of equal-weighting trees

### Note on importing trees

The sets of trees generated by searches are saved in Nexus format as `.tre` files, which can be imported into Mesquite, TreeView, etc. However, TNT is (so far as I can determine) incapable of reading such sets of trees back in -- which you need to do if you want to play with different methods of arriving at a consensus tree. Therefore, the same set of trees is _also_ imported in TNT's own format as `.export` files.

To read a set of trees back into TNT, first determine how many trees the file contains by finding the last `tree tnt_792 = [&U]` line in the file, right near the end. Whatever number is listed here is the tree count. Then run the following commands (since TNT can't read the trees until it's read the matrix, and needs to be told how many trees to remember):

	tnt*>proc archbishop.tnt;
	Reading from archbishop.tnt 
	Matrix (548x124, 16 states). Memory required for data:   0.95 Mbytes 
	tnt*>hold 792;                                                                
	Space for 792 trees in memory 
	tnt*>proc equalweights.export;
	Reading from equalweights.export 
	Reading file equalweights.export as NEXUS 
	Read 792 trees (0-791) from NEXUS file 
	Closing NEXUS file                                                             
	tnt*>

You can now take advantage of a previous long, slow search and play with `pcrprune`, `taxname -`, `nelsen`, etc.


## Other files and directories

* The [`help`](help) directory contains help texts extracted from the TNT binary. The online documentation is difficult to get into, so these individual command descriptions are sometimes more useful (though still very terse).
* The [`Makefile`](Makefile) controls compilation. You can run `make equalweights` or `make impliedweights`. Each rule moves the old log, tree and consensus-tree files for the relevant analysis into the `previous` directory (creating it if necessary) before the run, making it easy to compare the results of the current and previous run.


## Visualising trees

To generate illustrations using generated trees, I used [the Interactive Tree of Life](https://itol.embl.de/itol.cgi), imported the generated `equalweights-strict.tre` file, then exported the result from that page as SVG which I edited with [Inkscape](https://inkscape.org/).


## To Do

* Run to completion with consensus stabilized five times.
* Complete a run of the extended implied weighting analysis even with only three consensus stabilization -- so far I have never known it to complete without running out of tree-space.
* Figure out how the number of trees allocated affects run-time.
* Determine whether ratcheting makes more sense than stabilizing consensus.
* Code the Archbishop for the 548 characters.
* Consider whether more characters need to be added.
* Determine which taxa should be delete _a posteriori_ to improve tree resolution, especially within Brachiosauridae.


## See also

* [_TNT (Tree analysis using New Technology)_ course overview](https://isu-molphyl.github.io/EEOB563/computer_labs/lab2/TNT.html)
* [Consolidated help text](http://phylo.wikidot.com/tntwiki#help_by_command)


