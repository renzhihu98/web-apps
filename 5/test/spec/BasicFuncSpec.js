/*
* This is the file which will call our java script file that need to be tested.
* Each describe block is equivalent to one test case
*
* Created 3/21/19 by Leslie Zhou
* Tests for basicfunc.js
*/

describe("BasicFuncTests", function() {
    // Created 3/21/19 by Leslie Zhou, exp function
    describe("Tests", function() {
        it ("common cases", function() {
            calcVals.cur = "2";
            calcVals.prev="4";
            calcVals.op="exp"
            opsDisplay();
            expect(calcVals.cur).toBe("16");
        });
        it("edge cases", function() {
            calcVals.cur = "-2";
            calcVals.prev="4";
            calcVals.op="exp"
            opsDisplay();
            expect(calcVals.cur).toBe("0.0625");
        });
        it("common cases", function() {
            calcVals.cur = "1";
            calcVals.prev="1";
            calcVals.op="+"
            opsDisplay();
            expect(calcVals.cur).toBe("2");
        });
        it("common cases", function() {
            calcVals.cur = "3";
            calcVals.prev="1";
            calcVals.op="-"
            opsDisplay();
            expect(calcVals.cur).toBe("-2");
        });
        it("common cases", function() {
            calcVals.cur = "2";
            calcVals.prev="4";
            calcVals.op="*"
            opsDisplay();
            expect(calcVals.cur).toBe("8");
        });
        it("common cases", function() {
            calcVals.cur = "4";
            calcVals.prev="4";
            calcVals.op="/"
            opsDisplay();
            expect(calcVals.cur).toBe("1");
        });
    });
});