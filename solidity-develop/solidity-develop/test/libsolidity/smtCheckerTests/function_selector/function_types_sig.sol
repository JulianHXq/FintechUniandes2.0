contract C {
    uint256 public x;

    function f() public pure returns (bytes4) {
        return this.f.selector;
    }

    function g() public view returns (bytes4) {
        function () pure external returns (bytes4) fun = this.f;
        return fun.selector;
    }

    function i() public pure returns (bytes4) {
        return this.x.selector;
    }

    function check() public view {
        assert(f() == 0x26121ff0);
        assert(g() == 0x26121ff0);
        assert(i() == 0x0c55699c);
        assert(i() == 0x26121ff0);
    }
}
// ====
// SMTEngine: all
// ----
// Warning 7650: (251-263): Assertion checker does not yet support this expression.
// Warning 6328: (437-462): CHC: Assertion violation happens here.
// Warning 6328: (507-532): CHC: Assertion violation happens here.
// Info 1391: CHC: 2 verification condition(s) proved safe! Enable the model checker option "show proved safe" to see all of them.
