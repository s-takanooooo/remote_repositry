//ページを読み込んだら
window.onload = function(){
    //Dateクラスインスタンス化
    var getToday = new Date();
    //年取得
    var y = getToday.getFullYear();
    //月取得
    var m = getToday.getMonth() + 1;
    //日取得
    var d = getToday.getDate();
    var today = y + "-" + m.toString().padStart(2,'0') + "-" + d.toString().padStart(2,'0');
    //valueにセット
    document.getElementById("datepicker").setAttribute("value",today);
}
