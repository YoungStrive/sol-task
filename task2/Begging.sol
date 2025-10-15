// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "@openzeppelin/contracts/access/Ownable.sol";

contract BeggingContract is Ownable{
    
    // 定义一个map 保存捐献者 地址 以及对应金额
    mapping (address donate=> uint256 donateAmount ) private _donateMap;

    //捐献者的地址
    address[]  private  _donateAddress;

    event Donation (address indexed donate,uint256 donateAmount);

    // 构造函数设置合约所有者
    constructor() Ownable(msg.sender) {}

    //收款
    receive() external payable {
        donate();
    }

   //捐献金额
   function donate () public  payable   {
        require(msg.value > 0, "Donation amount must be greater 0");
        _donateMap[msg.sender] += msg.value;
        //添加捐献者的地址
        _donateAddress.push(msg.sender);
        //日志的执行
        emit Donation(msg.sender, msg.value);
   }

    // 把合约账户的金额全部取走
    function withdraw() public onlyOwner {
        uint256 balance = address(this).balance;
        require(balance > 0, "balance must be greater  0");
        // 使用 transfer 发送资金
        payable(owner()).transfer(balance);
    }


    //获取捐赠者的金额
    function getDonation(address _donate) public  view returns (uint256){
        return _donateMap[_donate];

    }

    // 获取合约余额
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
    
    //获取捐献金额 最多的地址
    function getTop3Donate() public view  returns (  address[] memory){
        address [] memory _top3Donate;

        uint addressLen=_donateAddress.length;

        for(uint256 i = 0; i < addressLen ; i++){
            if(_donateMap[_donateAddress[i]] > _donateMap[_donateAddress[i+1]]){
                    _top3Donate.push(_donateAddress[i]);
            }
                

            
        }

        return _top3Donate;

    }



}
