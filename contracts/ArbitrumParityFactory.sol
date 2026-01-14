// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title Arbitrum Parity Factory
 * @author Crescent Host
 * @notice Canonical CREATE2 factory for deterministic deployment across
 *         Arbitrum EVM and Stylus (Wasm) environments.
 * @dev Prototype implementation.
 */
contract ArbitrumParityFactory {
    event Deployed(address indexed addr, bytes32 salt);

    /**
     * @notice Deploys a contract using CREATE2
     * @param salt The deterministic salt (must be identical across chains)
     * @param bytecode The contract creation bytecode
     */
    function deploy(bytes32 salt, bytes memory bytecode) external returns (address addr) {
        require(bytecode.length > 0, "Bytecode is empty");

        assembly {
            addr := create2(0, add(bytecode, 0x20), mload(bytecode), salt)
            if iszero(extcodesize(addr)) {
                revert(0, 0)
            }
        }

        emit Deployed(addr, salt);
    }

    /**
     * @notice Computes the address for a CREATE2 deployment
     */
    function computeAddress(bytes32 salt, bytes memory bytecode) external view returns (address) {
        bytes32 hash = keccak256(
            abi.encodePacked(
                bytes1(0xff),
                address(this),
                salt,
                keccak256(bytecode)
            )
        );
        return address(uint160(uint256(hash)));
    }
}
