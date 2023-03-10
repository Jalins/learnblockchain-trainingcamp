# Hardhat

### 1.初始化项目

创建一个空文件夹，执行如下命令：

```shell
npm init
npx hardhat init
```

安装依赖

```shell
npm install --save-dev "hardhat@^2.13.0" "@nomicfoundation/hardhat-toolbox@^2.0.0"
```

@nomicfoundation/hardhat-toolbox是一个 Hardhat 插件,包含了一些有用的功能，如合约调用、签名和解析、生成合约接口等，可以减少开发者的重复性工作。

### 2.启动hardhat节点

```shell
npx hardhat node
```

该命令会启动一个本地的区块链节点，功能与ganache类似，并自动创建十个测试账户


### 3.测试合约

```shell
npx hardhat test
```


### 4.编译部署合约

```shell
npx hardhat compile
npx hardhat run scripts/deploy.js
```


### 5.验证合约（其他区块链网络操作类似）

* 5.1需要将合约部署到某个网络中，这里使用goerli测试网，到etherscan网站上创建一个api密钥并进行配置；

  ```shell
  etherscan: {
      apiKey: {
        goerli: 'your API key'
      }
    }
  ```
* 5.2安装插件并进行配置

  ```
  npm install --save-dev @nomiclabs/hardhat-etherscan

  # 在hardhat.config.js文件中进行配置
  require("@nomiclabs/hardhat-etherscan");
  ```
* 5.3注册alchemy，并获取goerli网络节点的链接，其次需要在钱包（如metamask）导出自己的账户私钥；
* 5.4在hardhat.config.js文件中配置

  ```javascript
  const ALCHEMY_API_KEY = "KEY";

  const GOERLI_PRIVATE_KEY = "YOUR GOERLI PRIVATE KEY";

  module.exports = {

    networks: {
      goerli: {
        url: `https://eth-goerli.alchemyapi.io/v2/${ALCHEMY_API_KEY}`,
        accounts: [GOERLI_PRIVATE_KEY],
      },
    },
  };
  ```
* 5.5指定goerli网络部署

  ```shell
  npx hardhat run scripts/deploy.js --network goerli
  ```
* 5.6验证合约

  ```shell
  npx hardhat verify --network goerli <contractaddress> <参数>
  ```

  这条命令要先验证网络是否通畅，否则会出现timeout的情况，解决方案是在命令窗口挂代理 `export https_proxy=http://127.0.0.1:7890;export http_proxy=http://127.0.0.1:7890`



---

# Foundry
