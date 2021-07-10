const curveCanvas = document.getElementById('curve');
const curveContext = curveCanvas.getContext('2d');

// 2次ベジェ曲線
curveContext.beginPath();
curveContext.moveTo(10, 10);
curveContext.quadraticCurveTo(20, 100, 200, 10); // (制御点x, 制御点y, 終点x, 終点y)
curveContext.stroke();

// 3次ベジェ曲線
curveContext.beginPath();
curveContext.moveTo(20, 120);
curveContext.bezierCurveTo(70, 150, 120, 50, 170, 100); // (制御点1x, 制御点1y, 制御点2x, 制御点2y, 終点x, 終点y)
curveContext.stroke();
