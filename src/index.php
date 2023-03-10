<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Отдел Кадров</title>
    <link rel="stylesheet" href="style/styles.css">
</head>
<body>
    <div class="container">
        <h1 class="title">Отдел Кадров</h1>

        <div class="radio-buttons">
            <div class="radiobtn">
                <input type="radio" id="sort-1" name="sort" value="getAllEmployees" checked />
                <label for="sort-1">Все</label>
            </div>
            <div class="radiobtn">
                <input type="radio" id="sort-2" name="sort" value="getProbationaryPeriod" />
                <label for="sort-2">Исп.срок</label>
            </div>
            <div class="radiobtn">
                <input type="radio" id="sort-3" name="sort" value="getDismissedEmployees" />
                <label for="sort-3">Уволенные</label>
            </div>
            <div class="radiobtn">
                <input type="radio" id="sort-4" name="sort" value="getLastHiredEmployees" />
                <label for="sort-4">Начальники</label>
            </div>
        </div>

        <div class="table">
            <table class="styled-table"></table>
        </div>
        
        <div class="pagynation-buttons">
            <button class="back-button" >назад</button>
            <button class="page-button">1</button>
            <button class="next-button">вперед</button>
        </div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <script>
        $( document ).ready(function() {
            setPagination(1);
            handlePaginationButtonsClick();
            handleRadioChange();
            filterByAjax();
        });


        function handleRadioChange() {
            $('input[type="radio"]').click(function() {
                setPagination(1);
                filterByAjax();
            })
        }

        function handlePaginationButtonsClick() {
            $('.back-button, .next-button').click(function() {
                setPagination($(this).val());
                filterByAjax();
            })
        }

        // Функция обновляет значения таблицы по средствам Ajax запроса
        function filterByAjax() {
            let pageValue = $('.page-button').val(); // какая снйчас страница пагинации

            let radioValue = $('input[type="radio"]:checked').val(); // какая радио кнопка выбрана

            $.ajax({
                url: "./controller/employeeController.php",
                method: "POST",
                data: {
                    classMethod: radioValue,
                    page: pageValue
                },
                success: function(data) {
                    $('.table .styled-table').html(data);  
                },
                error: function (request, status, error) {
                    console.log(request.responseText);
                }
            })
        }

        // Функция устанавливает значение пагинации 
        function setPagination(page) {
            if ( parseInt(page) === 0 ) {
                return;
            }
            $('.page-button').val( parseInt(page) );
            $('.page-button').text( parseInt(page) );
            let pageValue = $('.page-button').val() ;
            $('.back-button').val( parseInt(page) - 1 );
            $('.next-button').val( parseInt(page) + 1 );
        }
    </script>
</body>
</html>





