const MyColorToken = artifacts.require("ColorToken");

module.exports = function(deployer){
    deployer.deploy(MyColorToken);
}