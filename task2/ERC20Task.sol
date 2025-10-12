// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract SimpleErc20{
    
    //代币符号
    string private symbol; 
   
    //代币名称
    string private symbolName; 

    //小数位   
    uint8 private  constant decimals = 18;

    //总共的币量
    uint256 private totalSupply;

    //定义map  存储账户地址 余额
    mapping (address account=> uint256 accountBalance ) private _balances;


    //某个账号地址 给了那些地址多少代币的 map
    mapping(address account => mapping(address spender => uint256)) private _allowances;

    // 代币转移事件 indexed 关键字表示可以用这个字段做筛选查询 在日志上
    event Transfer(address indexed from, address indexed to, uint256 value);

    //from授权给 to 一定的代币
    event Approval(address indexed from,address indexed to,uint256 value);



    //构造函数 initToken 初始值
    constructor(string memory _symbol,string memory _symbolName,uint256 initToken){
        symbol = _symbol;
        symbolName = _symbolName;
         if (initToken > 0) {
            uint256 ammount = initToken * 10 ** uint256(decimals);
            _mint(msg.sender, ammount);
        }

    }
    //自定义错误
   error InsufficientBalance(address _address);

   // 自定义修饰符，检查余额是否足够
    modifier hasSufficientBalance(address from, uint256 amount) {
        if(_balances[from] <= amount){
          revert InsufficientBalance(from);
        }       
        _;
    }


    //查询用户余额
    function balanceOf(address _address) public  view returns (uint256) {
        return _balances[_address];
    }

    //查询总的代币
    function getTotalSupply() public view returns (uint256) {
        return totalSupply;
    }

    // 授权给账户spender金额数量amount
    function approve(address _spender, uint256 _value) public returns (bool) {
        _approve(msg.sender, _spender, _value);
        return true;
    }


    //转账
    function transfer(address _toAddress,uint256 value) public  returns (bool){
        address _fromAddress= msg.sender;
        _update(_fromAddress, _toAddress, value);
        return true;

    }

     //代扣转账
    function transferFrom(address from, address to, uint256 value) public returns (bool) {
        address spender = msg.sender;
        _spendAllowance(from, spender, value);
        //转账
        _update(from, to, value);
        return true;
    }


  

    //增发代币
    function _mint(address to, uint256 amount) internal {
        //不满足条件 才会 require 
        require(to != address(0), "mint to zero");
        _balances[to] += amount;
        totalSupply += amount;
        emit Transfer(address(0), to, amount);
    }

    //公共改变账户 金额
    function _update(address from ,address to, uint256 value) internal  hasSufficientBalance(from,value) {
        require(from != address(0),"approve from zero");
        require(to != address(0),"approve from zero");
        _balances[from] -= value;
        _balances[to] += value;
        //日志的执行
        emit Transfer(from, to, value);
    }

    function _approve(address _owner ,address spender, uint256 amount) internal {
        require(_owner != address(0), "approve from zero");
        require(spender != address(0), "approve to zero");
        _allowances[_owner][spender] = amount;

        emit Approval(_owner, spender, amount);
    }


      // 花费之后要减掉授权金额 代扣转账
    function _spendAllowance(address _owner, address spender, uint256 amount) internal {
        uint256 currentAllowance = _allowances[_owner][spender];
        require(currentAllowance >= amount, "allowance insufficient");
        _approve(_owner, spender, currentAllowance - amount);
    }
}

    


    


