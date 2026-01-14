# Arbitrum Parity Factory

Canonical deterministic deployment infrastructure for Arbitrum EVM and Stylus (Wasm).

## Overview
 
The Arbitrum Parity Factory is a CREATE2-based deployment primitive that guarantees
**identical smart contract addresses across EVM and Stylus environments**, eliminating
address drift between:

- Arbitrum One
- Arbitrum Nova
- Stylus (Wasm)
- Orbit / L3 chains

This repository contains an early prototype of the Parity Factory smart contract.
Production hardening, Stylus integration, SDKs, and tooling are funded via an
Arbitrum Developer Tooling grant proposal.

## Why This Exists

Existing deterministic deployment tools only support EVM-to-EVM parity.
They break when introducing Stylus due to different init-code semantics.

The Parity Factory solves this by:
- Abstracting EVM vs Stylus init-code differences
- Using a universal salt derivation scheme
- Guaranteeing mathematically identical CREATE2 addresses across execution environments

## Current Status

 **Prototype / Early Implementation**

- Core CREATE2 factory contract implemented
- Deterministic address derivation logic in place
- Repository reflects pre-production state

## Planned Milestones

- Canonical factory deployment on Arbitrum One, Nova, and Stylus
- Stylus Rust SDK adapter
- CLI tooling (`arb-parity`)
- Public documentation (“Zero-to-Parity”)

## License

MIT
