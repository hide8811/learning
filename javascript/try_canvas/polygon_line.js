const polygonLineCanvas = document.getElementById('polygon-line');
const polygonLineContext = polygonLineCanvas.getContext('2d');

polygonLineContext.beginPath();

// 四角
polygonLineContext.moveTo(10, 10);
polygonLineContext.lineTo(60, 10);
polygonLineContext.lineTo(60, 60);
polygonLineContext.lineTo(10, 60);
polygonLineContext.closePath(); // 線を閉じる(終点から始点まで線を引く)

// 三角
polygonLineContext.moveTo(80, 10);
polygonLineContext.lineTo(80, 60);
polygonLineContext.lineTo(130, 60);
polygonLineContext.closePath();

// 王冠
polygonLineContext.moveTo(140, 30);
polygonLineContext.lineTo(140, 80);
polygonLineContext.lineTo(220, 80);
polygonLineContext.lineTo(220, 30);
polygonLineContext.lineTo(200, 50);
polygonLineContext.lineTo(180, 10);
polygonLineContext.lineTo(160, 50);
polygonLineContext.closePath();

polygonLineContext.stroke();
