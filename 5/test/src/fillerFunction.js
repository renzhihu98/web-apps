// Created by Renzhi Hu 3/21/2019
// Edited by Celia Tang 3/21/19
// Edited by Anna Yu 3/21/19

// Created by Renzhi Hu 3/21/2019
// get the square root value of the current input
function sqrt() {
    var cur = parseFloat(calcVals.cur);
    if (cur >= 0){
        calcVals.cur = Math.sqrt(cur).toString().substring(0, 11);
        calcVals.prevAttr = "filler";
    }
}

//Created by Celia Tang 3/21/19
// deletes a digits from the back end of the displayed value, if length is 0, then just keeps empty string
function backspace() {
    if (calcVals.cur.length > 0) {
        calcVals.cur = calcVals.cur.substring(0, calcVals.cur.length - 1);
    }
    if (calcVals.cur.length === 0) {
        calcVals.cur = "0";
    }
    calcVals.prevAttr = "filler";
}

//Created and edited 3/21/19 by Anna Yu: change sign and display.
//changes the sign of the current value to - or + depending on what it is.
function sign(){
    if(calcVals.cur.charAt(0)==='-'){
        calcVals.cur=calcVals.cur.slice(1);
    }else{
        calcVals.cur='-'+ calcVals.cur;
    }
    calcVals.prevAttr = "filler";
}

// Created by Renzhi Hu 3/21/2019
// add event listeners
document.getElementById("sqrt").addEventListener('click', sqrt);

//Created by Celia Tang 3/21/19
//chains event listener to backspace button
document.getElementById("backspace").addEventListener("click", backspace);

//created 3/21/19 by Anna Yu
document.getElementById("sign").addEventListener("click", sign);

//created 3/21/19 by Celia Tang, adds eventlistener with updateDisplay to all buttons
buttons = document.getElementsByTagName("button");
for (let b of buttons) {
    b.addEventListener("click", updateDisplay);
}