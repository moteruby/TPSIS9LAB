<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ELECTROSHOP</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        h1, h4, h3 {
            color: #333;
        }

        hr {
            border: 1px solid #ddd;
            margin-bottom: 20px;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        input[type="submit"], a.button {
            display: inline-block;
            padding: 10px 15px;
            margin-bottom: 10px;
            box-sizing: border-box;
            text-align: center;
            text-decoration: none;
            cursor: pointer;
            border: none;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #4caf50;
            color: white;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        a.button {
            background-color: #3498db;
            color: white;
        }

        a.button:hover {
            background-color: #2980b9;
        }

        .product {
            border: 1px solid #ddd;
            padding: 10px;
            margin: 10px;
            max-width: 300px;
        }

        .product img {
            max-width: 100%;
            height: auto;
        }

        .header {
            background-color: #333;
            color: #fff;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            max-width: 150px;
            max-height: 150px;
            cursor: pointer;
        }

        .logo img {
            width: 100%;
            height: auto;
        }

        .brand {
            font-size: 24px;
            font-weight: bold;
            text-align: center;
        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
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
<div class="buttons-container">
    <img src="images/icon.jpg" alt="Изображение иконки пользователя">
    <a href="/acc">Имя</a><br>
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

<div class="container">
    <h3>Панель администратора</h3>
    <table class="table">
        <thead>
        <tr>
            <th>Email</th>
            <th>Номер телефона</th>
            <th>Активность</th>
            <th>Роли</th>
            <th>Заблокировать</th>
            <th>Измененение роли</th>
            <th>Удаление пользователя</th>
            <th>Подробная информация</th>
        </tr>
        </thead>
        <tbody>
        <#list users as user>
            <tr>
                <td>${user.email}</td>
                <td>${user.phoneNumber}</td>
                <td><#if user.active>true<#else>false</#if></td>
                <td><#list user.roles as role>${role} </#list></td>
                <td>
                    <form action="/admin/user/ban/${user.id}" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input type="submit" class="btn btn-danger" value="Заблокировать">
                    </form>
                </td>
                <td><a href="/admin/user/edit/${user.id}" class="btn btn-primary">Изменить роль</a></td>
                <td>
                    <form action="/admin/user/delete/${user.id}" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input type="submit" class="btn btn-danger" value="Удалить пользователя">
                    </form>
                </td>
                <td><a href="/user/${user.id}" class="btn btn-info">Подробная информация</a></td>
            </tr>
        <#else>
            <tr>
                <td colspan="7"><h3>Пользователей нет</h3></td>
            </tr>
        </#list>
        </tbody>
    </table>

    <br><hr>
    <h3><a href="/registration" class="btn btn-primary">Создать пользователя</a></h3>
    <br><hr>

    <br><br>
    <a href="/" class="btn btn-secondary">Вернуться на страницу администратора</a>
</div>
</body>
</html>