#!/bin/bash

module load amber/openmpi/intel/20.11
pdb4amber -i DnaK_full.pdb -o DnaK_full.amber.pdb --reduce --dry
tleap -f leap.in
cpptraj -p dnak_ion.prmtop -i pdb.in>pdb.out
