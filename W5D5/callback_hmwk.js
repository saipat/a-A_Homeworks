//Simple Timeout
window.setTimeout(()=>{
  alert('HAMMERTIME');
}, 5000);
// ^^Asynchronous

//Timeout & closure
function hammerTime(time){
  window.setTimeout(() =>{
  alert(`${time} is hammerTime`);
});
}
