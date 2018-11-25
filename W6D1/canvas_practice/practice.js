document.addEventListener("DOMContentLoaded", function(){
    const canvasEl = document.getElementById("mycanvas");
    canvasEl.width = 500;
    canvasEl.height = 500;

    const ctx = canvasEl.getContext("2d");

    //Drawing a rectange.
    ctx.fillStyle = "rgb(230, 160, 40)";
    ctx.fillRect(10, 10, 400, 200);

    //Drawing a circle.
    ctx.beginPath();
    ctx.arc(200,250, 30, 0, 2*Math.PI);
    ctx.strokeStyle = 'rgb(180, 66, 222)';
    ctx.linewidth = 5;
    ctx.stroke();
    ctx.fillstyle = "blue";
    ctx.fill();
    
    
    
    
});
