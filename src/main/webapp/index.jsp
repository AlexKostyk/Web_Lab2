<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
    <meta charset="UTF-8">
    <title>Лабораторная работа по Web-программированию №2</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.anychart.com/releases/8.11.0/js/anychart-base.min.js"></script>
    <script src="https://d3js.org/d3.v7.min.js"></script>
    <style>
    body {
        background-size: cover;
        font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;

    }

    div.box/*Основной блок в котором все лежит*/{
        padding-bottom: 10px;
        margin-left: auto;
        margin-right: auto;
        width: 1000px;
        height: 550px;
        border-radius: 10px;
        box-shadow: 0 0 7px 3px #000000;
        background: linear-gradient(to bottom left, rgba(162, 146, 215, 0.95), #2f58a9);
        grid-auto-rows: minmax(500px, auto);
    }

    h2 /*Заголовок*/{
        margin-top: 50px;
        font-size: 25px;
        text-align: center;
        font-weight: 100;
        border-radius: 10px 10px 0 0;
        border: 4px solid #999999;
        background: linear-gradient(#9595b6, #5a567f);
        color: white;
        padding: 10px 15px;
        position: relative;
        line-height: 1.3;
        box-shadow: 0 1px 0 1px rgba(0,0,0,.04);
    }

    .form_container /*Контейнер таблицы выбора*/{
        margin: 10px 0 0 10px;
        width: 400px;
        border-radius: 10px;
        border: 4px solid #999999;
        background: linear-gradient(to left,#9595b6, #5a567f);
        color: white;
        padding: 20px 40px 50px 40px;
        position: relative;
    }

    .content /*Текст в таблице выбора*/{
        display: block;
        font-size: 16px;
        font-weight: 600;
        color: white;
        padding: 4px 4px 14px 0;
        width: 50%;
        float: left;
        line-height: 1.3;
    }

    input /*Данные в таблице выбора*/{
        border: solid 3px #CCCCCC;
        font-size: 16px;
        font-weight: 600;
        color: #444;
        border-radius: .5em;
        /*-webkit-birder-radius: 4px;
        -moz-border-radius: 4px;*/ /*Не помню что это*/
    }

    #select-css /*Выбор X*/{
        display: block;
        font-size: 16px;
        font-weight: 600;
        color: #444;
        line-height: 1.3;
        width: 35%;
        border: solid 3px #CCCCCC;
        box-shadow: 0 1px 0 1px rgba(0,0,0,.04);
        border-radius: 10px;
        float: right;
        padding: 2px 0 2px 10px;
    }
    #input-css/*Текстовое поле выбора Y*/{
        float: right;
        width: 49%;
        padding: 1px 0 0 0;
        line-height: 1.3;
    }

    ::-webkit-input-placeholder /*Текстовое поле центрирует*/{
        text-align:center;
    }
    :-moz-placeholder { /* Firefox 18- */
        text-align:center;
    }
    ::-moz-placeholder {  /* Firefox 19+ */
        text-align:center;
    }
    :-ms-input-placeholder {
        text-align:center;
    }

    .graph{
        margin: 0px 10px 10px 10px;
        float: right;
        width: 35%;
        display: block;
        border-radius: 10px;
        border: 4px solid #999999;
        padding-left: 40px;
        padding-top: 20px;
        padding-bottom: 20px;
    }

    .point {
        position: absolute;
        width: 5px;
        height: 5px;
        background: #ff0000;
    }

    #clean {
        display: block;
        float: right;
        weight: 60px;
        height: 60px;
        margin-top: 20px;
    }

    #select-r /*Выбор R*/{
        display: block;
            font-size: 16px;
            font-weight: 600;
            color: #444;
            line-height: 1.3;
            width: 35%;
            border: solid 3px #CCCCCC;
            box-shadow: 0 1px 0 1px rgba(0,0,0,.04);
            border-radius: 10px;
            float: right;
            padding: 2px 0 2px 10px;
    }

    #button1-css/*Отправить кнопка*/{
        float: left;
        width: 50%;
    }

    #button2-css/*Очистка таблицы кнопка*/{
        float: right;
        width: 45%;
    }

    #error /*Ошибки*/{
        font-size: 16px;
        font-weight: 800;
        color: rgba(220, 20, 60, 0.62);
        margin: 20px 0 0 30px;
    }

    table {
        text-align: center;
        border-collapse: separate;
        border-spacing: 5px;
        background: linear-gradient(to left, #9595b6, #5a567f);
        color: white;
        border: 4px solid #999999;
        border-radius: 10px;
        margin: 20px 0 0 10px;
    }

    th {
        font-size: 18px;
        padding: 10px;
    }
    td {
        background: rgba(162, 146, 215, 0.49);
        border-radius: 10px;
        padding: 10px;
    }
    </style>
</head>
<body>
<div class="box">
    <h2>
        Костюк Александр, Поляков Даниил<br>Группа: P33212 <br>Вариант: 2184
    </h2>
    <div class="graph" id="graph">
                <div class="svg-wrapper">
                    <svg id="graph" height="300" width="300" xmlns="http://www.w3.org/2000/svg">
                        <!-- Стерлки и оси -->
                        <line stroke="black" x1="0" x2="300" y1="150" y2="150"></line>
                        <line stroke="black" x1="150" x2="150" y1="0" y2="300"></line>
                        <polygon fill="black" points="150,0 144,15 156,15" stroke="black"></polygon>
                        <polygon fill="black" points="300,150 285,156 285,144" stroke="black"></polygon>

                        <!-- Деления -->
                        <line stroke="black" x1="200" x2="200" y1="155" y2="145"></line>
                        <line stroke="black" x1="250" x2="250" y1="155" y2="145"></line>

                        <line stroke="black" x1="50" x2="50" y1="155" y2="145"></line>
                        <line stroke="black" x1="100" x2="100" y1="155" y2="145"></line>

                        <line stroke="black" x1="145" x2="155" y1="100" y2="100"></line>
                        <line stroke="black" x1="145" x2="155" y1="50" y2="50"></line>

                        <line stroke="black" x1="145" x2="155" y1="200" y2="200"></line>
                        <line stroke="black" x1="145" x2="155" y1="250" y2="250"></line>

                        <!-- Подписи к делениям и осям -->
                        <text fill="black" x="195" y="140">R/2</text>
                        <text fill="black" x="250" y="140">R</text>

                        <text fill="black" x="40" y="140">-R</text>
                        <text fill="black" x="85" y="140">-R/2</text>

                        <text fill="black" x="160" y="55">R</text>
                        <text fill="black" x="160" y="105">R/2</text>

                        <text fill="black" x="160" y="204">-R/2</text>
                        <text fill="black" x="160" y="255">-R</text>

                        <text fill="black" x="285" y="140">X</text>
                        <text fill="black" x="160" y="15">Y</text>

                        <!-- Первая фигура (1 четверть) -->
                        <polygon fill="blue"
                                 fill-opacity="0.2"
                                 stroke="blue"
                                 points="150,150 100,150 150,200"></polygon>
                        <!-- Вторая фигура (3 четверть) -->
                        <path fill="blue"
                              fill-opacity="0.2"
                              stroke="blue"
                              d="M 150 100 A 50 50, 0, 0, 0, 100 150 L 150 150 Z"></path>

                        <!-- Третья фигура (4 четверть) -->
                        <polygon fill="blue"
                                 fill-opacity="0.2"
                                 stroke="blue"
                                 points="200,250 150,250 150,150 200,150"></polygon>



                    </svg>
                </div>
    </div>
    <img id="clean" src="clean.png"/>
    <div class="form_container">
            <form id="form" name="form" onsubmit="return false">
                <div class="content">
                    Выберите X:
                </div>
                <select id="select-css" name="x">
                    <option name="x" value="-3">-3</option>
                    <option name="x" value="-2">-2</option>
                    <option name="x" value="-1">-1</option>
                    <option name="x" value="0">0</option>
                    <option name="x" value="1">1</option>
                    <option name="x" value="2">2</option>
                    <option name="x" value="3">3</option>
                    <option name="x" value="4">4</option>
                    <option name="x" value="5">5</option>
                </select>

                <br>
                <div class="content">
                    Введите Y:
                </div>
                <div id="input-css">
                    <input type="text"  placeholder="-5..5" name="y" >
                </div>
                <br>
                <div class="content">
                    Выберите R:
                </div>
                <select id="select-r" name="r">
                    <option name="r" value="1">1</option>
                    <option name="r" value="2">2</option>
                    <option name="r" value="3">3</option>
                    <option name="r" value="4">4</option>
                    <option name="r" value="5">5</option>
                </select>
                <br>
                <div id="button1-css">
                    <input type="submit" id="submit" value="Отправить">
                </div>
                <div id="button2-css">
                    <input type="button" id="reset" value="Очистить таблицу">
                </div>
            </form>
            <br>
        </div>
        <div id="error"></div>
        <table id="result-table" class="table">
                <tr class="table-header">
                    <th>X</th>
                    <th>Y</th>
                    <th>R</th>
                    <th>Локальное время</th>
                    <th>Время исполнения</th>
                    <th>Попадание</th>
                </tr>
        </table>
</div>
<div id="coords">(координаты покажутся здесь)</div
</body>
</html>

<script>
document.onclick = function(e) { // показывает координаты точки клика
    let curX = e.clientX;
    let curY = e.clientY;
    if(curX > 840 && curX < 1225 && curY > 200 && curY < 535){
        let R = document.getElementById('select-r').value;
        let X = (R*(e.clientX - 1028)/100).toFixed(0);
        if (R*(e.clientX - 1028)/100 > -0.5 && R*(e.clientX - 1028)/100 < 0) X = 0;
        let Y = (R*(-1)*(e.clientY - 368)/100).toFixed(2);
        document.form.x.value = X;
        document.form.y.value = Y;
        coords.innerHTML = X + ':' + Y;
    }
};
var block = document.getElementById('graph');
block.onclick = function(e) {
    let curX = e.clientX;
    let curY = e.clientY;
    if(curX > 840 && curX < 1225 && curY > 200 && curY < 535){
        var point = document.createElement('div');
        point.className = 'point';
        point.style.left = e.pageX + 'px';
        point.style.top = e.pageY + 'px';
        block.appendChild(point);
    }
};
$(function(){
    $("#clean").click(function() {
        $(".point").remove();
    });
});
function isNumber(n) { return !isNaN(parseFloat(n)) && !isNaN(n - 0) }
$("#submit").on('click', function (){
    let x = $('select[name=x]').val();
    let y = $('input[name=y]').val().trim();
    let r = $('select[name=r]').val();
    if (!isNumber(x)){
        $("#error").text("Переменная X должна быть в диапазоне (-3 ... 5)");
        return false;
    }
    if (y === ""){
        $("#error").text("Переменная Y не задана");
        return false;
    } else if (y <= -3 || y >= 5){
        $("#error").text("Переменная Y должна быть в диапазоне (-3 ... 5)");
        return false;
    } else if (!isNumber(y)){
        $("#error").text("Переменная Y должна быть числом");
        return false;
    }
    $("#error").text("");

    doRequest(x, y, r);
});

function doRequest(x, y, r){
    let date = choseDate();
    let startTime = performance.now();
    $.ajax({
        type: 'POST',
        url: 'controller',
        data: {'x': x,'y': y,'r': r},
        dataType: 'html',
        success: function(result){
                    let time = (performance.now() - startTime).toFixed(1);
                    let Table=document.getElementById('result-table');
                    let tr=document.createElement('tr');

                    if (result == false) {
                        tr.innerHTML = '<td>' + x + '</td><td>' + y + '</td><td>' + r + '</td><td>' + date + '</td><td>' +
                            time + " мс" + '</td><td style="background: rgba(220,20,60,0.63)">' + "Промах" + '</td>'
                    } else {
                        tr.innerHTML = '<td>' + x + '</td><td>' + y + '</td><td>' + r + '</td><td>' + date + '</td><td>' +
                            time + " мс" + '</td><td style="background: green">' + "Попадание" + '</td>'
                    }
                    Table.appendChild(tr);
                    console.log(result);
        }
    });
}

$("#reset").on('click', function (){
    let tableHeaderRowCount = 1;
    let table = document.getElementById('result-table');
    let rowCount = table.rows.length;
    for (let i = tableHeaderRowCount; i < rowCount; i++) {
        table.deleteRow(tableHeaderRowCount);
    }
});

function choseDate(){
    let date = new Date();
    let res_date = date.getHours() +":"+ date.getMinutes() +":"+ date.getSeconds() +" "+ date.getDate() +"."+
        (date.getMonth() + 1) +"."+ date.getFullYear();
    if (date.getMinutes() < 10 && date.getSeconds() < 10) {
        res_date = date.getHours() + ":0" + date.getMinutes() + ":0" + date.getSeconds() + " " + date.getDate() + "." +
            (date.getMonth() + 1) + "." + date.getFullYear();
    } else if (date.getMinutes() < 10) {
        res_date = date.getHours() + ":0" + date.getMinutes() + ":" + date.getSeconds() + " " + date.getDate() + "." +
            (date.getMonth() + 1) + "." + date.getFullYear();
    } else if (date.getSeconds() < 10){
        res_date = date.getHours() + ":" + date.getMinutes() + ":0" + date.getSeconds() + " " + date.getDate() + "." +
            (date.getMonth() + 1) + "." + date.getFullYear();
    }
    return res_date;
}
</script>