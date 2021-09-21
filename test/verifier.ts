import { expect } from "chai";
import { ethers } from "hardhat";
import { Signer, Contract, BigNumber } from "ethers";
import proof from "../proof/proof.json";
import proofPublic from "../proof/public.json";

describe("Verifier", function () {
  let verifier: Contract

  beforeEach(async function () {
    const VerifierFactory = await ethers.getContractFactory("Verifier");
    verifier = await VerifierFactory.deploy();
  });

  it("verify by contract", async function () {
    const result = await verifier.verifyProof(
      [proof.pi_a[0], proof.pi_a[1]],
      [[proof.pi_b[0][1], proof.pi_b[0][0]], [proof.pi_b[1][1], proof.pi_b[1][0]]],
      [proof.pi_c[0], proof.pi_c[1]],
      proofPublic
    )
    expect(result).to.equal(true);
  });
});
