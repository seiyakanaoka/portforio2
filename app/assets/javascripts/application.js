// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery

//= require rails-ujs
//= require activestorage
//= require turbolinks

//= require picker
//= require picker.date
//= require picker.time
//= require_tree .
/*global $*/

$(document).on('turbolinks:load', () => {
    $(function() {
    // datepicker表示イベント
    $('#date').pickadate();
    // timepicker表示イベント
    $('#time').pickatime({
        format: 'HH:i', // 24時間表記
        interval: 30,   // 表示間隔
        min: [10,00],   // 予約開始時間
        max: [20,00]    // 予約終了時間
    });
    // 予約ボタン押下イベント
    $('#submit').click(onClickSubmit);
    //予約ボタン押下処理
    function onClickSubmit(){
        $('#submit_result').remove();
        var date = $('#date').val();
        var time = $('#time').val();
        if(date!='' && time !=''){
            // TODO 予約をサーバに送信
            // params={};
            // prams.date=date;
            // params.time=time;
            // $.post("hoge.php",params,function(data){
                // ここにサーバ送信後の処理結果を書く
            // });
            //予約完了メッセージ
            $('#result').after('<div id="submit_result" class="section__block section__block--notification"><p><strong>'+date+time+'〜</strong><br>予約受け付けました。</p></div>');
        }else{
            //予約失敗メッセージ
            $('#result').after('<div id="submit_result" class="section__block section__block--notification-red"><p>予約日・予約時間を選択してください。</p></div>');
        }
    }
});
});