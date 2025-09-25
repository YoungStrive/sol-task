// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;


contract VotingTask{

    mapping(string name => uint16 voteNum) private  voteNumMap;

    string []  private nameArry;

    //给用户投票
    function vote(string memory name) public  {
        nameArry.push(name);
        uint16 num= voteNumMap[name];
        num += 1;
        voteNumMap[name] = num;

    }  

    //获取用户的投票数
    function getVote(string memory name) public   view  returns (uint16){
        return voteNumMap[name];

    }


    //重置map的用户的票数
    function resetVotes() public    {
        uint arrSize = nameArry.length;
        
        for(uint i = 0; i< arrSize; i++){
        
           delete voteNumMap[nameArry[i]];
        }     

    }


}
