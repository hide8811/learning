const rectangleCamvas = document.getElementById('rectangle');
const rectangleContext = rectangleCamvas.getContext('2d');

// 矩形のみ
rectangleContext.rect(10, 10, 50, 70); // (x: 横, y: 縦, 幅, 高さ)
rectangleContext.stroke(); // 描画 必須

// stroke + rect
rectangleContext.strokeRect(70, 10, 50, 70);

// 色付き矩形
rectangleContext.strokeStyle = '#ff0000';
rectangleContext.strokeRect(130, 10, 50, 70);

// 色変更
rectangleContext.strokeStyle = '#008000';
rectangleContext.strokeRect(190, 10, 50, 70);

// 塗りつぶし
rectangleContext.fillRect(250, 10, 50, 70); // デフォルトは黒 '#000000'

// 色変更
rectangleContext.fillStyle = '#ff0000';
rectangleContext.fillRect(310, 10, 50, 70);
