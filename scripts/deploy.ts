import { ethers } from "hardhat";

async function main() {
  const nftContract = await ethers.getContractFactory("NFT");
  const [deployer] = await ethers.getSigners();
  const deployedNftContract = await nftContract.deploy(deployer.address);

  console.log(
    "NFT contract deployed to:",
    await deployedNftContract.getAddress()
  );
}
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
