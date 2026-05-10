# Milestone 1

## Goal
Extract high P-code from small compiled C program and save it in usable format.

## Importance
Need to prove that I can reliable extract the representation required to train the model.

## First Test program
Use small vulnerable C program with small buffer overflow vulnerability.

## Steps
1. Write small vuln C program.
2. Compile it with `gcc -O0 -g`
3. Compile again with `gcc -O2 -g`
4. Open both binaries in Ghidra
5. Extract high P-code for the vulnerable function
6. Compare the P-code between the two optimization levels
7. Identify what should be normalized.

## Success Criteria
I should end up with one or more files containing P-code output for a vulnerable function.

## Questions to Answer
1. Does Ghidra produce readable high P-code for the function?
2. How different is the P-code between `-O0` and `-O2`?
3. Which tokens seem useful?
4. Which tokens are noise?
5. What normalization rules are needed?

# Next Action
Write one vulnerable C program and compile it with `gcc -O0` and `gcc -O2`.

Then inspect both binaries in Ghidra or with `objdump`.
