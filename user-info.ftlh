<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EmoRecognition</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        h1, h4, h3 {color: #333;}
        hr {border: 1px solid #ddd;margin-bottom: 20px;}
        b {color: #333;}
        a {color: #3498db;text-decoration: none;}
        a:hover {text-decoration: underline;}
        .product {border: 1px solid #ccc;padding: 10px;margin: 10px;}
        .product img {max-width: 100%;}
        .btn-primary {background-color: #3498db;color: white;border: none;border-radius: 4px;padding: 10px 15px;cursor: pointer;}
        .btn-primary:hover {background-color: #2980b9;}
        .btn-secondary {background-color: #555;color: white;border: none;border-radius: 4px;padding: 10px 15px;cursor: pointer;}
        .btn-secondary:hover {background-color: #444;}
        .container {background-color: #fff;padding: 20px;border-radius: 5px;box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);}
        .header {background-color: #333;color: #fff;padding: 10px 20px;display: flex;justify-content: space-between;align-items: center;}
        .logo {max-width: 150px;max-height: 150px;cursor: pointer;}
        .logo img {width: 100%;height: auto;}
        .brand {font-size: 24px;font-weight: bold;text-align: center;}
        .c-image img {display: block;margin: 0 auto;height:auto;}
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
        .button1 {background-color: #379AE6FF; color: white; border: none; margin-top: 20px; border-radius: 20%;}
        .gender-buttons { margin: 10px 0;}
        .gender-buttons button { margin-right: 10px; }
        .register-button { margin-top: 20px; background-color: #00BDD6FF; color: white; border: none; padding: 10px 20px; cursor: pointer; border-radius: 20px; }
        .register-button:hover { background-color: #379AE6FF; }
        .contact-login { display: flex; justify-content: space-between; margin-bottom: 20px; }
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

<div class="container">
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
    <h3>Подробная информация о пользователе ${user.name}</h3><br>
    <h5><b>Номер телефона: </b> ${user.phoneNumber}</h5><br>
    <h5><b>Email: </b> ${user.email}</h5><br><br>
    <h4>Результаты распознавания пользователя ${user.name}: </h4><br>
    <#list results as result>
        <img src="images/histogramm1.jpg" alt="Изображение Гистограммы">

        <p>${result.title}</p>
        <p>${result.description}</p>

        <p>${result.dateOfCreated}</p>
        <a href="/result/view/${result.id}" class="button1">Просмотреть</a>
        <b href="/result/delete/${result.id}" class="button">Удалить</b>
    <#else>
        <h3>Нет результатов распознавания</h3></td>
    </#list>
    <br>
    <a href="#" onclick="history.back();" class="btn btn-secondary">Назад</a>
</div>
</body>
</html>