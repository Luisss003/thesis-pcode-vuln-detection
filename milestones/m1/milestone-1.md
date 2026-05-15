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

## Notes After Experiment
### O0 vs O2 Instruction Generation
 - O0 contains entire prologue (push rbp/mov rsp rbo/sub rsp), while vulnerable
   function directly creates stack frame without rbp
 - O0 will individually set up arguments for strcpy, but does include some
 redundant code. O2 only requires 2 instructs in vulnerable function to set up
 arguements for strcpy.
 - O0 will manually set rax to 0, while O2 uses the faster XOR.
 - generally, it seems that while they do things differently, they achieve the
 same overall structure, which is to set up the stack frame, put arguements in
 registers, call the functions, then do the epilogue.

### Ghidar High Pcode Generation
Despite differing in instruction generation, the high Pcode is almost exactly
the same.

#### O0
```
DumpCurrentFunctionPcode.java> Running...
[+] Function: vulnerable
[+] Entry: 00400476
(unique, 0x8f00, 8) PTRSUB (register, 0x20, 8) , (const, 0xffffffffffffffee, 8)
 ---  CALL (ram, 0x400370, 8) , (unique, 0x8f00, 8) , (register, 0x38, 8)
(unique, 0x8f00, 8) PTRSUB (register, 0x20, 8) , (const, 0xffffffffffffffee, 8)
 ---  CALL (ram, 0x400380, 8) , (unique, 0x10000032, 8) , (unique, 0x8f00, 8)
(unique, 0x10000032, 8) COPY (const, 0x4011b8, 8)
 ---  RETURN (const, 0x0, 8)
DumpCurrentFunctionPcode.java> Finished!
```

#### O2
```
DumpCurrentFunctionPcode.java> Running...
[+] Function: vulnerable
[+] Entry: 004004a0
(unique, 0x9d00, 8) PTRSUB (register, 0x20, 8) , (const, 0xffffffffffffffee, 8)
 ---  CALL (ram, 0x400370, 8) , (unique, 0x9d00, 8) , (register, 0x38, 8)
(unique, 0x9d00, 8) PTRSUB (register, 0x20, 8) , (const, 0xffffffffffffffee, 8)
 ---  CALL (ram, 0x400380, 8) , (unique, 0x1000002a, 8) , (unique, 0x9d00, 8)
(unique, 0x1000002a, 8) COPY (const, 0x4011b8, 8)
 ---  RETURN (const, 0x0, 8)
DumpCurrentFunctionPcode.java> Finished!
```


