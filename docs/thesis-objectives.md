# Thesis Objectives

## Working Title
Lightweight Binary Vulnerability Detection Using Normalized Ghidra P-code

## Problem
Binary vulnerability detection is difficult since source code isn't always available, and binaries, in the process  of becoming binaries, go through different changes such as the architecture they were compiled on, different levels of optimization, compiler differences, and more. There are existing ideas such as BinX that have seen success, but they use BERT/CodeBERT/transformer technology that is very expensive.

## Main idea
Ghidra high P-code acts as a normalized intermediate representation for binary functions; this is because P-code abstracts alot of architecture specific patterns like calling conventions.

## Research Question
Can normalized Ghidra high P-code preserve enough vulnerability relevant information for a lightweight model, like BLSTM, to classify vulnerable/non-vulnerable binary functions?

## Objective 1: Build the P-code Extraction Pipeline
Extract high P-code from compiled binaries using Ghidra headless analysis. We will have to determine which P-code is worth extracting.

## Objective 2: Normalize and Tokenize P-code
Normalize addresses, constants, registers, temporaroes, and varnodes so that the model learns vulnerability relevant patterns instead of irrelevant binary specific details.

## Objective 3: Train Lightweight Baseline Model
Train a BLSTM, or other similar sequence model on tokenized P-code. If prefered, we could try even more lightweight models like logistic regression or 1D CNN.

## Objetive 4: Evaluate Detection Performance
Eval using accuracy, precision, recall, F1-score, and confusion matrix.

## Objective 5: Analyze Generalization
If time allows, test whether mdoel generalizes across settings, optimizationl levels, or architecture.

