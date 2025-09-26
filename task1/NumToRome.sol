// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;


contract task1_4{

         //位置的map
      mapping(string localStr=>string romeStr) refMap;
      constructor() {
        refMap["G"]="I";
        refMap["G4"]="IV";
        refMap["G5"]="V";
        refMap["G9"]="IX";
        refMap["S"]="X";
        refMap["S4"]="XL";
        refMap["S5"]="L";
        refMap["S9"]="XC";
        refMap["B"]="C";
        refMap["B4"]="C";
        refMap["B5"]="D";
        refMap["B9"]="CM";
      }
   
   string []  strArray;
    function changeNum(uint _num) public  returns(string memory){
        uint q= _num/1000;
        uint b= (_num%1000)/100;
        uint s= (_num%100)/10;
        uint g= (_num%10);
        //千位有值
        if(q!=0 ){
           for(uint i=0; i<q; i++){
                strArray.push("M");
           }
        }
        if(b!=0){
            handl(b,"B");
        }
        if(s!=0){
            handl(s,"S");
        }
        if(g!=0){
            handl(g,"G");
        }
        string memory resultStr;
        for(uint i=0;i<strArray.length; i++){
            resultStr = strConcat(resultStr,strArray[i]);
        }
         //清空数组
        while (strArray.length==0){
            strArray.pop();
        }

      
      return resultStr;
    }



    // 处理数据
    function handl(uint num,string memory statusFlag) private {
   
         //大于等于5
         if(num>=5){
            //等于9 获取特殊的
             if(num==9){
                 string memory strFlag = strConcat(statusFlag,"9");
                 strArray.push(refMap[strFlag]);
             }else{
               string memory strFlag5 = strConcat(statusFlag,"5");
               strArray.push(refMap[strFlag5]);
               for(uint  i=0;i<num-5;i++){
                  strArray.push(refMap[statusFlag]);
               }
             }
         }else{
           //那就是小于五的
           if(num==4){
               string memory strFlag4 = strConcat(statusFlag,"4");
               strArray.push(refMap[strFlag4]);
           }else{
                for(uint i=0; i<num; i++){
                    strArray.push(refMap[statusFlag]);
                }
           }

         }

    }


    function strConcat(string memory a,string memory b) private  pure  returns (string memory){
        bytes memory ba =  bytes(a);

        bytes memory bb = bytes(b);
    
        bytes memory result  =bytes.concat(ba,bb);
        return string(result);

    }

}
