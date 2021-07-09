const circleCanvas = document.getElementById('circle');
const circleContext = circleCanvas.getContext('2d');

// 円
circleContext.beginPath();

// はじまりと終わりはラジアンで指定
// ラジアン: 0°〜360° => 0 〜 2π
// 円周率 => Math.PI
// 360° == 2 * Math.PI
// はじまりの位置はx軸(中心の右側)
circleContext.arc(40, 40, 30, 0 * Math.PI, 2 * Math.PI); // (中心のx座標, 中心のy座標, 弧のはじまりの位置, 弧の終わりの位置)
circleContext.stroke();

// 半円(縦)
circleContext.beginPath();
circleContext.arc(120, 40, 30, 0.5 * Math.PI, 1.5 * Math.PI);
circleContext.stroke();

// 半円繋ぎ
circleContext.beginPath();
circleContext.arc(180, 40, 30, 0, 1 * Math.PI);
circleContext.stroke();

circleContext.beginPath(); // 一度区切らないと、パス(半円の終点と、次の半円の始点)が繋がってしまう。
circleContext.arc(240, 40, 30, 1 * Math.PI, 2 * Math.PI);
circleContext.stroke();

circleContext.beginPath();
circleContext.arc(300, 40, 30, 0, 1 * Math.PI);
circleContext.stroke();

circleContext.beginPath();
circleContext.arc(360, 40, 30, 1 * Math.PI, 2 * Math.PI);
circleContext.stroke();

// 円弧
circleContext.beginPath();
circleContext.moveTo(10, 90);
circleContext.arcTo(50, 90, 50, 150, 40);
circleContext.stroke();

circleContext.beginPath();
circleContext.moveTo(80, 90);
circleContext.lineTo(130, 90);
circleContext.arcTo(160, 90, 200, 150, 30);
circleContext.lineTo(200, 150);
circleContext.stroke();

// arcTo(x1, y1, x2, y2, r);
// 直前の座標(x0, y0)から(x1, y1)までのラインと、
// (x1, y1)から(x2, y2)までのラインの交点を、
// 半径rの円弧で繋ぐ。
