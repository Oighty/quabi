// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity >=0.8.0;

import {Test} from "forge-std/Test.sol";
import {Quabi} from "src/Quabi.sol";
import {Sample} from "src/test/Sample.sol";

contract QuabiTest is Test {
    function testCorrectness_parseFunctions() public {
        bytes4[] memory allFunctions = Quabi.getFunctions(type(Sample).name);

        assert(allFunctions.length == 4);
        assert(allFunctions[0] == Sample.one.selector);
        assert(allFunctions[1] == Sample.two.selector);
        assert(allFunctions[2] == Sample.three.selector);
        assert(allFunctions[3] == Sample.four.selector);
    }

    function testCorrectness_parseFunctionsWithModifier() public {
        bytes4[] memory moddedFunctions = Quabi.getFunctionsWithModifier(
            type(Sample).name,
            "modded"
        );

        assert(moddedFunctions.length == 2);
        assert(moddedFunctions[0] == Sample.three.selector);
        assert(moddedFunctions[1] == Sample.four.selector);

        bytes4[] memory transformedFunctions = Quabi.getFunctionsWithModifier(
            type(Sample).name,
            "transformed"
        );

        assert(transformedFunctions.length == 1);
        assert(transformedFunctions[0] == Sample.three.selector);
    }
}
