﻿
#Область ФайловаяСистемаКлиентАсинх

// Показывает диалог выбора файла
//
// Параметры:
//	Режим		- РежимДиалогаВыбораФайла
//	Фильтр		- Строка - строка с набором файловых фильтров
//	Заголовок	- Строка - текст заголовка окна диалога выбора файла
//	ИмяФайла	- Строка - начальное полное имя файла
//	Каталог		- Строка - значение текущего каталога
//
// Возвращаемое значение:
//	Строка - путь к файлу или пустая строка
//	Неопределено - если не подключено расширение
//
Асинх Функция ВыбратьФайл(знач Режим, знач Фильтр, знач Заголовок = "", знач ИмяФайла = "", знач Каталог = "") Экспорт 
	
	Возврат Ждать ВыбратьФайлыСлужебный(Режим,
		Фильтр,
		Ложь,
		Заголовок,
		ИмяФайла,
		Каталог);
	
КонецФункции

// Предлагает пользователю установить расширение для работы с 1С:Предприятием в веб-клиенте.
// Предназначена для использования в начале участков кода, в которых ведется работа с файлами.
//
// Возвращаемое значение:
//	Булево - результат подключения расширения для работы с файлами
//
Асинх Функция ПодключитьРасширениеДляРаботыСФайлами() Экспорт
	
	#Если НЕ ВебКлиент Тогда
		ОтключитьПредложениеУстановкиРасширения();
		Возврат Истина;
	#КонецЕсли
	
	РасширениеПодключено = Ждать ПодключитьРасширениеРаботыСФайламиАсинх();

	Если РасширениеПодключено Тогда
		ОтключитьПредложениеУстановкиРасширения();
		Возврат Истина;
	КонецЕсли;
	
	Если ОбщегоНазначенияКлиент.ЭтоMacOSКлиент() Тогда
		ОбщегоНазначенияКлиент.СообщитьПользователю(НСтр("ru='Расширение для работы с файлами недоступно на MacOS.'"));
		Возврат Ложь;
	КонецЕсли;
	
	ИмяПараметра = "СтандартныеПодсистемы.ПредлагатьУстановкуРасширенияРаботыСФайлами";
	ПервоеОбращениеЗаСеанс = ПараметрыПриложения[ИмяПараметра] = Неопределено;
	Если ПараметрыПриложения[ИмяПараметра] = Неопределено Тогда
		ПараметрыПриложения.Вставить(ИмяПараметра, ПредлагатьУстановкуРасширенияРаботыСФайлами());
	КонецЕсли;
	
	ПредлагатьУстановкуРасширенияРаботыСФайлами = ПараметрыПриложения[ИмяПараметра] Или ПервоеОбращениеЗаСеанс;
	Если НЕ ПредлагатьУстановкуРасширенияРаботыСФайлами Тогда
		
		Возврат Истина;
		
	Иначе 

		СписокКнопок = Новый СписокЗначений;
		СписокКнопок.Добавить(КодВозвратаДиалога.Да, НСтр("ru='Установить и продолжить'"));
		СписокКнопок.Добавить(КодВозвратаДиалога.Нет, НСтр("ru='Продолжить без установки'"));
		СписокКнопок.Добавить(КодВозвратаДиалога.Отмена, НСтр("ru='Больше не напоминать'"));
		
		ТекстВопроса = НСтр("ru='Для удобной работы с программой предлагается установить расширение для работы с 1С:Предприятием. 
			|Установить?'");
		
		ОтветПользователя = Ждать ВопросАсинх(ТекстВопроса,
			СписокКнопок,
			30,
			КодВозвратаДиалога.Да,
			НСтр("ru='Установка расширения работы с файлами'"),
			КодВозвратаДиалога.Нет);
			
		Если ОтветПользователя = КодВозвратаДиалога.Да Тогда
			
			Ждать УстановитьРасширениеРаботыСФайламиАсинх();
			
		ИначеЕсли ОтветПользователя = КодВозвратаДиалога.Отмена Тогда
			
			ОтключитьПредложениеУстановкиРасширения();
			
		КонецЕсли;
		
		РасширениеПодключено = Ждать ПодключитьРасширениеРаботыСФайламиАсинх();

		Если РасширениеПодключено Тогда
			ОтключитьПредложениеУстановкиРасширения();
			Возврат Истина;
		КонецЕсли;
		
	КонецЕсли;

	Возврат Ложь;
	
КонецФункции

// Выполняет вывод сообщения или предупреждения об отсутствии подключенного расширения 
//	Если не указано как сообщение или как исключение, вывод будет в режиме предупреждения
//
// Параметры:
//	КакСообщение	- Булево - вывод как сообщения пользователю
//	КакИсключение	- Булево - если не КакСообщение тогда возможно вывод как исключения
//
Процедура СообщитьОшибкуПодключенияРасширения(знач КакСообщение = Ложь, знач КакИсключение = Ложь) Экспорт
	Текст = НСтр("ru='Для работы с файлами требуется подключить расширение (недоступно на MacOS).'");
	Если КакСообщение = Истина Тогда
		ОбщегоНазначенияКлиент.СообщитьПользователю(Текст);
	ИначеЕсли КакИсключение = Истина Тогда
		ВызватьИсключение Текст;
	Иначе 
		ПоказатьПредупреждение(, Текст, 30);
	КонецЕсли;
КонецПроцедуры

#Область СлужебныеПроцедурыИФункции

Процедура ОтключитьПредложениеУстановкиРасширения()
	
	СистемнаяИнформация = Новый СистемнаяИнформация();
	ИдентификаторКлиента = СистемнаяИнформация.ИдентификаторКлиента;
	ПараметрыПриложения["СтандартныеПодсистемы.ПредлагатьУстановкуРасширенияРаботыСФайлами"] = Ложь;
	ОбщегоНазначенияВызовСервера.ХранилищеОбщихНастроекСохранить(
		"НастройкиПрограммы/ПредлагатьУстановкуРасширенияРаботыСФайлами", ИдентификаторКлиента, Ложь);
	
КонецПроцедуры

Асинх Функция ВыбратьФайлыСлужебный(знач Режим, знач Фильтр, знач КакМассив,
	знач Заголовок = "",
	знач ИмяФайла = "",
	знач Каталог = "") 
	
	РасширениеПодключено = Ждать ПодключитьРасширениеДляРаботыСФайлами();
	Если НЕ РасширениеПодключено Тогда
		Возврат Неопределено;
	КонецЕсли;
	
	Диалог = Новый ДиалогВыбораФайла(Режим);
	Диалог.МножественныйВыбор = КакМассив;
	Диалог.ПроверятьСуществованиеФайла = (КакМассив = РежимДиалогаВыбораФайла.Открытие);
	Диалог.Фильтр			= Фильтр;
	Диалог.Заголовок		= Заголовок;
	Диалог.ПолноеИмяФайла	= ИмяФайла;
	Диалог.Каталог			= Каталог;

	РезультатВыбора = Ждать Диалог.ВыбратьАсинх();
	
	Если КакМассив Тогда
		Результат = ?(НЕ ТипЗнч(РезультатВыбора) = Тип("Массив"),
			Новый Массив, 
			РезультатВыбора);
	Иначе
		Результат = ?(РезультатВыбора = Неопределено ИЛИ РезультатВыбора.Количество() = 0,
			"", 
			РезультатВыбора[0]); 
	КонецЕсли;
		
	Возврат Результат;	
КонецФункции

Функция ПредлагатьУстановкуРасширенияРаботыСФайлами()
	
	СистемнаяИнформация = Новый СистемнаяИнформация();
	ИдентификаторКлиента = СистемнаяИнформация.ИдентификаторКлиента;
	Возврат ОбщегоНазначенияВызовСервера.ХранилищеОбщихНастроекЗагрузить(
		"НастройкиПрограммы/ПредлагатьУстановкуРасширенияРаботыСФайлами", ИдентификаторКлиента, Истина);
	
КонецФункции

#КонецОбласти

#КонецОбласти

