# Milestone 1

## Goal
Given the Juliet database, design a small pipeline to generate high P code files
for important functions using the techniques found in ROMEO. In future
milestones, we will normalize/tokenize.

## Importance
We already know Ghidra P-code extraction pipeline is doable, but before doing
that, we need a preliminary dataset to work with.

## Steps
1. Download Juliet dataset and familiarize
2. Read ROMEO paper to see how they processed important
3. Do prelim cleanup as seen on ROMEO (delete good/bad functions in io.c,etc)
4. Manually compile -> link -> and disassembly to get most semantics possible.
   Focus on x64; do ARM if time.

## Success Criteria
Should end up with a good portion of the Juliet dataset now in object files
which we will later use to generate high P-code. The dataset will be rough now,
but we can clean up redundant samples and useless functions in later milestones.

## Notes After Experiment

