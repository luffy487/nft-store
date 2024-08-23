//SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Script} from "forge-std/Script.sol";
import {NFT} from "../src/NFT.sol";

contract DeployNFT is Script {
    function run() public {
        address owner = 0x02e3722C7287F5C5cE778f37dc1b60D5a42a2572;
        vm.startBroadcast();
        NFT nft = new NFT(owner);
        vm.stopBroadcast();
    }
}