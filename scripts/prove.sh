#!/bin/bash

BASEDIR=$(dirname "$0")
SETUPDIR=$BASEDIR/../setup
INPUTDIR=$BASEDIR/../input
PROOFDIR=$BASEDIR/../proof
SNARKJS=$BASEDIR/../node_modules/.bin/snarkjs
WASMFILE=$BASEDIR/../artifacts-circuits/circuit.wasm

$SNARKJS wtns calculate $WASMFILE $INPUTDIR/input.json $INPUTDIR/witness.wtns
$SNARKJS groth16 prove $SETUPDIR/circuit_final.zkey $INPUTDIR/witness.wtns $PROOFDIR/proof.json $PROOFDIR/public.json
