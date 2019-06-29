/**
 * File Created by Celia Tang
 * contains all tests for filler buttons
 */
describe("Filler Tests", function() {
    // Created by Celia Tang 3/21/19, checks backspace function
    describe("Backspace Tests", function() {
        it ("is correct on normal values", function() {
            calcVals.cur = "12345";
            backspace();
            expect(calcVals.cur).toBe("1234");
            backspace();
            expect(calcVals.cur).toBe("123");
            backspace();
            expect(calcVals.cur).toBe("12");
        });
        it("is correct on edge cases", function() {
            calcVals.cur = "9";
            backspace();
            expect(calcVals.cur).toBe("");
            backspace();
            expect(calcVals.cur).toBe("");
        });
    });

    // Created by Renzhi Hu 3/21/19
    describe("Sqrt Tests", function(){
        it("is the correct sqrt", function(){
            calcVals.cur = "100";
            sqrt();
            expect(calcVals.cur).toEqual("10");
            sqrt();
            expect(calcVals.cur).toEqual("3.162277660")
        });

        it("is correct for negative number"), function(){
            calcVals.cur = "-100";
            sqrt();
            expect(calcVals.cur).toEqual("-100");
            sqrt();
            expect(calcVals.cur).toEqual("-100");
        }
    });
});