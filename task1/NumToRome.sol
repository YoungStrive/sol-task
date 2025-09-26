// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;


contract task1_4{

         string  [] strArray;
         //位置的map
         mapping(string localStr=>string romeStr) refMap;
    function changeNum(uint _num) public  returns (string memory result){
        uint q= _num/1000;
        uint b= (_num%1000)/100;
        uint s= (_num%100)/10;
        uint g= (_num%10);
        //千位有值
        if(q!=0){
           for(uint i=0; i<q; i++){
                strArray.push("M");
           }
        }
        //百
        if(b>=5){
             if(b==9){
                strArray.push("MD");
             }else{ 
                strArray.push("D");
                for(uint i=0;i<b-5;i++ ){
                    strArray.push("C");
                }
             }
        }else{
            if(b==4){
                strArray.push("DC");
            }else{
                for(uint i=0;i<b;i++){
                    strArray.push("c");
                }
            }
        }

        //十
       if(s>=5){
            if(s==9){
                strArray.push("CX");
             }else{ 
                strArray.push("L");
                for(uint i=0;i<s-5;i++ ){
                    strArray.push("X");
                }
             }
       }else{
         if(s==4){
                strArray.push("LX");
            }else{
                for(uint i=0;i<s;i++){
                    strArray.push("X");
                }
            }
       }

       //个

    if(g>=5){
         if(g==9){
                strArray.push("XI");
             }else{ 
                strArray.push("V");
                for(uint i=0;i<g-5;i++ ){
                    strArray.push("I");
                }
             }
             
        }else{     
        if(g==4){
                strArray.push("VI");
            }else{
                for(uint i=0;i<g;i++){
                    strArray.push("I");
                }
            }
       }
       return strArray[0];
    }



    // 处理数据
    function handl(uint num,string memory statusFlag, string[]  memory strArray) private {
        refMap["G"]="I";
        refMap["G4"]="VI";
        refMap["G5"]="V";
        refMap["G9"]="XI";
        refMap["S"]="X";
        refMap["S4"]="LX";
        refMap["S5"]="L";
        refMap["S9"]="CX";
        refMap["B"]="C";
        refMap["B4"]="DC";
        refMap["B5"]="D";
        refMap["B9"]="MB";
         //大于等于5
         if(num>=5){
             if(num==9){
                 string memory strFlag = statusFlag.c"9";  
             }

         }

    }

}
