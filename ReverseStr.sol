// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract  task1_2{

  

    function  getReverse(string memory str)  pure  public  returns (string memory){

        bytes memory bs = bytes(str);
       
        uint   bsSize = bs.length;

        bytes  memory reverseBys=new bytes(bs.length);

        for(uint i=bsSize-1; i<=0;i--){
            uint j=bsSize-i-1 ;   
            reverseBys[j] = bs[i];
           
        }
        return string(reverseBys);

   }


}
