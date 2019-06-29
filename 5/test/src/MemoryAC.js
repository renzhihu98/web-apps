//This file contains the fucntions and listeners for the features of memory functions, AC, C, and negative buttons.
//Created 3/17/19 by Anna Yu
//Edited 3/20/19 by Anna Yu

//Created 3/17/19 by Anna Yu: created functions add, minus, clear, and value.
//Edited 3/20/19 by Anna Yu: removed parameter number, parse calcVals, added retrieve, return for testing purposes.
var dis = document.getElementById('viewer');
var memory = {
  value: 0,
  
  add() {
    memory.value += parseFloat(calcVals.cur);
    calcVals.prevAttr = "memory";
    return memory.value;
  },
  minus(){
    memory.value -= parseFloat(calcVals.cur);
    calcVals.prevAttr = "memory";
    return memory.value;
  },
  clear(){
    memory.value = 0;
    calcVals.prevAttr = "memory";
    return memory.value;
  },
  retrieve(){
    calcVals.cur = memory.value.toString();
    calcVals.prevAttr = "memory";
  }
};

//Created 3/17/19 by Kordell Stewart
//Edited 3/20/17 by Anna Yu: moved to current file
//Memory Button listeners
document.getElementById("MC").addEventListener("click",memory.clear);

document.getElementById("MR").addEventListener("click", memory.retrieve);

document.getElementById("MS").addEventListener("click", memory.minus);

document.getElementById("M+").addEventListener("click", memory.add);

//Created 3/20/19 by Anna Yu: read innerHTMl to determine AC or C, then change calcVals accordingly.
//Edited 3/21/19 by Anna Yu: if statement to use === and moved calcVals.cur = "0".
function clearDisplay() {
  if (this.innerHTML==="AC"){
    calcVals.prev="0";
    calcVals.op="0";
  } else if(this.innerHTML==="C"){ //Assume to be C
    this.innerHTML = "AC";
  }
  calcVals.cur="0"; //will happen regardless
  dis.innerHTML = calcVals.cur;
  calcVals.prevAttr='AC';
}

//Created 3/17/19 by Kordell Stewart
//Edited by Anna Yu: moved to current file
var keyAC = document.getElementById("AC");
keyAC.addEventListener("click", clearDisplay);