#!/bin/bash

module load amber/openmpi/intel/20.11
obabel -ipdb telaprevir.pdb -h -opdb -O telaprevir_h_2.pdb
obabel -ipdb telaprevir_h.pdb -omol2 -O telaprevir_obabel.mol2
antechamber -i telaprevir_obabel.mol2 -fi mol2 -fo mol2 -o telaprevir_antechamber.mol2 -c bcc -s 2
parmchk2 -i telaprevir_antechamber.mol2 -f mol2 -o telaprevir.frcmod
pdb4amber -i DnaK_full.pdb -o DnaK_full.amber.pdb --reduce --dry
tleap -f leap.in
