//Created 3/17/2019 by Leslie Zhou: Class and constructor created

//Edited 3/20/2019 by Leslie Zhou: combine four basic 4 ops
// Edited 3/20/19 by Celia Tang, incorporate logic for assigning value to prev value
//Editied 3/21/19 by Leslie Zhou, EXP added
function opsDisplay() {
    if (calcVals.op === "0") {
        // no prev ops pressed
        calcVals.op = this.value;
        calcVals.prev = calcVals.cur;
    } else if (calcVals.prevAttr === "operator") {
        calcVals.op = this.value;
    } else {
        // prev ops pressed
        var result = calcVals.cur;
        if (calcVals.op === "+") {
            result = parseFloat(calcVals.prev) + parseFloat(calcVals.cur);
        } else if (calcVals.op === "-") {
            result = parseFloat(calcVals.prev) - parseFloat(calcVals.cur);
        } else if (calcVals.op === "*") {
            result = parseFloat(calcVals.prev) * parseFloat(calcVals.cur);
        } else if (calcVals.op === "/") {
            result = parseFloat(calcVals.prev) / parseFloat(calcVals.cur);
        } else if (calcVals.op==="exp"){
            result=Math.pow(parseFloat(calcVals.prev),parseFloat(calcVals.cur));
        }
        result = result.toString();
        calcVals.cur = result;
        calcVals.prev = calcVals.cur;
        calcVals.op = this.value;
    }
    calcVals.prevAttr = "operators";
}
//Edited by Celia Tang 3/19/19: condensed adding event listeners to ops and num buttons
//Operator Buttons listeners
var ops = document.getElementsByClassName("operator");
for (var i = 0; i < ops.length; i++) {
    ops[i].addEventListener('click', opsDisplay);
}