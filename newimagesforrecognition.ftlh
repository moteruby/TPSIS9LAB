<!DOCTYPE html>
<html lang="ru">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EmoRecognition</title>
    <style>
        body { font-family: Arial, sans-serif; }
        .logo { background-color: #000; color: #fff; padding: 1px; border-radius: 50%; width: 3%; max-width: 100px; height: 10%; max-height: 100px;}
        .navigation { list-style-type: none; margin-left: 0; padding-left: 0; }
        .navigation li { padding: 5px 0; display: flex; align-items: center; }
        .navigation li::before { content: "\1F310"; margin-right: 10px; font-size: 20px; }
        .main-content { display: flex; }
        .buttons-container { flex: 1; border-right: 1px solid #ccc; padding-right: 20px; }
        .registration-form { flex: 2; padding: 20px; }
        .registration-form input { margin: 10px 0; display: block; width: 100%; padding: 10px; }
        .button {background-color: #00BDD6FF; color: white; border: none; margin-top: 20px; border-radius: 20%;}
        .button1 { margin-top: 20px; background-color: #379AE6FF; color: white; border: none; padding: 10px 20px; cursor: pointer; border-radius: 20px; }
        .gender-buttons { margin: 10px 0;}
        .gender-buttons button { margin-right: 10px; }
        .register-button { margin-top: 20px; background-color: #00BDD6FF; color: white; border: none; padding: 10px 20px; cursor: pointer; border-radius: 20px; }
        .register-button:hover { background-color: #379AE6FF; }
        .contact-login { display: flex; justify-content: space-between; margin-bottom: 20px; }
        #sidebar {
            width: 250px;
            background-color: #f5f5f5;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        #logo {
            max-width: 100%;
            height: auto;
        }

        #sidebar ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        #sidebar li {
            margin-bottom: 10px;
            font-size: 16px;
        }

        /* Стили для области основного контента */
        #main-content {
            padding: 20px;
        }

        h1 {
            font-size: 24px;
            margin-bottom: 20px;
        }

        /* Стили для каждого элемента результата */
        .result-item {
            margin-bottom: 20px;
            border: 1px solid #ddd;
            padding: 10px;
            display: flex;
            align-items: center;
        }

        .result-item img {
            max-width: 100%;
            height: auto;
            margin-right: 10px;
        }

        .result-item a {
            text-decoration: none;
            color: #333;
            font-weight: bold;
        }

        .result-item a:hover {
            text-decoration: underline;
        }

        .result-item .buttons {
            margin-top: 10px;
        }

        .result-item .buttons a {
            margin-right: 10px;
            color: #666;
        }

    </style>
</head>

<body>
<header>
    <img src="images/m-icon.jpg" alt="Лого">
    <div>EmoRecognition</div>
    <div class="contact-login">
        <a href="/contact-info">контактная информация</a>
        <a href="#" onclick="history.back();" class="button">Назад</a>
    </div>
</header>
<main class="main-content">
    <div class="buttons-container">
        <img src="images/icon.jpg" alt="Изображение иконки пользователя">
        <a href="acc">Имя</a><br>
        <img src="images/main.png" alt="Изображение домика">
        <a href="/main">Главная</a><br>
        <img src="images/download.png" alt="Изображение загрузки">
        <a href="/new_images">Загрузка данных</a><br>
        <img src="images/face.png" alt="Изображение лица">
        <a href="/view_results">Просмотр результатов</a><br>
        <img src="images/settings.png" alt="Изображение настроек">
        <a href="/settings">Настройки</a><br>
        <#if user.isAdmin()>
            <img src="images/settings.png" alt="Изображение настроек">
            <a href="/admin">Управление пользователями</a><br>
        </#if>
    </div>
    <div id="main-content">
        <h1>Загрузка данных</h1>
        <div>
            <div class="mb-3">
                <form action="/downl" method="post" enctype="multipart/form-data" name="addImage">
                <input type="file" class="form-control" name="images" id="images">
                <button class="register-button" type="submit">Распознать</button>
                </form>
            </div><br>
            Загруженные файлы: <br><br>
            <#list results as result>

                <img src="images/histogramm1.jpg" alt="Изображение Гистограммы">

                <p>${result.title}</p>
                <p>${result.description}</p>

                <p>${result.dateOfCreated}</p>
                <a href="/viewresults" class="button1">Просмотреть</a>
                <b href="/deleteresult" class="register-button">Удалить</b>
            <#else>
                <h3>Нету распознанных изображений</h3>
            </#list>
        </div>
</main>
</body>

</html>