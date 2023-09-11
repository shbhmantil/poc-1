// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import { Test, console } from "forge-std/Test.sol";

contract Poc {

    function test_normal_deposit() public {
        uint256 totalSupply = 2000;
        uint256 assetsAum = 1000;
        uint256 depositAmount = 20;
        uint256 normallpTokens; 
        uint256 miscalculatedlpTokens;
        uint256 calculatedShares; 
        uint256 receivedSharesLM;
        uint256 adjustedDecimals = 12;

        console.log(" ");
        console.log("=====================================================");

        calculatedShares = (depositAmount * totalSupply) / assetsAum;
        console.log("shares calculated for LoanManager.sol contract before calling deposit function: ", calculatedShares);

        normallpTokens = calculatedShares * 10 ** adjustedDecimals;
        console.log("nstbl hub should receive these lptokens based on above calculated shares: ", normallpTokens / 10e12);

        console.log("=====================================================");
        console.log(" ");

        console.log("Now nstbl hub deposited the same amount, but at that point of time the AUM was increased, so it will effect the");
        console.log("shares that LoanManager will be receiving and because the lptokens are calculated based on above number,");
        console.log("so lptokens received by nstbl hub will be less"); 
        console.log(" ");
        console.log("=====================================================");

        receivedSharesLM = (depositAmount * totalSupply) / assetsAum + 100;
        console.log("shares received in LoanManager.sol contract if AUM increased by 100: ", receivedSharesLM);

        miscalculatedlpTokens = calculatedShares * 10 ** adjustedDecimals;
        console.log("lptokens received by nstblhub contract based on before calculated shares: ", miscalculatedlpTokens / 10e12);

        console.log("LP tokens that the nstbl hub contract should receive: ", (receivedSharesLM * 10 ** adjustedDecimals) / 10e12);

        console.log("=====================================================");
        console.log(" ");
    } 

    //function test_returns_shares() external returns (uint256 _shares ) {
    //    return _shares = 100;
    //}

    //function test_print() external {
    //    console.log("in the poc contract");
    //    //console.log("amount: ", test_returns_shares());
    //}

    
    
}