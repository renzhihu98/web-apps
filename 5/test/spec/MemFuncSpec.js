/*
* This is the file which will call our MemoryAC.js
*
* Each describe block is equivalent to one test case
*
* Created 3/20/19 by Anna Yu
*
*/

//Created and Edited 3/21/19 by Anna Yu: testing all memory functions
describe("MemoryFunctionTests", function() {

    //Created and edited 3/21/19 by Anna Yu: testing adding mem functions
    describe("AddToMem",function () {
        it('should return 15 at end', function () {
            calcVals.cur='5';
            memory.value=0;
            expect(memory.add()).toEqual(5);
            expect(memory.add()).toEqual(10);
            expect(memory.add()).toEqual(15);
        });
        it('should return -15 at end', function () {
            calcVals.cur='-5';
            memory.value=0;
            expect(memory.add()).toEqual(-5);
            expect(memory.add()).toEqual(-10);
            expect(memory.add()).toEqual(-15);
        });
        it('should return 0 = 0+3-3', function () {
            calcVals.cur='3';
            memory.value=0;
            expect(memory.add()).toEqual(3);
            calcVals.cur = '-3'
            expect(memory.add()).toEqual(0);
        });
        it('should return 9 = 0+3.5+3.5+3.5-1.5', function () {
            calcVals.cur='3.5';
            memory.value=0;
            expect(memory.add()).toEqual(3.5);
            expect(memory.add()).toEqual(7);
            expect(memory.add()).toEqual(10.5);
            calcVals.cur='-1.5';
            expect(memory.add()).toEqual(9);
        });

    });
    //Created and edited 3/21/19 by Anna Yu: testing minus mem functions
    describe("SubtractMem",function () {
        it('should be 10 = 15-5 at end', function () {
            memory.value=15;
            calcVals.cur='5';
            expect(memory.minus()).toEqual(10);
        });
        it('should be 0 = -15--15', function () {
            memory.value=-15;
            calcVals.cur='-15';
            expect(memory.minus()).toEqual(0);
        });
        it('should be 1 = 9.5-8.5', function () {
            memory.value=9.5;
            calcVals.cur='8.5';
            expect(memory.minus()).toEqual(1);
        });
        it('should be 0 = 9-3-6', function () {
            memory.value=9;
            calcVals.cur='3';
            expect(memory.minus()).toEqual(6);
            calcVals.cur='6';
            expect(memory.minus()).toEqual(0);

        });

    });
    //Created and edited 3/21/19 by Anna Yu: testing clear mem functions
    describe("ClearMemTest",function () {
        it("should be 0 from 20.56",function () {
            memory.value=20.56;
            expect(memory.clear()).toEqual(0);
        });
        it("should be 0 from -5",function () {
            memory.value=-5;
            expect(memory.clear()).toEqual(0);
        });

    });
    //Created and edited 3/21/19 by Anna Yu: testing retrieve mem functions
    describe("RetrieveMemTest", function () {
        it('should be 5', function () {
            memory.value=5;
            memory.retrieve();
            expect(calcVals.cur).toEqual("5");
        });
        it('should be 5.5', function () {
            memory.value=5.5;
            memory.retrieve();
            expect(calcVals.cur).toEqual("5.5");
        });
        it('should be -5.05', function () {
            memory.value=-5.05;
            memory.retrieve(); 
            expect(calcVals.cur).toEqual("-5.05");
        });
    });

});
