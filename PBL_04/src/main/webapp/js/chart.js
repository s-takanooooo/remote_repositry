$(document).ready(function(){
    // hidden要素からデータを取得
    var categories = JSON.parse($('#categories').val());
    var values = JSON.parse($('#values').val());

    // ApexChartsの設定
    var options = {
        series: values,
        chart: {
            type: 'donut',
        },
        labels: categories,
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
