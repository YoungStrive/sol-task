// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;


contract task1_5{
    
     mapping(uint _num=> uint _numCount) numMap;

    function mergeSort()  public   returns( uint[] memory) {
         uint8 [4]  memory _arr1= [1,2,3,4];
         uint8 [4]  memory _arr2= [3,4,5,6];
         uint [] memory _resultArr = new uint[](10);
         uint8 _flagNum;
         for(uint i=0;i < _arr1.length; i++){
            uint _arr1Num= _arr1[i];
            uint numCount = numMap[_arr1Num];
            numMap[_arr1Num] = numCount+1;
            //表示之前没有就合并
            if(numCount==0){
                _resultArr[_flagNum] =_arr1Num;
                _flagNum++;
            }
         }

        for(uint i=0 ; i < _arr2.length; i++){
            uint _arr2Num= _arr2[i];
            uint numCount= numMap[_arr2Num];
            numMap[_arr2[i]]=numCount+1;
            if(numCount==0){
               _resultArr[_flagNum] =_arr2Num;
                _flagNum++;

            }
           
         }

         return _resultArr;

    }

    
}
