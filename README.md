# Quabi

A Solidity library for querying contract ABI data using Foundry's `ffi` cheatcode in Forge Tests and Scripts.

## Roadmap
- [X] Function selectors
- [X] Functions selectors that have a specific modifier
- [ ] Errors
- [ ] Events
- [ ] State Variables
- [ ] Others?

## Getting Started

Install in your forge project
```
forge install https://github.com/Oighty/quabi
```

Import Quabi and use it in your tests
```
import {Quabi} from "lib/quabi/src/Quabi.sol";
...
contract MyTest is Test {
   
  ContractToTest internal testme;
  ...
  
  bytes4[] memory selectors = Quabi.getFunctions(type(ContractToTest).name);
  bytes4[] memory authSelectors = Quabi.getFunctionsWithModifier(type(ContractToTest).name, "requiresAuth");
  
  ...
  
}
```

Run your test file with the `--ffi` and `--ast` flags. `--ffi` enables external function calls and `--ast` tells forge to include the AST (which Quabi queries) in the compiler output.
```
forge test --ast --ffi --match-contract MyTest
```

## Acknowledgement

This project was conceived while developing some testing utilities for [OlympusDAO](https://github.com/OlympusDAO).

The project is inspired by [Surl](https://github.com/memester-xyz/surl) and leveraged some of their ideas on preparing shell commands within Solidity.

