# Milestone 2
## Goal
Build Ghidra pipeline to generate high P-code, which can then be saved into
files.

## Importance
This is important because it will serve as the main method for us to automate
the creation of P-code for our training data.

## First Test Program
Write a script that takes in a compiled binary, and outputs high P code for
relevant functions (ignores boilerplate instructions).

## Steps
1. Write a script that extracts the high P code of a function.
2. Configure Ghidra headless to run that script via the cmd line.
3. Write a small bash script to automate this and save Pcode to text files.

## Notes During Experiment
See Ghidra docs > Ghidra Script Development for details on how to write ghidra
scripts

## Notes After Experiment
