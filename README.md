# Arbitrum Parity Factory

Canonical deterministic deployment infrastructure for Arbitrum EVM and Stylus (Wasm).

## Overview

The Arbitrum Parity Factory is a CREATE2-based smart contract factory that enables
developers to deploy contracts to **identical addresses** across:

- Arbitrum One
- Arbitrum Nova
- Stylus (Wasm) environments
- Orbit / L3 chains

This eliminates address drift between EVM and Stylus deployments and simplifies
cross-chain configuration, governance, and tooling.

## Problem

Existing deployment tooling supports deterministic addresses only within EVM.
When introducing Stylus (Wasm), address parity breaks due to different
initialization mechanics.

## Solution

This repository provides a canonical factory contract that:

- Abstracts EVM vs Wasm init-code differences
- Produces mathematically deterministic CREATE2 addresses
- Requires no per-chain configuration

## Status

 **Prototype / Early Implementation**

This repository currently contains the core factory contract.
Upcoming work includes:

- Stylus Rust SDK adapter
- CLI tooling for deterministic salt derivation
- Public documentation and examples

## Repository Structure

```text
contracts/
 └─ ArbitrumParityFactory.sol
