#!/bin/bash

BASEDIR=$(dirname "$0")
SNARKJS=$BASEDIR/../node_modules/.bin/snarkjs
R1CSFILE=$BASEDIR/../artifacts-circuits/circuit.r1cs
PTAU=$BASEDIR/../setup/powersOfTau28_hez_final_10.ptau
SETUPDIR=$BASEDIR/../setup

$SNARKJS zkey new $R1CSFILE $PTAU $SETUPDIR/circuit_0000.zkey
$SNARKJS zkey contribute $SETUPDIR/circuit_0000.zkey $SETUPDIR/circuit_final.zkey
$SNARKJS zkey export verificationkey $SETUPDIR/circuit_final.zkey $SETUPDIR/verification_key.json
