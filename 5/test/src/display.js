// Created 3/17/2019 by Renzhi Hu //
// Edited 3/19/2019 by Renzhi Hu //
// Edited by Celia Tang 3/21/19 changed numArr to calcVals and all calls to numArr
// Edited 3/21/19 by Anna Yu added case for sign function.

var calcVals = {
    prev: "0", op: "0", cur: "0", prevAttr: "0"
};

//Number Keys
var nums = document.getElementsByClassName('number');
for (var i = 0; i < nums.length; i++){
    nums[i].addEventListener('click', numDisplay);
}

// created by Renzhi Hu 3/18/2019
// edited by Renzhi Hu 3/20/2019
// display the number on the display area
// edited by Celia Tang 3/21/19: resets the display when entering second num, updates calcVals.prevAttr
// edited 3/21/19 by Anna Yu: added case for -0(num) to remove leading -0.
function numDisplay(){

    // reset display when entering second number
    if (calcVals.prev === calcVals.cur && calcVals.op !== "0") {
        calcVals.cur = "0";
    }
    // stop pushing when the there are 19 digits
    if (calcVals.cur.length < 19){
        if ((this.value === "." && calcVals.cur.indexOf(".") < 0) || this.value !== ".") {
            calcVals.cur += this.value;
        }
    }
    // shift the leading 0
    if (calcVals.cur.indexOf("0") === 0 && calcVals.cur.length > 1 && calcVals.cur.indexOf(".") !== 1){
        calcVals.cur = calcVals.cur.substring(1);
    }
    // when we have -0(number)
    calcVals.cur = calcVals.cur.replace("-0", "-");
    calcVals.prevAttr = "number";
}

// created by Celia Tang 3/19/19: updates the display element while truncating
// edited by Anna YU 3/21/19: updates keyAc depending on current screen value.
function updateDisplay() {
    //perform truncation and rounding
    dis.innerHTML= calcVals.cur.length<20 ? calcVals.cur: calcVals.cur.slice(0,19);
    keyAC.innerHTML = calcVals.cur === "0" ? "AC" : "C";
}