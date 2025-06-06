// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import { IERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

interface IStreamRewarder {

    function totalStaked() external view returns (uint256);

    function balanceOf(address account) external view returns (uint256);

    function rewardPerToken(address token) external view returns (uint256);

    function rewardTokenInfos()
        external
        view
        returns (address[] memory bonusTokenAddresses, string[] memory bonusTokenSymbols);

    function earned(address account, address token) external view returns (uint256);

    function allEarned(
        address account
    ) external view returns (uint256[] memory pendingBonusRewards);

    function queueNewRewards(uint256 _rewards, address token) external returns (bool);

    function getReward(address _account, address _receiver) external returns (bool);

    function getRewards(
        address _account,
        address _receiver,
        address[] memory _rewardTokens
    ) external;

    function updateFor(address account) external;

    function initialize(address _masterCakepie, address _rewardQueuer, address _receiptToken, uint256 _duration) external;   

    function updateRewardQueuer(address _rewardManager, bool _allowed) external;
}
