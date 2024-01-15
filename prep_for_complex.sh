#!/bin/bash

module load amber/openmpi/intel/20.11
#use obabal to add hydrogen to telaprevir first
antechamber -i telaprevir_h.pdb -fi pdb -o telaprevir.mol2 -fo mol2 -c bcc -s 2
parmchk2 -i telaprevir.mol2 -f mol2 -o telaprevir.frcmod
pdb4amber -i DnaK_full.pdb -o DnaK_full.amber.pdb --reduce --dry
tleap -f oldff/leaprc.ff99SB leap.in
cpptraj -p comp_sol.prmtop -i pdb.in>pdb.out
