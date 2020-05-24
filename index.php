<?php

$posts = array(
    array(
        "card_header" => "Цитата",
        "card_type" => "post-quote",
        "card_content" => "Мы в жизни любим только раз, а после ищем лишь похожих",
        "card_username" => "Лариса",
        "card_avatar" => "userpic-larisa-small.jpg"
    ),
    array(
        "card_header" => "Арсений Тарковский",
        "card_type" => "post-text",
        "card_content" => "Ночью медленно время идет, Завершается год високосный. Чуют жилами старые сосны Вешних смол коченеющий лед.  Хватит мне повседневных забот, А другого мне счастья не надо. Я-то знаю: и там, за оградой, Чей-нибудь завершается год.  Знаю: новая роща встает Там, где сосны кончаются наши. Тяжелы черно-белые чаши, Чуют жилами срок и черед.",

        "card_username" => "Владик",
        "card_avatar" => "userpic.jpg"
    ),
    array(
        "card_header" => "Наконец, обработал фотки!",
        "card_type" => "post-photo",
        "card_content" => "rock-medium.jpg",
        "card_username" => "Виктор",
        "card_avatar" => "userpic-mark.jpg"
    ),
    array(
        "card_header" => "Моя мечта",
        "card_type" => "post-photo",
        "card_content" => "coast-medium.jpg",
        "card_username" => "Лариса",
        "card_avatar" => "userpic-larisa-small.jpg"
    ),
    array(
        "card_header" => "Лучшие курсы",
        "card_type" => "post-link",
        "card_content" => "www.htmlacademy.ru",
        "card_username" => "Владик",
        "card_avatar" => "userpic.jpg"
    )
);
require('helpers.php');
require('My_functions.php');


$page_content = include_template('main.php', ['posts' => $posts]);
$layout_content = include_template('layout.php', ['content' => $page_content, $title  => 'Readme']);

print($layout_content);


