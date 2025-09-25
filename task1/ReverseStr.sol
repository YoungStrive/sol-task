// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract  task1_2{

  

    function  getReverse(string memory str)  public pure  returns (string memory){

        bytes memory bs = bytes(str);
        uint   bsSize = bs.length;
        bytes  memory reverseBys = new bytes(bsSize);
        uint j = 0; 
        for(uint i = bsSize; i>0; i--){
            reverseBys[j] = bs[i-1];
            j++;
        }
        return string(reverseBys);

   }


}
