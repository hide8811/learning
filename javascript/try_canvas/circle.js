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
