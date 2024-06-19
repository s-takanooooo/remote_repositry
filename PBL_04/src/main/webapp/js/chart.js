$(document).ready(function(){
    // hidden要素からデータを取得
    var categories = JSON.parse($('#categories').val());
    var values = JSON.parse($('#values').val());

    // ApexChartsの設定
    var options = {
        series: values,
        chart: {
            type: 'donut',
            width: '50%', // グラフの幅
        	height: '250px',//グラフの高さ
        },
        labels: categories,
        legend: {
			offsetX: 200,
            position: 'right',
             // legendの位置を指定（'top', 'bottom', 'left', 'right'から選択）
        },
        responsive: [{
            breakpoint: 480,
            options: {
                chart: {
                    width: 200
                },
                legend: {
                    position: 'bottom'
                }
            }
        }]
    };

    // グラフを描画
    var chart = new ApexCharts(document.querySelector("#chart"), options);
    chart.render();
});
