import { ethers } from "hardhat";
import { NFTMarketplace } from "../typechain";

async function main() {
  const contractAddress = "Your NFT Contract address"; // Replace with your deployed contract address
  const [deployer] = await ethers.getSigners();

  const nftMarketplace: NFTMarketplace = await ethers.getContractAt(
    "NFT",
    contractAddress,
    deployer
  );

  const tx = await nftMarketplace.createNFT("<your ipfs gateway url>");
  console.log("Transaction sent, waiting for confirmation...");
  await tx.wait();

  console.log("NFT created successfully!");
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
