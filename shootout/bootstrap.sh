#!/bin/bash
cd ../
./tinyvm shootout/scripts/bootstrap.tvm
mkdir -p shootout/data
mv fasta-50000000.txt shootout/data
cd shootout/data
ln -s fasta-50000000.txt revcomp-input.txt
cd ../reverse-complement
ln -s ../data/revcomp-input.txt revcomp-input.txt
