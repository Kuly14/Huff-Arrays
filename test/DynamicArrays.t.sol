// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";

contract SimpleStoreTest is Test {
    /// @dev Address of the SimpleStore contract.
    DynamicArray public arr;

    /// @dev Setup the testing environment.

    function setUp() public {
        arr = DynamicArray(HuffDeployer.deploy("DynamicArray"));
    }

    function testLength() public {
        uint x = arr.length();
        assertEq(x, 0x00);
    }

    function testPush() public {
        bytes4 selector = bytes4(keccak256("push()"));

        bytes memory data = abi.encodeWithSelector(selector, address(this));

        (bool success, bytes memory returnData) = address(arr).call(data);

        // IN PROGRESS
    }
}

interface DynamicArray {
    function push() external;

    function popLast() external;

    function show(uint256) external view returns (bytes32);

    function length() external view returns (uint256);
}
