//Created 3/20/19 by Kordell Stewart
//Edited 3/21/19 by Kordell Stewart - Finalized code
//Edited 3/21/19 by Leslie Zhou--exp function added
// Edited by Celia Tang 3/21/19: made sure that prev and cur are equal at end of call
//This file contains the functionality for the sin, cos, and tan buttons

var dis = document.getElementById('viewer');
var trig = {
  value: 0,

  sin() {
    trig.value = parseFloat(calcVals.cur);
    trig.value = Math.sin(trig.value);
    calcVals.cur = trig.value.toString();
    calcVals.cur = calcVals.cur.substr(0, 11);
    calcVals.prev = calcVals.cur;
    calcVals.op = "sin";
    trig.value = 0;
    calcVals.prevAttr = "trig";
  },
  tan(){
    trig.value = parseFloat(calcVals.cur);
    trig.value = Math.tan(trig.value);
    calcVals.cur = trig.value.toString();
    calcVals.cur = calcVals.cur.substr(0, 11);
    calcVals.prev = calcVals.cur;
    calcVals.op = "tan";
    trig.value = 0;
    calcVals.prevAttr = "trig";
  },

  cos(){
    trig.value = parseFloat(calcVals.cur);
    trig.value = Math.cos(trig.value);
    calcVals.cur = trig.value.toString();
    calcVals.cur = calcVals.cur.substr(0, 11);
    calcVals.prev = calcVals.cur;
    calcVals.op = "cos";
    trig.value = 0;
    calcVals.prevAttr = "trig";
  },

  pi(){
    trig.value = 3.14159;
    calcVals.cur = trig.value.toString();
    calcVals.prev = calcVals.cur;
    calcVals.op = "pi";
    trig.value = 0;
    calcVals.prevAttr = "trig";
  }

};


//Created 3/20/19 by Kordell Stewart
document.getElementById("cos").addEventListener("click", trig.cos);

document.getElementById("tan").addEventListener("click", trig.tan);

document.getElementById("sin").addEventListener("click", trig.sin);

document.getElementById("PI").addEventListener("click", trig.pi);
