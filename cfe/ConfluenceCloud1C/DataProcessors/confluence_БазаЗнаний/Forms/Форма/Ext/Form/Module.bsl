﻿
#Область УправлениеФормой

&НаКлиентеНаСервереБезКонтекста
Процедура УстановитьУсловноеОформлениеРеквизита(Форма, Обработано, ИмяРеквизита)

	Если НЕ Обработано.Найти(ИмяРеквизита) = Неопределено Тогда
		Возврат;
	КонецЕсли;
	Обработано.Добавить(ИмяРеквизита);

	Элементы	= Форма.Элементы;
	Объект		= Форма.Объект;
	
	ПанельНастройкиОтбора = (Элементы.ФормаОткрытьНастройкиПоиска.Пометка = Истина);

	#Область Наборы
	
	Если ИмяРеквизита = "РеквизитыПериодСоздания" ИЛИ ПустаяСтрока(ИмяРеквизита) Тогда
		УстановитьУсловноеОформлениеРеквизита(Форма, Обработано, "ДатаСозданияОт");
		УстановитьУсловноеОформлениеРеквизита(Форма, Обработано, "ДатаСозданияДо");
	КонецЕсли;
	
	Если ИмяРеквизита = "РеквизитыПериодИзменения" ИЛИ ПустаяСтрока(ИмяРеквизита) Тогда
		УстановитьУсловноеОформлениеРеквизита(Форма, Обработано, "ДатаИзмененияОт");
		УстановитьУсловноеОформлениеРеквизита(Форма, Обработано, "ДатаИзмененияДо");
	КонецЕсли;

	Если ИмяРеквизита = "РеквизитыРежимПоиска" ИЛИ ПустаяСтрока(ИмяРеквизита) Тогда
		УстановитьУсловноеОформлениеРеквизита(Форма, Обработано, "ПанельСодержаниеПоиск");
		//УстановитьУсловноеОформлениеРеквизита(Форма, Обработано, "ГруппаРезультат");
	КонецЕсли;
	
	#КонецОбласти
	
	#Область Элементы
	
	Если ИмяРеквизита = "КлючПространства" ИЛИ ПустаяСтрока(ИмяРеквизита) Тогда
		ОбщегоНазначенияКлиентСервер.УстановитьСвойствоЭлементаФормы(Элементы,
			"КлючПространства", "Видимость", НЕ Объект.СкрытьПолеВводаРаздела);
	КонецЕсли;

	Если ИмяРеквизита = "ПанельСодержаниеПоиск" Тогда
		ТекСтраница = ?(Элементы.ФормаОткрытьНастройкиПоиска.Пометка,
			Элементы.СтраницаПоиск,
			Элементы.СтраницаСодержание);
		
		ОбщегоНазначенияКлиентСервер.УстановитьСвойствоЭлементаФормы(Элементы,
			"ПанельСодержаниеПоиск", "ТекущаяСтраница", ТекСтраница);
	КонецЕсли;
	
	Если ИмяРеквизита = "ДатаСозданияОт" Тогда
		ОбщегоНазначенияКлиентСервер.УстановитьСвойствоЭлементаФормы(Элементы,
			"ДатаСозданияОт", "Видимость", Форма.ПериодСоздания = 5);
	КонецЕсли;

	Если ИмяРеквизита = "ДатаСозданияДо" Тогда
		ОбщегоНазначенияКлиентСервер.УстановитьСвойствоЭлементаФормы(Элементы,
			"ДатаСозданияДо", "Видимость", Форма.ПериодСоздания = 5);
	КонецЕсли;

	Если ИмяРеквизита = "ДатаИзмененияОт" Тогда
		ОбщегоНазначенияКлиентСервер.УстановитьСвойствоЭлементаФормы(Элементы,
			"ДатаИзмененияОт", "Видимость", Форма.ПериодИзменения = 5);
	КонецЕсли;

	Если ИмяРеквизита = "ДатаИзмененияДо" Тогда
		ОбщегоНазначенияКлиентСервер.УстановитьСвойствоЭлементаФормы(Элементы,
			"ДатаИзмененияДо", "Видимость", Форма.ПериодИзменения = 5);
	КонецЕсли;
	
	#КонецОбласти 
	
	#Область ТабЧасть_Имя
	
	//Если ИмяРеквизита = "ИмяТабличнойЧастиОтветственный" ИЛИ ПустаяСтрока(ИмяРеквизита) Тогда
	//	ОбщегоНазначенияКлиентСервер.УстановитьСвойствоЭлементаФормы(Элементы,
	//		"ИмяТабличнойЧастиОтветственный", "ТолькоПросмотр", ЗначениеЗаполнено(Объект.Ответственный));
	//КонецЕсли;

	#КонецОбласти
	
	#Область Команды
	
	//Если ИмяРеквизита = "КомандаЗаполнить" ИЛИ ПустаяСтрока(ИмяРеквизита) Тогда
	//	ОбщегоНазначенияКлиентСервер.УстановитьСвойствоЭлементаФормы(Элементы,
	//		"ТаблицаФормыЗаполнить", "Видимость", НЕ Объект.Проведен);
	//КонецЕсли;

	#КонецОбласти 
	
КонецПроцедуры

&НаКлиентеНаСервереБезКонтекста
Процедура УстановитьУсловноеОформление(Форма, ИменаРеквизитов = "")

	Если ТипЗнч(ИменаРеквизитов) = Тип("Строка") Тогда
		Если ПустаяСтрока(ИменаРеквизитов) Тогда
			МассивИмен = Новый Массив;
			МассивИмен.Добавить("");
		Иначе
			МассивИмен = СтроковыеФункцииКлиентСервер.РазложитьСтрокуВМассивПодстрок(ИменаРеквизитов, ",");
		КонецЕсли;
	ИначеЕсли ТипЗнч(ИменаРеквизитов) = Тип("Массив") Тогда
		МассивИмен = ОбщегоНазначенияКлиентСервер.СкопироватьМассив(ИменаРеквизитов);
	Иначе
		Возврат;
	КонецЕсли;
 
	//Форма.ТолькоПросмотр = (Форма.СостоянияЗаблокировано.Найти(Форма.СведенияОЗаявкеСостояние) <> Неопределено);

	Обработано = Новый Массив;
	Для Каждого ИмяРеквизита Из МассивИмен Цикл
		УстановитьУсловноеОформлениеРеквизита(Форма, Обработано, СокрЛП(ИмяРеквизита));
	КонецЦикла;

КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовШапкиФормы

&НаКлиенте
Процедура КлючПространстваПриИзменении(Элемент)
	
	ОбновитьДеревоСтраницНаКлиенте();
	
КонецПроцедуры

&НаКлиенте
Процедура ПолеHTMLПриНажатии(Элемент, ДанныеСобытия, СтандартнаяОбработка)
	Если НЕ СтрНачинаетсяС(ДанныеСобытия.Href, Объект.АдресСервера) Тогда
		Возврат;
	КонецЕсли;
	
	Попытка
		ДанныеСсылки = ПолучитьДанныеСсылкиПоЭлементу(ДанныеСобытия.Anchor.dataset);
	Исключение
		ДанныеСсылки = ПолучитьДанныеСсылкиПоЭлементу(Новый Структура);
	КонецПопытки;
	
	ПолныйАдресСсылки		= ДанныеСобытия.href;
	ТипДанныхСсылки			= ДанныеСсылки.linkedResourceType;
	ИдентификаторСтраницы	= ДанныеСсылки.linkedResourceId;
	
	Если ТипДанныхСсылки = "page" Тогда
		СтандартнаяОбработка = Ложь;
		ВыполнитьПереходНаСтраницу(ИдентификаторСтраницы);
	ИначеЕсли ЗначениеЗаполнено(ДанныеСсылки.imageSrc) Тогда
		СтандартнаяОбработка = Ложь;
		ОткрытьКартинкуВНовомОкне(ДанныеСсылки.imageSrc);
	ИначеЕсли НЕ ПустаяСтрока(ПолныйАдресСсылки) И Объект.ОткрыватьВнешниеСсылкиВ1С = Ложь Тогда
		СтандартнаяОбработка = Ложь;
		ЗапуститьПриложение(ПолныйАдресСсылки,, Ложь);
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура ПериодСозданияПриИзменении(Элемент)
	
	СтруктураПериод = ПолучитьПериодПоЗначению(ЭтотОбъект.ПериодСоздания);
	Если ЭтотОбъект.ПериодСоздания <> 5 Тогда
		ЭтотОбъект.ДатаСозданияОт = СтруктураПериод.Начало;
		ЭтотОбъект.ДатаСозданияДо = СтруктураПериод.Конец;
	КонецЕсли;
	
	УстановитьУсловноеОформление(ЭтотОбъект, "РеквизитыПериодСоздания");
	
КонецПроцедуры

&НаКлиенте
Процедура ПериодИзмененияПриИзменении(Элемент)
	
	СтруктураПериод = ПолучитьПериодПоЗначению(ЭтотОбъект.ПериодИзменения);
	Если ЭтотОбъект.ПериодИзменения <> 5 Тогда
		ЭтотОбъект.ДатаИзмененияОт = СтруктураПериод.Начало;
		ЭтотОбъект.ДатаИзмененияДо = СтруктураПериод.Конец;
	КонецЕсли;
	
	УстановитьУсловноеОформление(ЭтотОбъект, "РеквизитыПериодИзменения");
	
КонецПроцедуры

&НаКлиенте
Процедура СтрокаПоискаПриИзменении(Элемент)
	
	ВыполнитьПоискНаКлиенте(1);
	
КонецПроцедуры

&НаКлиенте
Процедура ДекорацияПереключениеСтраницОбработкаНавигационнойСсылки(Элемент, НавигационнаяСсылкаФорматированнойСтроки, СтандартнаяОбработка)
	СтандартнаяОбработка = Ложь;
	
	Если НавигационнаяСсылкаФорматированнойСтроки = "ПерваяСтраница" Тогда
		ВыполнитьПоискНаКлиенте(1);
	ИначеЕсли НавигационнаяСсылкаФорматированнойСтроки = "ПредыдущаяСтраница" И ЭтотОбъект.ТекущаяСтраницаПоиска - 1 > 0 Тогда
		ВыполнитьПоискНаКлиенте(ЭтотОбъект.ТекущаяСтраницаПоиска - 1);
	ИначеЕсли НавигационнаяСсылкаФорматированнойСтроки = "СледующаяСтраница" И ЭтотОбъект.ТекущаяСтраницаПоиска + 1 <= ЭтотОбъект.КоличествоСтраниц Тогда
		ВыполнитьПоискНаКлиенте(ЭтотОбъект.ТекущаяСтраницаПоиска + 1);
	ИначеЕсли НавигационнаяСсылкаФорматированнойСтроки = "ПоследняяСтраница" Тогда
		ВыполнитьПоискНаКлиенте(ЭтотОбъект.КоличествоСтраниц);
	ИначеЕсли СтрНачинаетсяС(НавигационнаяСсылкаФорматированнойСтроки, "Страница_") Тогда
		СтрНомерСтраницы = Сред(НавигационнаяСсылкаФорматированнойСтроки, 10);
		ВыполнитьПоискНаКлиенте(Число(СтрНомерСтраницы));
	КонецЕсли;
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормы_ДеревоСтраниц

&НаКлиенте
Процедура ДеревоСтраницПередРазворачиванием(Элемент, Строка, Отказ)
	ТекущиеДанные = ЭтотОбъект.ДеревоСтраниц.НайтиПоИдентификатору(Строка);
	Если ТекущиеДанные = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	Если ТекущиеДанные.ПодчиненныеЗаполнены Тогда
		Возврат;
	КонецЕсли;
	
	ЗаполнитьПодчиненныеСтраницыДереваНаКлиенте(ТекущиеДанные, ТекущиеДанные.Идентификатор);
	ТекущиеДанные.ПодчиненныеЗаполнены = Истина;
КонецПроцедуры

&НаКлиенте
Процедура ДеревоСтраницПриАктивизацииСтроки(Элемент)
	ТекущиеДанные = Элементы.ДеревоСтраниц.ТекущиеДанные;
	Если ТекущиеДанные = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	Если НЕ ЭтотОбъект.ТекущаяСтраницаИдентификатор = ТекущиеДанные.Идентификатор Тогда
		ВыполнитьПереходНаСтраницу(ТекущиеДанные.Идентификатор);
	КонецЕсли;
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормы_РезультатПоиска

&НаКлиенте
Процедура РезультатПоискаВыбор(Элемент, ВыбраннаяСтрока, Поле, СтандартнаяОбработка)
	
	ТекущиеДанные = Элементы.РезультатПоиска.ТекущиеДанные;
	Если ТекущиеДанные = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	Если Поле.Имя = "РезультатПоискаЗаголовок" И ЗначениеЗаполнено(ТекущиеДанные.Идентификатор) Тогда
		СтандартнаяОбработка = Ложь;
		ВыполнитьПереходНаСтраницу(ТекущиеДанные.Идентификатор);
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти
 
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	ЗаполнитьНастройкиИзХранилищаНаСервере();
	
	НачальнаяСтраница	= Обработки.confluence_БазаЗнаний.ПолучитьМакет("НачальнаяСтраница");
	МакетРезультат		= Обработки.confluence_БазаЗнаний.ПолучитьМакет("МакетРезультатПоиска");
	СтрокаРезультат		= Обработки.confluence_БазаЗнаний.ПолучитьМакет("СтрокаРезультатПоиска");
	СовпаденийНеНайдено	= Обработки.confluence_БазаЗнаний.ПолучитьМакет("СовпаденийНеНайдено");
	
	ЭтотОбъект.МакетНачальнаяСтраница	= НачальнаяСтраница.ПолучитьТекст();
	ЭтотОбъект.МакетОснование			= МакетРезультат.ПолучитьТекст();
	ЭтотОбъект.МакетСтрокаРезультата	= СтрокаРезультат.ПолучитьТекст();
	ЭтотОбъект.МакетСовпаденийНеНайдено	= СовпаденийНеНайдено.ПолучитьТекст();
	
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
	#Если ВебКлиент Тогда
	    ПоказатьПредупреждение(, НСтр("ru='Веб-клиент не поддерживается. Рекомендуем использовать тонкий клиент.'"), 60); 
		Отказ = Истина;
		Возврат;
	#КонецЕсли 
	
	Если НЕ ЗначениеЗаполнено(Объект.АдресСервера) Тогда
		ПредложитьВыполнитьНастройкиНаКлиенте();
	Иначе 
		ОбновитьТаблицуПространстваНаКлиенте();
		ОбновитьСписокВыбораПространствНаКлиенте();
		ОбновитьДеревоСтраницНаКлиенте();
	КонецЕсли;
	
	ОбновитьНумерациюСтраницПоиска();
	ОбновитьИтоговуюСтатистикуПоиска();
	
	УстановитьУсловноеОформление(ЭтотОбъект);
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура ОткрытьНастройкиПользователя(Команда)
	
	ОткрытьФормуНастройкиНаКлиенте();
	
КонецПроцедуры

&НаКлиенте
Процедура ОткрытьНастройкиПоиска(Команда)
	Элементы.ФормаОткрытьНастройкиПоиска.Пометка = НЕ Элементы.ФормаОткрытьНастройкиПоиска.Пометка;
	
	УстановитьУсловноеОформление(ЭтотОбъект, "РеквизитыРежимПоиска");
КонецПроцедуры

&НаКлиенте
Процедура ВыполнитьПоиск(Команда)
	
	ВыполнитьПоискНаКлиенте(1);
	
КонецПроцедуры

&НаКлиенте
Процедура ОбновитьТекущуюСтраницу(Команда)
	Если НЕ ЗначениеЗаполнено(ЭтотОбъект.ТекущаяСтраницаИдентификатор) Тогда
		Возврат;
	КонецЕсли;
	
	ВыполнитьПереходНаСтраницу(ЭтотОбъект.ТекущаяСтраницаИдентификатор);
КонецПроцедуры

#КонецОбласти

#Область ЗавершениеНемодальныхВызовов
 
&НаКлиенте
Процедура ВыполнитьНастройкиВопросЗавершение(РезультатВопроса, ПараметрыВыполнения) Экспорт
	Если НЕ РезультатВопроса = КодВозвратаДиалога.ОК Тогда
		ЭтотОбъект.Закрыть();
		Возврат;
	КонецЕсли;
	
	ОткрытьФормуНастройкиНаКлиенте();
КонецПроцедуры

&НаКлиенте
Процедура ВыполнениеНастройкиЗавершение(Результат, ДопПараметры) Экспорт	
	Если НЕ ТипЗнч(Результат) = Тип("Структура") Тогда
		Возврат;
	КонецЕсли;
	
	ЗаполнитьНастройкиИзХранилищаНаСервере();
	
	Если ПустаяСтрока(Объект.АдресСервера) Тогда
		Возврат;
	КонецЕсли;
		
	ОбновитьТаблицуПространстваНаКлиенте();
	ОбновитьСписокВыбораПространствНаКлиенте();
	ОбновитьДеревоСтраницНаКлиенте();
	
	УстановитьУсловноеОформление(ЭтотОбъект);
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте 
Процедура ПредложитьВыполнитьНастройкиНаКлиенте()
	
	ОписаниеОповещения = Новый ОписаниеОповещения("ВыполнитьНастройкиВопросЗавершение", ЭтотОбъект);
	
	ПоказатьВопрос(ОписаниеОповещения,
		НСтр("ru='Обработке требуется выполнить настройку. Открыть форму настройки?'"),
		РежимДиалогаВопрос.ОКОтмена,
		60,
		КодВозвратаДиалога.ОК,,
		КодВозвратаДиалога.Отмена);
	
КонецПроцедуры

&НаКлиенте 
Процедура ОткрытьФормуНастройкиНаКлиенте()
	ОписаниеОповещения = Новый ОписаниеОповещения("ВыполнениеНастройкиЗавершение", ЭтотОбъект);
	
	ОткрытьФорму("Обработка.confluence_БазаЗнаний.Форма.ФормаНастройки",,
		ЭтотОбъект,,,,
		ОписаниеОповещения,
		РежимОткрытияОкнаФормы.БлокироватьОкноВладельца);
КонецПроцедуры

&НаКлиенте
Процедура ОбновитьТаблицуПространстваНаКлиенте()
	ЭтотОбъект.Пространства.Очистить();
	
	РезультатЗапроса = ПолучитьПространстваНаКлиенте();
	Если РезультатЗапроса = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	НастройкиПодключения = ПолучитьНастройкиПодключенияНаКлиенте();
	
	Для Каждого СтруктураРаздела Из РезультатЗапроса.Значения Цикл
		НоваяСтрока = ЭтотОбъект.Пространства.Добавить();
		ЗаполнитьЗначенияСвойств(НоваяСтрока, СтруктураРаздела);
		
		НоваяСтрока.СтраницаИдентификатор = ОбщегоНазначенияКлиентСервер.СвойствоСтруктуры(
			СтруктураРаздела.ДомашняяСтраница, "Идентификатор");
			
		НоваяСтрока.СсылкаПросмотр = НастройкиПодключения.АдресСервераWiki + СтруктураРаздела.ДомашняяСтраница.Ссылки.Просмотр;
	КонецЦикла;
КонецПроцедуры

&НаКлиенте 
Процедура ОбновитьСписокВыбораПространствНаКлиенте()
	Элементы.КлючПространства.СписокВыбора.Очистить();
	
	Для Каждого СтрокаТаблицы Из ЭтотОбъект.Пространства Цикл
		Элементы.КлючПространства.СписокВыбора.Добавить(СтрокаТаблицы.Ключ, СтрокаТаблицы.Наименование);
	КонецЦикла;
	
	Если Элементы.КлючПространства.СписокВыбора.НайтиПоЗначению(Объект.КлючПространства) = Неопределено Тогда
		Объект.КлючПространства = "";
	Иначе
		Объект.КлючПространства = Объект.КлючПространства;
	КонецЕсли;
КонецПроцедуры

&НаКлиенте 
Процедура ОбновитьДеревоСтраницНаКлиенте()
	
	СтраницаПространства = ПолучитьИдентификаторСтраницыПространстваНаСервере();
	Если ПустаяСтрока(СтраницаПространства) Тогда 
		ОбщегоНазначенияКлиентСервер.СообщитьПользователю(
			НСтр("ru='Не указано пространство'"), ,
			"ИдентификаторПространства"); 
		Возврат;
	КонецЕсли;
	
	ДоступныеСтраницы = Новый Массив;
	Для Каждого СтрокаТаблицы Из Объект.ДоступныеСтраницы Цикл 
		ДоступныеСтраницы.Добавить(СтрокаТаблицы.Идентификатор);
	КонецЦикла;
	
	ЗаполнитьПодчиненныеСтраницыДереваНаКлиенте(ЭтотОбъект.ДеревоСтраниц, СтраницаПространства, ДоступныеСтраницы);
	
КонецПроцедуры

&НаКлиенте 
Процедура ЗаполнитьПодчиненныеСтраницыДереваНаКлиенте(знач ЭлементРодитель, знач ИдентификаторРодитель, знач ДоступныеСтраницы = Неопределено)
	
	ЭлементРодитель.ПолучитьЭлементы().Очистить();
	
	ЕстьОграничения = (ТипЗнч(ДоступныеСтраницы) = Тип("Массив") И ДоступныеСтраницы.Количество() > 0);
	
	РезультатЗапроса = ПолучитьСтраницыПространстваНаКлиенте(ИдентификаторРодитель);
	Если РезультатЗапроса = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	НастройкиПодключения = ПолучитьНастройкиПодключенияНаКлиенте();
	
	Для Каждого СтруктураКонтента Из РезультатЗапроса.Значения Цикл
		Если ЕстьОграничения И ДоступныеСтраницы.Найти(СтруктураКонтента.Идентификатор) = Неопределено Тогда
			Продолжить;
		КонецЕсли;
		
		НоваяСтрока = ЭлементРодитель.ПолучитьЭлементы().Добавить();
		ЗаполнитьЗначенияСвойств(НоваяСтрока, СтруктураКонтента);
		
		НоваяСтрока.СсылкаПросмотр = НастройкиПодключения.АдресСервераWiki + СтруктураКонтента.Ссылки.Просмотр;
		
		// если существуют подчиненные
		Если НоваяСтрока.ЕстьПодчиненные Тогда
			НоваяСтрока.ПолучитьЭлементы().Добавить();
		КонецЕсли;
	КонецЦикла;
	
КонецПроцедуры

&НаКлиенте 
Функция ПолучитьДанныеСсылкиПоЭлементу(знач dataset)
	ИменаКолонок = "baseUrl,height,imageSrc,linkedResourceContainerId,linkedResourceContainerVersion"
		+ ",linkedResourceContentType,linkedResourceDefaultAlias,linkedResourceId,linkedResourceType"
		+ ",linkedResourceVersion,mediaId,mediaType,unresolvedCommentCount,width";
		
	Структура = Новый Структура(ИменаКолонок);
	ЗаполнитьЗначенияСвойств(Структура, dataset);
	
	Возврат Структура;
КонецФункции

&НаКлиентеНаСервереБезКонтекста 
Функция ПолучитьПериодПоЗначению(знач Период)
	СтруктураПериод = Новый Структура("Начало, Конец");
	
	#Если Сервер Тогда
		ТекущаяДата = НачалоДня(ТекущаяДатаСеанса());
	#Иначе
		ТекущаяДата = НачалоДня(ОбщегоНазначенияКлиент.ДатаСеанса());
	#КонецЕсли
	
	// без отбора(0), Последние сутки(1), Последняя неделя(2), Последний месяц(3), Последний год(4), Произвольный период(5)
	Если Период = 1 Тогда
		СтруктураПериод.Начало	= НачалоДня(ТекущаяДата - 1);
		СтруктураПериод.Конец	= ТекущаяДата;
	ИначеЕсли Период = 2 Тогда
		СтруктураПериод.Начало	= ТекущаяДата - ОбщегоНазначенияПТБКлиентСервер.НеделяВСекундах();
		СтруктураПериод.Конец	= ТекущаяДата;
	ИначеЕсли Период = 3 Тогда
		СтруктураПериод.Начало	= ДобавитьМесяц(ТекущаяДата, -1);
		СтруктураПериод.Конец	= ТекущаяДата;
	ИначеЕсли Период = 4 Тогда
		СтруктураПериод.Начало	= ДобавитьМесяц(ТекущаяДата, -12);
		СтруктураПериод.Конец	= ТекущаяДата;
	КонецЕсли;
	
	Возврат СтруктураПериод;
КонецФункции

&НаСервере 
Процедура ЗаполнитьНастройкиИзХранилищаНаСервере()
	ОбъектФормы	= ЭтотОбъект.РеквизитФормыВЗначение("Объект");
	Настройки	= Обработки.confluence_БазаЗнаний.ПолучитьНастройкиИзХранилища();
	
	Обработки.confluence_БазаЗнаний.НастройкиВОбъектФормы(ОбъектФормы, Настройки);
	
	ЭтотОбъект.ЗначениеВРеквизитФормы(ОбъектФормы, "Объект");
КонецПроцедуры

&НаСервере 
Функция ПолучитьИдентификаторСтраницыПространстваНаСервере()
	СтруктураОтбора = Новый Структура("Ключ", Объект.КлючПространства);
	СтрокиПространства = ЭтотОбъект.Пространства.НайтиСтроки(СтруктураОтбора);
	Если СтрокиПространства.Количество() = 0 Тогда
		Возврат "";
	КонецЕсли;
	
	Возврат СтрокиПространства[0].СтраницаИдентификатор;
КонецФункции

#КонецОбласти

#Область СлужебныеПроцедурыИФункции_ОбменСConfluence

&НаКлиенте 
Функция ПолучитьНастройкиПодключенияНаКлиенте()
	Возврат confluence_ApiClientServer.get_connection_settings(Объект.АдресСервера,
		Объект.ПользовательЛогин,
		Объект.ПользовательТокен);
КонецФункции

&НаКлиенте 
Функция ПолучитьПространстваНаКлиенте()
	НастройкиПодключения	= ПолучитьНастройкиПодключенияНаКлиенте();
	ПараметрыЗапроса		= confluence_ApiClientServer.get_all_spaces_params(0, 0); 
	
	РезультатЗапроса = confluence_ApiClientServer.get_all_spaces(НастройкиПодключения, ПараметрыЗапроса); 
	Если confluence_ApiClientServer.check_error(РезультатЗапроса, Истина) Тогда
		Возврат Неопределено;
	КонецЕсли;
	
	Возврат РезультатЗапроса;
КонецФункции

&НаКлиенте 
Функция ПолучитьСтраницыПространстваНаКлиенте(знач ИдентификаторРодитель)
	НастройкиПодключения	= ПолучитьНастройкиПодключенияНаКлиенте();
	ПараметрыЗапроса		= confluence_ApiClientServer.get_page_child_by_type_params(0, 0);
	
	РезультатЗапроса = confluence_ApiClientServer.get_child_pages(НастройкиПодключения, ИдентификаторРодитель);
	Если confluence_ApiClientServer.check_error(РезультатЗапроса, Истина) Тогда
		Возврат Неопределено;
	КонецЕсли;
	
	Возврат РезультатЗапроса;
КонецФункции

&НаКлиенте 
Функция ПолучитьСодержимоеТекущейСтраницыНаКлиенте()
	НастройкиПодключения = confluence_ApiClientServer.get_connection_settings(Объект.АдресСервера);
	
	СтруктураКонтента = confluence_ApiClientServer.get_page_content(НастройкиПодключения, ЭтотОбъект.ТекущаяСтраницаИдентификатор);
	Если confluence_ApiClientServer.check_error(СтруктураКонтента, Истина) Тогда
		Возврат "";
	КонецЕсли;
	
	ЭтотОбъект.ТекущаяСтраницаПредставление = СтруктураКонтента.Заголовок;
	
	Возврат confluence_ApiClientServer.convert_storage_to_view(НастройкиПодключения, СтруктураКонтента); 
КонецФункции

#КонецОбласти
 
#Область СлужебныеПроцедурыИФункции_ОткрытиеСтраниц

&НаКлиенте 
Процедура ВыполнитьПереходНаСтраницуРаздела()
	СтраницаПространства = ПолучитьИдентификаторСтраницыПространстваНаСервере();
	Если НЕ ПустаяСтрока(СтраницаПространства) Тогда
		ВыполнитьПереходНаСтраницу(СтраницаПространства);
	КонецЕсли;
КонецПроцедуры

&НаКлиенте 
Процедура ВыполнитьПереходНаСтраницу(знач ИдентификаторСтраницы)
	Если НЕ ЗначениеЗаполнено(ИдентификаторСтраницы) Тогда
		Возврат;
	КонецЕсли;
	
	ЭтотОбъект.ТекущаяСтраницаИдентификатор = ИдентификаторСтраницы;
	
	ЭтотОбъект.ПолеHTML = ПолучитьСодержимоеТекущейСтраницыНаКлиенте();
	
	УстановитьУсловноеОформление(ЭтотОбъект, "РеквизитыРежимПоиска");
КонецПроцедуры

&НаКлиенте 
Процедура ОткрытьКартинкуВНовомОкне(знач ПутьККартинке)
	ПараметрыФормы = Новый Структура;
	ПараметрыФормы.Вставить("ПутьККартинке", ПутьККартинке);
	
	ОткрытьФорму("Обработка.confluence_БазаЗнаний.Форма.ФормаПросмотраКартинок",
		ПараметрыФормы,
		ЭтотОбъект,,,,,
		РежимОткрытияОкнаФормы.БлокироватьОкноВладельца);
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции_Поиск

&НаКлиенте 
Процедура ВыполнитьПоискНаКлиенте(знач НомерСтраницы = 1)
	
	НастройкиПодключения	= confluence_ApiClientServer.get_connection_settings(Объект.АдресСервера);
	ПараметрыЗапроса		= confluence_ApiClientServer.cql_params();
	
	ТекстОтбора = ПолучитьТекстЗапросаПоиска(НомерСтраницы);
	
	Если НомерСтраницы <> 1 Тогда
		ПараметрыЗапроса.Начало = (НомерСтраницы - 1) * ПараметрыЗапроса.Количество + 1;
	КонецЕсли;
	
	ДанныеПоиска = confluence_ApiClientServer.cql(НастройкиПодключения, ТекстОтбора, "", ПараметрыЗапроса);
	Если confluence_ApiClientServer.check_error(ДанныеПоиска, Истина) Тогда
		Возврат;
	КонецЕсли;
	
	ЭтотОбъект.КоличествоСтраниц = Цел(ДанныеПоиска.ВсегоКоличество / ДанныеПоиска.Ограничение)
		+ ?(ДанныеПоиска.ВсегоКоличество % ДанныеПоиска.Ограничение > 0, 1, 0);
	
	СтруктураДанныеПоиска = Новый Структура("Начало, Ограничение, РазмерВыборки, ВсегоКоличество, СтрокаЗапроса, ВремяПоиска");
	ЗаполнитьЗначенияСвойств(СтруктураДанныеПоиска, ДанныеПоиска);
	
	ЭтотОбъект.ПоследнийПоиск			= Новый ФиксированнаяСтруктура(СтруктураДанныеПоиска);
	ЭтотОбъект.ТекущаяСтраницаПоиска	= НомерСтраницы;
	
	ВывестиРезультатПоискаНаФорму(ДанныеПоиска.Значения);
	ОбновитьНумерациюСтраницПоиска();
	ОбновитьИтоговуюСтатистикуПоиска();
	
	УстановитьУсловноеОформление(ЭтотОбъект, "РеквизитыРежимПоиска");
	
КонецПроцедуры

&НаКлиенте 
Процедура ВывестиРезультатПоискаНаФорму(знач МассивКонтента)
	ЭтотОбъект.РезультатПоиска.Очистить();
	
	СтрокиРезультат = Новый Массив;
	Для Каждого СтруктураРезультат Из МассивКонтента Цикл
		СтрокаТаблицы = ЭтотОбъект.РезультатПоиска.Добавить();
		СтрокаТаблицы.Идентификатор		= СтруктураРезультат.Контент.Идентификатор;
		СтрокаТаблицы.Заголовок			= СтруктураРезультат.Заголовок;
		СтрокаТаблицы.СсылкаПросмотр	= СтруктураРезультат.Ссылка;
		СтрокаТаблицы.Описание			= ПодготовитьОписание(СтруктураРезультат.Описание);
		СтрокаТаблицы.Пространство		= СтруктураРезультат.Пространство.Заголовок;
		СтрокаТаблицы.Обновлено			= Формат(СтруктураРезультат.Обновлено, "ДЛФ=DDT");
	КонецЦикла;
КонецПроцедуры

&НаКлиенте 
Процедура ОбновитьНумерациюСтраницПоиска()
	ПоискВыполнен = (ТипЗнч(ЭтотОбъект.ПоследнийПоиск) = Тип("ФиксированнаяСтруктура"));
	
	ОграничениеНумерации = 10;
	
	МассивСтрок = Новый Массив;
	МассивСтрок.Добавить(НСтр("ru='Страницы:  '"));
	
	Если НЕ ПоискВыполнен Тогда
		МассивСтрок.Добавить(Новый ФорматированнаяСтрока(НСтр("ru='поиск не выполнен'"),, WebЦвета.ТемноСерый));
		ОбщегоНазначенияКлиентСервер.УстановитьСвойствоЭлементаФормы(Элементы,
			"ДекорацияПереключениеСтраниц", "Заголовок", Новый ФорматированнаяСтрока(МассивСтрок));
		
		Возврат;
	ИначеЕсли ЭтотОбъект.КоличествоСтраниц = 0 Тогда
		МассивСтрок.Добавить(Новый ФорматированнаяСтрока(НСтр("ru='совпадений не найдено'"),, WebЦвета.ТемноСерый));
		ОбщегоНазначенияКлиентСервер.УстановитьСвойствоЭлементаФормы(Элементы,
			"ДекорацияПереключениеСтраниц", "Заголовок", Новый ФорматированнаяСтрока(МассивСтрок));
		
		Возврат;
	КонецЕсли;
	
	ШрифтЖирный = Новый Шрифт(,, Истина);
	
	НачСтраница = ЭтотОбъект.ТекущаяСтраницаПоиска - Цел(ОграничениеНумерации / 2);
	КонСтраница = ЭтотОбъект.ТекущаяСтраницаПоиска + Цел(ОграничениеНумерации / 2) - 1;
	Если НачСтраница < 1 Тогда
		КонСтраница = КонСтраница + (1 - НачСтраница);
	ИначеЕсли КонСтраница > ЭтотОбъект.КоличествоСтраниц Тогда
		НачСтраница = НачСтраница - (КонСтраница - ЭтотОбъект.КоличествоСтраниц);
	КонецЕсли;
	
	НачалоПодсчета	= Макс(НачСтраница, 1);
	КонецПодсчета	= Мин(КонСтраница, ЭтотОбъект.КоличествоСтраниц);

	#Область Первая_Предыдущая
	Если ЭтотОбъект.КоличествоСтраниц > ОграничениеНумерации Тогда
		МассивСтрок.Добавить(Новый ФорматированнаяСтрока(НСтр("ru='<<'"),,,, "ПерваяСтраница"));
		МассивСтрок.Добавить("  ");
	КонецЕсли;
	
	Если ЭтотОбъект.КоличествоСтраниц > 1 Тогда
		Если ЭтотОбъект.ТекущаяСтраницаПоиска = 1 Тогда
			МассивСтрок.Добавить(Новый ФорматированнаяСтрока(НСтр("ru='<'"),, WebЦвета.ТемноСерый,,));
		Иначе
			МассивСтрок.Добавить(Новый ФорматированнаяСтрока(НСтр("ru='<'"),,,, "ПредыдущаяСтраница"));
		КонецЕсли;
		МассивСтрок.Добавить("  ");
	КонецЕсли;
	#КонецОбласти 
	
	#Область Страницы
	Для ИндексСтраницы = НачалоПодсчета По КонецПодсчета Цикл
		СтрИндекс = Формат(ИндексСтраницы, "ЧН=0; ЧГ=");
		Если ИндексСтраницы = ЭтотОбъект.ТекущаяСтраницаПоиска Тогда
			МассивСтрок.Добавить(Новый ФорматированнаяСтрока(СтрИндекс, ШрифтЖирный,,, "Страница_" + СтрИндекс));
		Иначе 
			МассивСтрок.Добавить(Новый ФорматированнаяСтрока(СтрИндекс,,,, "Страница_" + СтрИндекс));
		КонецЕсли;
		
		МассивСтрок.Добавить("  ");
	КонецЦикла;
	#КонецОбласти 
	
	#Область Следующая_Последняя
	Если ЭтотОбъект.КоличествоСтраниц > 1 Тогда
		Если ЭтотОбъект.ТекущаяСтраницаПоиска = ЭтотОбъект.КоличествоСтраниц Тогда
			МассивСтрок.Добавить(Новый ФорматированнаяСтрока(НСтр("ru='>'"),, WebЦвета.ТемноСерый,,));
		Иначе 
			МассивСтрок.Добавить(Новый ФорматированнаяСтрока(НСтр("ru='>'"),,,, "СледующаяСтраница"));
		КонецЕсли;
		МассивСтрок.Добавить("  ");
	КонецЕсли;
	
	Если ЭтотОбъект.КоличествоСтраниц > ОграничениеНумерации Тогда
		МассивСтрок.Добавить(Новый ФорматированнаяСтрока(НСтр("ru='>>'"),,,, "ПоследняяСтраница"));
	КонецЕсли;
	#КонецОбласти 

	ОбщегоНазначенияКлиентСервер.УстановитьСвойствоЭлементаФормы(Элементы,
		"ДекорацияПереключениеСтраниц", "Заголовок", Новый ФорматированнаяСтрока(МассивСтрок));
КонецПроцедуры

&НаКлиенте 
Процедура ОбновитьИтоговуюСтатистикуПоиска()
	ПоискВыполнен = (ТипЗнч(ЭтотОбъект.ПоследнийПоиск) = Тип("ФиксированнаяСтруктура"));
	
	ОбщегоНазначенияКлиентСервер.УстановитьСвойствоЭлементаФормы(Элементы,
		"ДекорацияСтатистика", "Видимость", ПоискВыполнен И ЭтотОбъект.КоличествоСтраниц <> 0);
	
	Если НЕ ПоискВыполнен ИЛИ ЭтотОбъект.КоличествоСтраниц = 0 Тогда
		Возврат;
	КонецЕсли;

	СтрЗаголовок = СтрШаблон(НСтр("ru='Отображено %1 - %2 из %3'"),   //НСтр("ru='Отображены совпадения с %1 по %2 (всего %3)'"),
		Формат(ЭтотОбъект.ПоследнийПоиск.Начало + 1, "ЧН=0; ЧГ="),
		Формат(ЭтотОбъект.ПоследнийПоиск.Начало + ЭтотОбъект.ПоследнийПоиск.РазмерВыборки, "ЧН=0; ЧГ="),
		Формат(ЭтотОбъект.ПоследнийПоиск.ВсегоКоличество, "ЧН=0; ЧГ="));

	ОбщегоНазначенияКлиентСервер.УстановитьСвойствоЭлементаФормы(Элементы,
		"ДекорацияСтатистика", "Заголовок", СтрЗаголовок);
КонецПроцедуры

&НаКлиентеНаСервереБезКонтекста 
Функция ПодготовитьОписание(знач СтрокаОписание)
	СтрокаОписание = СтрЗаменить(СтрокаОписание, Символы.НПП, " ");
	СтрокаОписание = СтрЗаменить(СтрокаОписание, Символы.ПС, " ");
	СтрокаОписание = СтрЗаменить(СтрокаОписание, Символы.Таб, " ");
	СтрокаОписание = СокрЛП(СтрокаОписание);
	
	Возврат Лев(СтрокаОписание, 600) + ?(СтрДлина(СтрокаОписание) > 600, "...", "");
КонецФункции

&НаКлиенте 
Функция ПолучитьТекстЗапросаПоиска(знач НомерСтраницы)
	Если НомерСтраницы <> 1 И ТипЗнч(ЭтотОбъект.ПоследнийПоиск) = Тип("ФиксированнаяСтруктура") Тогда
		Возврат ЭтотОбъект.ПоследнийПоиск.СтрокаЗапроса;
	КонецЕсли;
	
	Отбор = Новый Массив;
	
	#Область ТипДанных
	confluence_ApiClientServer.cql_addFilterItem(Отбор,
		ПредопределенноеЗначение("Перечисление.confluence_ПоляCQL.ТипДанных"),
		ВидСравненияКомпоновкиДанных.Равно,
		ПредопределенноеЗначение("Перечисление.confluence_ТипыДанных.Статья"));
	#КонецОбласти 
	
	#Область Пространство
	Если НЕ ПустаяСтрока(Объект.КлючПространства) Тогда
		confluence_ApiClientServer.cql_addFilterItem(Отбор,
			ПредопределенноеЗначение("Перечисление.confluence_ПоляCQL.Пространство"),
			ВидСравненияКомпоновкиДанных.Равно,
			Объект.КлючПространства);
	КонецЕсли;
	#КонецОбласти 
	
	#Область ДатаСоздания
	Если ЭтотОбъект.ПериодСоздания <> 0 Тогда
		Если ЗначениеЗаполнено(ЭтотОбъект.ДатаСозданияОт) Тогда
			confluence_ApiClientServer.cql_addFilterItem(Отбор,
				ПредопределенноеЗначение("Перечисление.confluence_ПоляCQL.ДатаСоздания"),
				ВидСравненияКомпоновкиДанных.БольшеИлиРавно,
				ЭтотОбъект.ДатаСозданияОт);
		КонецЕсли;
		Если ЗначениеЗаполнено(ЭтотОбъект.ДатаСозданияДо) Тогда
			confluence_ApiClientServer.cql_addFilterItem(Отбор,
				ПредопределенноеЗначение("Перечисление.confluence_ПоляCQL.ДатаСоздания"),
				ВидСравненияКомпоновкиДанных.Меньше,
				КонецДня(ЭтотОбъект.ДатаСозданияДо) + 1);
		КонецЕсли;
	КонецЕсли;
	#КонецОбласти 
	
	#Область ДатаИзменения
	Если ЭтотОбъект.ПериодИзменения <> 0 Тогда
		Если ЗначениеЗаполнено(ЭтотОбъект.ДатаИзмененияОт) Тогда
			confluence_ApiClientServer.cql_addFilterItem(Отбор,
				ПредопределенноеЗначение("Перечисление.confluence_ПоляCQL.ДатаИзменения"),
				ВидСравненияКомпоновкиДанных.БольшеИлиРавно,
				ЭтотОбъект.ДатаИзмененияОт);
		КонецЕсли;
		Если ЗначениеЗаполнено(ЭтотОбъект.ДатаИзмененияДо) Тогда
			confluence_ApiClientServer.cql_addFilterItem(Отбор,
				ПредопределенноеЗначение("Перечисление.confluence_ПоляCQL.ДатаИзменения"),
				ВидСравненияКомпоновкиДанных.Меньше,
				КонецДня(ЭтотОбъект.ДатаИзмененияДо) + 1);
		КонецЕсли;
	КонецЕсли;
	#КонецОбласти 
	
	#Область ВИерархии
	МассивСтраниц = Новый Массив;
	Если ЭтотОбъект.ПоискВнутриТекущейИерархии Тогда
		МассивСтраниц.Добавить(ЭтотОбъект.ТекущаяСтраницаИдентификатор);
	ИначеЕсли Объект.ДоступныеСтраницы.Количество() > 0 Тогда
		Для Каждого СтрокаТаблицы Из Объект.ДоступныеСтраницы Цикл
			МассивСтраниц.Добавить(СтрокаТаблицы.Идентификатор);
		КонецЦикла;
	КонецЕсли;
	
	Если МассивСтраниц.Количество() > 0 Тогда
		Если МассивСтраниц.Количество() = 1 Тогда
			Условие 	= ВидСравненияКомпоновкиДанных.Равно;
			Значение	= МассивСтраниц[0];
		Иначе 
			Условие		= ВидСравненияКомпоновкиДанных.ВСписке;
			Значение	= МассивСтраниц;
		КонецЕсли;
		
		confluence_ApiClientServer.cql_addFilterItem(Отбор,
			ПредопределенноеЗначение("Перечисление.confluence_ПоляCQL.ВИерархии"),
			Условие,
			Значение);
	КонецЕсли;
	#КонецОбласти 
	
	#Область Заголовок_Текст
	ПоискЗаголовок = confluence_ApiClientServer.cql_filterItem(
		ПредопределенноеЗначение("Перечисление.confluence_ПоляCQL.Заголовок"),
		ВидСравненияКомпоновкиДанных.Содержит,
		ЭтотОбъект.СтрокаПоиска); 
	
	ПоискТекст = confluence_ApiClientServer.cql_filterItem(
		ПредопределенноеЗначение("Перечисление.confluence_ПоляCQL.Текст"),
		ВидСравненияКомпоновкиДанных.Содержит,
		ЭтотОбъект.СтрокаПоиска); 
	
	Если ЭтотОбъект.ПоискТолькоПоЗаголовкам Тогда
		Отбор.Добавить(ПоискЗаголовок);
	Иначе 
		ГруппаИЛИ = confluence_ApiClientServer.cql_filterGroup(Истина);
		ГруппаИЛИ.Элементы.Добавить(ПоискЗаголовок);
		ГруппаИЛИ.Элементы.Добавить(ПоискТекст);
		
		Отбор.Добавить(ГруппаИЛИ);
	КонецЕсли;
	#КонецОбласти 
	
	ТекстЗапроса = confluence_ApiClientServer.get_cql_filter_text(Отбор); 
	Если ЭтотОбъект.ФормаВРежимеОтладки = Истина Тогда
		ОбщегоНазначенияКлиентСервер.СообщитьПользователю("CQL: " + ТекстЗапроса);
	КонецЕсли;
	
	Возврат ТекстЗапроса; 
КонецФункции

#КонецОбласти

#Область СлужебныеПроцедурыИФункции_Раздел
#КонецОбласти

 
