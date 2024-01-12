#! /bin/bash -f

export CUDA_VISIBLE_DEVICES=0

$AMBERHOME/bin/pmemd.cuda -O -i 10md_200ns.in -p dnak_ion.prmtop -c 9md.rst7\
 -ref 9md.rst7 -o 10md_200ns.out -r 10md_200ns.rst7 -x 10md_200ns.nc
