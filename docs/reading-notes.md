This thesis evaluates Ghidra p-code as a normalized representation for binary vulnerability analysis. Instead of proposing a new neural architecture, it studies which vulnerability-relevant semantics survive compilation and lifting, and uses existing similarity/learning methods as downstream probes to measure whether preserved p-code features improve cross-architecture vulnerability detection.
# Anchor Papers
## Formal Semantics for P-code https://www.ssrg.ece.vt.edu/papers/vstte22.pdf
### Reason for Reading
Defines the quirks of P-code
### Problem Statement
P-code lacks semantics, and the existing documentation isn't very clear, and sometimes wrong.
### About P-Code Types
Ghidra uses SLEIGH (custom disassembler) which does many analysis steps, before generating final P-code.

There are two types of P code: Low then High Pcode:
1) Low P-Code
	1) LPC is a one-to-many translation of asm.
		1) LPC has a smaller syntax compared to x86, so it generates many instructions for a single x86 one
	2) Syntax:
		1) `$U` prefix = local variable
		2) Registers are ID'd by their name, and assumed to have fixed size
		3) Addresses are prefixed with `0x`
		4) Constants are either decimal or hex
		5) Both addr and consnts have width sizes indicated by `:x`
2) High P-Code
	1) HPC is generated from Ghidra analyzing LPC. HPC then becomes the C decompilation 

### Properties of P-code (aka what is wrong with P-Code)
1) Conditional branches possible cases:
	1) P-code is correct
	2) Incorrectly jmp or falls through on conditionals
2) Phi-node Usage:
	1) Usually phi-node alternative values are protected based on the address we came from (this is how conditionals work)
	2) P-code has the issue that it doesnt label which input belongs to which predecessor block
3) Varnodes:
	1) Inputs/outputs are encoded in varnodes, representing args and destination.
	2) VNs can be reg or mem addr, and consist of addr space, offset, and size. 
	3) The possible varnodes:
		1) (r,l): register r and size l
		2) (a,l): memory, with base 'a', and size of region 'l'
		3) (c,l): const value, with val 'c', and size 'l'
		4) (v,l): local var, with identifier 'v' and size 'l'
4) Call and Return
	1) Ghidra docs state that they just use a simple BRANCH instruction for calls, which isnt possible since CALLS require args and a ret val.
5) Fall Through
	1) P-code doesn't have a set way of dealing with conditionals. It may sometimes fall through, or take a jump, with no uniform way of doing so.




## Testing Intermediate Representations for Binary Analysis https://ieeexplore-ieee-org.libweb.lib.utsa.edu/stamp/stamp.jsp?tp=&arnumber=8115648
### Reason for Reading
Gives insight on how to evaluate an IR
### Problem Statement and Proposal
Not many ways to test how well an IR does at translating executables, so they propose a systematic way of doing so. 

They propose N-version IR testing, where they compare the output of N binary lifters and look for anomalies.
### Classifications of IR
1) Explicit
	1) An explicit IR only effects a single variable for each IR instruction
	2) More Explicit = more instructions to represent. More Implicit = more efficient representation
2) Self-Containment
	1) Shows whether a lifted IR instance completely explains the semantics of the corresponding binary code
	2) For example, say we have x86 AND X1, X2
		1) Some lifters will simply have their own version of AND X1, X2, which doesnt really tell us much about what the instruction is actually doing
		2) A self contained IR will go through the steps of that AND
3) When Considering explicitness/self containment, ignore dependency instructs, such as syscalls, since a binary lifted has no choice but to just put open() or whatever the syscall is.


### Testing Methodology: N-version IR Testing

## Scalable Validation of Binary Lifters

# Binary Analysis / Systems Security Foundation
## SoK: (State of) The Art of War: Offensive Techniques in Binary Analysis
### Reason for Reading
Gives framework for vulnerable binary analysis. Important to understand what we are looking for when it comes to a vulnerabilitie's "essence".

### Automated Analysis
1) Properties of a Bug
	1) Replayability
		1) bug may occur when running a small chunk of program, but no way of replaying it from a normal execution flow
		2) high replay = low coverage, but low replay = high false positives
	2) Semantic Insight
		1) reasoning as to why a bug occured. why certain conditional branches were taken, etc
		2) high semantics = large data stored i.e conditions for certain branches taken, register values at time of bug, but low semantics = small data required
			1) low semantics has the chance to be overzealous since if say, memcpy() has a tendency to cause vulns, a static analysis with low semantics will cause all memcpy() to be labeled as vuln, even safe ones.
			2) low semantics also makes fuzzing harder since we dont have information/context as very obscure values led to a vul
2
## WYSINWYX: What You See Is Not What You eXecute
## Static Detection of Vulnerabilities in x86 Executables
### Reason For Reading
Goes over a systemic method of applying static analysis on binaries. This tells us what is important for a static analysis, which is what would be used if using P-code.

### Detection of Instruction Structures
1) You should resolve jump and call instructions to help with control flow identifation
2) In case of switch statement, jump table branches, backtrack until the code that sets up table access is found
	1) From here, perform some branches via intrapodedural constant propogation, which means to symbolically execute the function, and then see the possible outputs which map to branches in the switch statement.
3) To identify loops use DJ graphs
4) recursive functions are found via standard topological sort algorithm on function call graph
5) To correctly identify library function names, combine info from PLT and the relocation table.

### Symbolic Execution and Execution State
Interpretatively execute a program by supplying symbols representing arbitrary values. Its a way of describing many possible real executions at once. The idea is to traverse all feasible program paths, 

Also, Important to consider ES: this is the state a process is left in after the execution of certain instructions i.e. the values of the registers, memorty locations, etc. We can imagine that these locations hold symbolic expressions and real/concrete values (like, we got to this state because rax = arbitrary value, but rbx = 2 since to reach this state, it didnt matter what was in rax)

Now, we also have to consider path conditions; these are constraints that the symbolic values must meet to explore the assocaited path. Like, if we have a symbol x, and we reach if(x == 0), then there must be two possioble path conditions, so the analysis should "fork" with x=0 and x!=0.

### Taint Analysis
TA is program analysis technique that tracks whether data that came from an untrusted source can flow into sensitive operations. If the data can, its considered tainted. We then trace the propogation of this tainted data throughought the control flow of the program:
1. ID sources of untursted data i.e. CMD arguments
2. ID sensitive sinks aka calls to system()/very dangerous fucntions
3. See how that tainted data propogatse
4. generate alert when it reaches a sensitive sink
## Firmalice: Automatic Detection of Authentication Bypass Vulnerabilities in Binary Firmware

# Cross-Architecture Vulnerability Search
## Cross-Architecture Bug Search in Binary Executables
## discovRE: Efficient Cross-Architecture Identification of Bugs in Binary Code
## BinHunt: Automatically Finding Semantic Differences in Binary Programs
## BinX
## VulHawk

# IR / Decompilation / Recovered Structure
## No More Gotos: Decompilation Using Pattern-Independent Control-Flow Structuring
## Ghidra Decompiler Internals / Scripting Notes
## angr VEX IR Notes

# Vulnerability Pattern Preservation
## Buffer Overflow Pattern Notes
## Integer Overflow Pattern Notes
## Format String Pattern Notes
## Use-After-Free Pattern Notes
## Command Injection Pattern Notes
## Bounds Check Recovery Notes
## Data-Flow / Taint-Flow Recovery Notes

# Dataset Construction
## ROMEO
## NIST SARD / Juliet C/C++ Test Suite
## Magma: A Ground-Truth Fuzzing Benchmark
## Optional: DiverseVul

# Evaluation Design
## Compiler Matrix Notes: GCC vs Clang
## Optimization Matrix Notes: O0, O1, O2, O3, Os
## Architecture Matrix Notes: x86-64, ARM, MIPS
## P-code vs Assembly vs Decompiled C Comparison
## Vulnerability Feature Survival Metrics
## False Positive / False Negative Analysis

# Minimal ML / Similarity Baselines
## How ML is Solving the Binary Function Similarity Problem
## Gemini: Neural Network-based Graph Embedding for Cross-Platform Binary Code Similarity Detection
## VulSeeker
## Optional: Asteria

# Professor Notes:
Dr Zhang:
    Look into:
     - network pruning
     - lottery ticket hypothesis | https://arxiv.org/abs/1803.0363
     - network quantization
     - neural architecture search 
