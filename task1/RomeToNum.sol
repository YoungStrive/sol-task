// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Task1_3{

     //定义一个映射
     mapping(bytes32 rome => uint16 num)  private  romeNumMap;
     //构造函数初始化映射
     constructor() {
        romeNumMap["I"]=1;
        romeNumMap["V"]=5;
        romeNumMap["X"]=10;
        romeNumMap["L"]=50;
        romeNumMap["C"]=100;
        romeNumMap["D"]=500;
        romeNumMap["M"]=1000;
      }

   function  ChangeRomeNum( string memory _input) public  view  returns (uint){
      // 将string 转 bytes
      bytes memory romeBytes =  bytes(_input);
      uint size = romeBytes.length;
      uint sum = 0;
      for(uint i = 0; i<size;){
            // 获取当前字符的数值
            uint current = romeNumMap[romeBytes[i]];
            if (i + 1 < size) {
                uint next = romeNumMap[romeBytes[i + 1]];
                if (current < next) {
                    sum += (next - current);
                    i += 2; 
                    continue;
                }
            } 
              
            // 普通加
            sum += current;
            i += 1;
         }
      
         return sum;

   
   }
}
