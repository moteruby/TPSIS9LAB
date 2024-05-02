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
    <img src="images/main-face.png" alt="Изображение лица">
Наше программное средство предоставляет <b>высокоточное распознавание человеческих эмоций</b> на основе передовых алгоритмов и искусственного интеллекта. С его помощью вы можете:<br>
            <b>Анализировать настроение и выражения</b>: Определять различные эмоциональные состояния, такие как радость, грусть, гнев, удивление и др.<br>
                <b>Предоставлять детализированные отчеты</b>: Генерировать подробную статистику и аналитику по эмоциональным реакциям пользователей или аудитории.<br>
Преимущества использования:<br>
    <b>Точность и надежность</b>: Наше программное средство базируется на передовых технологиях и алгоритмах, обеспечивающих высокую точность распознавания эмоций.<br>
        <b>Универсальность применения</b>: Подходит для широкого спектра задач – от анализа пользовательского опыта и социологических исследований до медицинской диагностики и маркетинговых исследований.<br>
    <a href="/login" class="register-button" type="submit">Начать распознавание</a>
    <a href="/registration" class="button1" type="submit">Зарегистрироваться</a>
</main>
</body>

</html>