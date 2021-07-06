const linesCanvas = document.getElementById('lines');
const linesContext = linesCanvas.getContext('2d'); // contextオブジェクト。描写のメソッドが使用可能になる。

linesContext.beginPath(); // 開始宣言

// 縦線
linesContext.moveTo(0, 0); // 開始位置の指定 (x: 横, y: 縦)
linesContext.lineTo(0, 150); // 引数の座標まで線を引く

linesContext.moveTo(10, 0);
linesContext.lineTo(10, 160); // 表示される最大値はcamvasタグの大きさ

linesContext.moveTo(20, 0);
linesContext.lineTo(20, 145);

// 横線
linesContext.moveTo(30, 70);
linesContext.lineTo(60, 70);

// 斜め線
linesContext.moveTo(50, 0);
linesContext.lineTo(90, 150);

linesContext.moveTo(60, 0);
linesContext.lineTo(100, 150);

linesContext.stroke(); // 実行

// 赤線
linesContext.beginPath();
linesContext.strokeStyle = '#ff0000'; // beginPath() と stroke() で別描写にしないと全てに適応されてしまう
linesContext.moveTo(110, 10);
linesContext.lineTo(160, 10);
linesContext.stroke();

// 太線
linesContext.beginPath();
linesContext.strokeStyle = '#000000'; // 線の色を黒に戻す
linesContext.lineWidth = 10;
linesContext.moveTo(110, 20);
linesContext.lineTo(160, 20);
linesContext.stroke();

// 角丸
linesContext.beginPath();
linesContext.lineCap = 'round';
linesContext.lineWidth = 10;
linesContext.moveTo(110, 40);
linesContext.lineTo(160, 40);
linesContext.stroke();

// 角角
linesContext.beginPath();
linesContext.lineCap = 'square';
linesContext.lineWidth = 10;
linesContext.moveTo(110, 60);
linesContext.lineTo(160, 60);
linesContext.stroke();
