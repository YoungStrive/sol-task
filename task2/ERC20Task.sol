// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract toHy {

    //获取地址余额
    function balanceOf(address account) public view  returns (uint256) {
        return account.balance;
    }


    //转账
    function transfer(address to, uint256 value) public    returns (bool) {
        //调用者地址
        address from = msg.sender;

        // 金额小于或者等于0 
        require(value<=0,"value mast gt 0");
        
        if (from == address(0)) {
             revert ("forom address not exist");
        }
        //转入的地址 不能为空
        if (to == address(0)) {
            revert("to address not exist");
        }
        //余额不足 转账
        if(from.balance<value){
          revert("forom address  balance insufficient");
        }

        (bool success, ) = payable(to).call{value: value}(""); 
        require(success,"transfer failed"); 
        return true;

   }
}

//来源
contract fromHy{
   
   //收款
   receive() external payable {}

   function depositCall() external{
        (bool success, ) = payable(msg.sender).call{value: 1 ether}("");
        require(success,"transfer failed");
        
   }



}
