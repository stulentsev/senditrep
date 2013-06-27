
$(function() {
      var availableTags = [
      "Москва",
      "Санкт-Петербург",
      "Белгород",
      "Губкин",
      "Новый Оскол",
      "Старый Оскол",
      "Строитель",
      "Щебекино",
      "Брянск",
      "Дятьково",
      "Жуковка",
      "Карачев",
      "Клинцы",
      "Новозыбков",
      "Стародуб",
      "Унеча",
      "Владимир",
      "Владимир",
      "Александров",
      "Вязники",
      "Гусь-Хрустальный",
      "Карабаново",
      "Киржач",
      "Ковров",
      "Кольчугино",
      "Лакинск",
      "Меленки",
      "Муром",
      "Петушки",
      "Покров",
      "Радужный",
      "Собинка",
      "Струнино",
      "Суздаль",
      "Юрьев-Польский",
      "Воронеж",
      "Борисоглебск",
      "Бутурлиновка",
      "Лиски",
      "Нововоронеж",
      "Острогожск",
      "Павловск",
      "Россошь",
      "Семилуки",
      "Иваново",
      "Иваново",
      "Вичуга",
      "Кинешма",
      "Кохма",
      "Родники",
      "Тейково",
      "Фурманов",
      "Шуя",
      "Калуга",
      "6алабаново",
      "Киров",
      "Людиново",
      "Малоярославец",
      "Обнинск",
      "Кострома",
      "Буй",
      "Ветлужский",
      "Волгореченск",
      "Галич",
      "Нехерта",
      "Нея",
      "Шарья",
      "Курск",
      "Железногорск",
      "Курчатов",
      "Льгов",
      "Обоянь",
      "Рыльск",
      "Шигры",
      "Липецк",
      "Грязи",
      "Данков",
      "Елец",
      "Задонск",
      "Лебедянь",
      "Усмань",
      "Чаплыгин",
      "6алашиха",
      "Видное",
      "Волокаламск",
      "Воскресенск",
      "Дедовск",
      "Дзержинский",
      "Дмитров",
      "Долгопрудный",
      "Домодедово",
      "Дубна",
      "Егорьевск",
      "Железнодорожный",
      "Жуковский",
      "Зарайск",
      "Ивантеевка",
      "Истра",
      "Калининец",
      "Кашира",
      "Климовск",
      "Клин",
      "Коломна",
      "Королев",
      "Красноармейск",
      "Красногорск",
      "Краснознаменск",
      "Лукино-Дулево",
      "Любня",
      "Лосино-Петровский",
      "Луховицы",
      "Лыткарино",
      "Люберцы",
      "Можайск",
      "Мытищи",
      "Наро-Фоминск",
      "Ногинск",
      "Одинцово",
      "Озёры",
      "Орехово-Зуево",
      "Павловский Посад",
      "Подольск",
      "Портвино",
      "Пушкино",
      "Пушино",
      "Раменское",
      "Реутов",
      "Рошаль",
      "Сергев Посад",
      "Серпухов",
      "Солнечногорск",
      "Старая Купавна",
      "Ступино",
      "Троицк",
      "Фрязино",
      "Химки",
      "Хотьково",
      "Черноголовка",
      "Чехов",
      "Шатура",
      "Щёлково",
      "Щербинка",
      "Электрогорск",
      "Электросталь",
      "Электроугли",
      "Юбилейный",
      "Орёл",
      "Болхов",
      "Дмитровск",
      "Ливны",
      "Мценск",
      "Рязань",
      "Касимов",
      "Кораблино",
      "Михайлов",
      "Новомичуринск",
      "Рыбное",
      "Ряжск",
      "Сасово",
      "Скопин",
      "Спасск-Рязанский",
      "Шилово",
      "Смоленск",
      "Вязьма",
      "Гагарин",
      "Десногорск",
      "Рославль",
      "Сафоново",
      "Ярцево",
      "Тамбов",
      "Кирсанов",
      "Котовск",
      "Мичуринск",
      "Моршанск",
      "Рассказово",
      "Уварово",
      "Тверь",
      "Бежецк",
      "Бологое",
      "ВысшийВолочёк",
      "Кашин",
      "Кимры",
      "Конаково",
      "Нелидово",
      "Осташков",
      "Ржев",
      "Торжок",
      "Удомля",
      "Тула",
      "Алексин",
      "Богородицк",
      "Донской",
      "Ефремов",
      "Кимовск",
      "Киреевск",
      "Новомосковск",
      "Суворов",
      "Узловая",
      "Щёкино",
      "Ярославль",
      "Гаврилов-Ям",
      "Переславль-Залесский",
      "Ростов",
      "Рыбинск",
      "Тутаев",
      "Углич",
      "Астрахань",
      "Ахтубинск",
      "Знаменск",
      "Камызяк",
      "Красный Яр",
      "Нариманов",
      "Харабали",
      "Черный Яр",
      "Волгоград",
      "Волжский",
      "Городище",
      "Калач-на-Дону",
      "Камышин",
      "Котово",
      "Михайловка",
      "Суровикино",
      "Урюпинск",
      "Фролово",
      "Краснодар",
      "Анапа",
      "Армавир",
      "Белореченск",
      "Геленджик",
      "Ейск",
      "Кропоткин",
      "Крымск",
      "Лабинск",
      "Новороссийск",
      "Славянск",
      "Сочи",
      "Тимашевск",
      "Тихорецк",
      "Туапсе",
      "Майкоп",
      "Адыгейск",
      "Каменномостский",
      "Тульский",
      "Энем",
      "Яблоновский",
      "Элиста",
      "Городовиковск",
      "Лагань",
      "Троицкое",
      "Ростов-на-Дону",
      "Азов",
      "Батайск",
      "Волгодонск",
      "Гуково",
      "Донецк",
      "Каменск",
      "Новочеркасск",
      "Новошахтинск",
      "Ростов",
      "Сальск",
      "Таганрог",
      "Шахты",
      "Нальчик",
      "Баксан",
      "Майский",
      "Нарткала",
      "Прохладный",
      "Тырныауз",
      "Черкесск",
      "Карачаевск",
      "Теберда",
      "Махачкала",
      "Буйнайск",
      "ДегестанскиеОгни",
      "Дербент",
      "Избербаш",
      "Каспийск",
      "Кизилюрт",
      "Кизляр",
      "Хасавюрт",
      "Назрань",
      "Карабулак",
      "Малгобек",
      "Орджоникидзевская",
      "Троицкая",
      "Экажево",
      "Грозный",
      "Владикавказ",
      "Алагир",
      "Ардон",
      "Ставрополь",
      "Беслан",
      "Благодарный",
      "Будённовск",
      "Георгиевск",
      "Горячеводский",
      "Ессентуки",
      "Зеленокумск",
      "Изобильный",
      "Кисловодск",
      "Минеральные воды",
      "Михайловск",
      "Невинномысск",
      "Пятигорск",
      "Светлоград",
      "Курган",
      "Далматово",
      "Катайск",
      "Куртамыш",
      "Петухово",
      "Шадринск",
      "Шумиха",
      "Шучье",
      "Екатеринбург",
      "Асбест",
      "Каменск",
      "Краснотурьинск",
      "Нижний Тагил",
      "Новоуральск",
      "Первоуральск",
      "Полевской",
      "Ревда",
      "Серов",
      "Тюмень",
      "Заводоуковск",
      "Ишим",
      "Тобольск",
      "Ялуторовск",
      "Ханты-Мансийск",
      "Когалым",
      "Лангепас",
      "Мегион",
      "Нефтеюганск",
      "Нижневартовск",
      "Нягань",
      "Пыть",
      "Радужный",
      "Сургут",
      "Урай",
      "Челябинск",
      "Златоуст",
      "Копейск",
      "Магнитогорск",
      "Миасс",
      "Озёрск",
      "Снежинск",
      "Троицк",
      "Салехард",
      "Губкинский",
      "Лабытнанги",
      "Муравленко",
      "Надым",
      "Новый Уренгой",
      "Ноябрьск",
      "Барнаул",
      "Алейск",
      "Бийск",
      "Заринск",
      "Камень",
      "Новоалтайск",
      "Рубцовск",
      "Славгород",
      "Яровое",
      "Чита",
      "Борзя",
      "Краснокаменск",
      "Нерчинск",
      "Петровск",
      "Забайкальский",
      "Иркутск",
      "Ангарск",
      "Братск",
      "Саянск",
      "Тулун",
      "Усолье",
      "Усть",
      "Усть",
      "Черемхово",
      "Шелехов",
      "Кемерово",
      "Анжеро-Судженск",
      "6елово",
      "Киселёвск",
      "Ленинск",
      "Междуреченск",
      "Новокузнецк",
      "Прокопьевск",
      "Юрга",
      "Красноярск",
      "Ачинск",
      "Дудинка",
      "Железногорск",
      "Зеленогорск",
      "Канск",
      "Лесосибирск",
      "Минусинск",
      "Назарово",
      "Норильск",
      "Новосибирск",
      "Барабинск",
      "Бердск",
      "Искитим",
      "Карасук",
      "Куйбышев",
      "Обь",
      "Татарск",
      "Омск",
      "Исилькуль",
      "Калачинск",
      "Называевск",
      "Тара",
      "Тюкалинск",
      "Горно-Алтайск",
      "Кош-Аган",
      "Майма",
      "Онгудай",
      "Турочак",
      "Шебалино",
      "Улан-Удэ",
      "Гусиноозёрск",
      "Закаменск",
      "Кяхта",
      "Северобайкальск",
      "Селенгинск",
      "Кызыл",
      "Ак-Довурак",
      "Каа-Хем",
      "Туран",
      "Чадан",
      "Шагонар",
      "Абакан",
      "Абаза",
      "Саяногорск",
      "Сорск",
      "Усть",
      "Черногорск",
      "Томск",
      "Асино",
      "Колпашево",
      "Северск",
      "Стрежевой",
      "Архангельск",
      "Вельск",
      "Коряжма",
      "Котлас",
      "Мирный",
      "Нарьян-Мар",
      "Новодвинск",
      "Няндома",
      "Онега",
      "Северодвинск",
      "Вологда",
      "Бабаево",
      "ВеликийУстюг",
      "Грязовец",
      "Сокол",
      "Череповец",
      "Шексна",
      "Калининград",
      "Балтийск",
      "Советск",
      "Черняховск",
      "Мурманск",
      "Апатиты",
      "Кандалакша",
      "Кировск",
      "Мончегорск",
      "Оленегорск",
      "Североморск",
      "Нарьян-Мар",
      "ВеликийНовгород",
      "Боровичи",
      "Валдай",
      "МалаяВишера",
      "Пестово",
      "СтараяРусса",
      "Чудово",
      "Псков",
      "ВеликиеЛуки",
      "Невель",
      "Опочка",
      "Остров",
      "Печоры",
      "Порхов",
      "Петрозаводск",
      "Кондопога",
      "Костомукша",
      "Сегежа",
      "Сыктывкар",
      "Воркута",
      "Инта",
      "Печора",
      "Усинск",
      "Ухта",
      "Волхов",
      "Всеволожск",
      "Выборг",
      "Гатчина",
      "Кингисепп",
      "Кириши",
      "Сертолово",
      "Сосновыйбор",
      "Тихвин",
      "Киров",
      "ВятскиеПоляны",
      "Кирово",
      "Котельнич",
      "Омутнинск",
      "Слободской",
      "Яранск",
      "Нижний Новгород",
      "Арзамас",
      "Бор",
      "Джержинск",
      "Кстово",
      "Павлово",
      "Саров",
      "Оренбург",
      "6угуруслан",
      "6узулук",
      "Новотроицк",
      "Орск",
      "Пенза",
      "Заречный",
      "Каменка",
      "Кузнецк",
      "Никольск",
      "Сердобск",
      "Пермь",
      "6ерезники",
      "Краснокамск",
      "Кунгур",
      "Лысьва",
      "Соликамск",
      "Чайковский",
      "Уфа",
      "6елебей",
      "6елорецк",
      "Ишимбай",
      "Кумертау",
      "Мелеуз",
      "Нефтекамск",
      "Октябрьский",
      "Октябрьский",
      "Салават",
      "Сибай",
      "Стерлитамак",
      "Туймазы",
      "Йошкар-Ола",
      "Волжск",
      "Звенигово",
      "Козьмодемьянск",
      "Саранск",
      "Ковылкино",
      "Краснослободск",
      "Рузаевка",
      "Казань",
      "Альметьевск",
      "Набережные Челны",
      "Нижнекамск",
      "Самара",
      "Жигулёвск",
      "Новокуйбышевск",
      "Сызрань",
      "Тольятти",
      "Чапаевск",
      "Саратов",
      "6алаково",
      "6алашов",
      "Вольск",
      "Энгельск",
      "Ижевск",
      "Воткинск",
      "Глазов",
      "Можга",
      "Сарапул",
      "Ульяновск",
      "6арыш",
      "Димитровград",
      "Инза",
      "Новоульяновск",
      "Чебоксары",
      "Алатырь",
      "Канаш",
      "Новочебоксарск",
      "6лаговещенск",
      "6елогорск",
      "Зея",
      "Свободный",
      "Тында",
      "6иробиджан",
      "Облучье",
      "Николаевка",
      "Петропавловск-Камчатский",
      "Вилючинск",
      "Елизово",
      "Магадан",
      "Ола",
      "Сусуман",
      "Владивосток",
      "Арсеньев",
      "Артём",
      "Лесозаводск",
      "Находка",
      "Партизанск",
      "Спасск",
      "Уссурийск",
      "Якутск",
      "Алдан",
      "Ленск",
      "Мирный",
      "Нерюнгри",
      "Удачный",
      "Южно-Сахалинск",
      "Корсаков",
      "Невельск",
      "Оха",
      "Холмск",
      "Хабаровск",
      "Амурск",
      "Комсомольск",
      "Амуре",
      "Николавск",
      "Советская Гавань",
      "Анадырь",
      "Билибино",
      "Певек"];
    $( ".autocomplete" ).autocomplete({
      source: availableTags,
      minLength: 3,
      autoFocus:true,
      delay: 100
    });
  });