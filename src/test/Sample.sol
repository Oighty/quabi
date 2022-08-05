/// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity >=0.8.0;

contract Sample {
    uint256 dummy;

    modifier modded() {
        require(dummy >= 0);
        _;
    }

    modifier transformed(uint256 _inc) {
        _;
        dummy += _inc;
    }

    function one(uint256 _dummy) public {
        dummy = _dummy;
    }

    function two() public view returns (uint256) {
        return dummy;
    }

    function three(uint256 _dummy, uint256 _inc)
        public
        modded
        transformed(_inc)
    {
        dummy = _dummy;
    }

    function four() public view modded returns (uint256) {
        return dummy;
    }
}