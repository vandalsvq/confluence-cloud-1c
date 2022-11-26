﻿
// Возвращает структуру типов контекта по расширению
//
// Возвращаемое значение:
//   Структура
//		Ключ 		- расширение
//		Значение	- тип данных контента
// 
Функция content_types() Экспорт
	Структура = Новый Структура;
	Структура.Вставить("bmp"	, "image/bmp");
	Структура.Вставить("ico"	, "image/x-icon");
	Структура.Вставить("gif"	, "image/gif");
	Структура.Вставить("png"	, "image/png");
	Структура.Вставить("jpg"	, "image/jpeg");
	Структура.Вставить("jpeg"	, "image/jpeg");
	Структура.Вставить("svg"	, "image/svg+xml");
	Структура.Вставить("tiff"	, "image/tiff");
	
	Структура.Вставить("pdf"	, "application/pdf");
	Структура.Вставить("odt"	, "application/vnd.oasis.opendocument.text");
	Структура.Вставить("ppt"	, "application/vnd.ms-powerpoint");
	Структура.Вставить("doc"	, "application/msword");
	Структура.Вставить("xls"	, "application/vnd.ms-excel");
	
	Структура.Вставить("pptx"	, "application/vnd.openxmlformats-");
	Структура.Вставить("docx"	, "application/vnd.openxmlformats-");
	Структура.Вставить("xlsx"	, "application/vnd.openxmlformats-");
	
	Структура.Вставить("txt"	, "text/plain");

	Возврат Структура;
КонецФункции

// Возвращает соответствие статусов контента
//
// Параметры:
//	Ключ1С - Булево - использовать ключом имя 1С
//
// Возвращаемое значение:
//   Структура
//		удален		- trashed
//		устарел		- historical
//		черновик	- draft
//		текущий		- current
//		любой		- any
// 
Функция content_status(знач Ключ1С = Ложь) Экспорт
	Структура = Новый Структура;
	
	ВставитьЗаписьСтруктуры(Структура, "удален"		, "trashed"		, Ключ1С);
	ВставитьЗаписьСтруктуры(Структура, "устарел"	, "historical"	, Ключ1С);
	ВставитьЗаписьСтруктуры(Структура, "черновик"	, "draft"		, Ключ1С);
	ВставитьЗаписьСтруктуры(Структура, "текущий"	, "current"		, Ключ1С);
	ВставитьЗаписьСтруктуры(Структура, "любой"		, "any"			, Ключ1С);
	
	Возврат Структура;
КонецФункции

// Возвращает соответствие префиксов меток
//
// Параметры:
//	Ключ1С - Булево - использовать ключом имя 1С
//
// Возвращаемое значение:
//   Структура
//		все		- global
//		мои		- my
//		скрытые	- team
// 
Функция label_prefix(знач Ключ1С = Ложь) Экспорт
	Структура = Новый Структура;
	
	ВставитьЗаписьСтруктуры(Структура, "все"	, "global"	, Ключ1С);
	ВставитьЗаписьСтруктуры(Структура, "мои"	, "my"		, Ключ1С);
	ВставитьЗаписьСтруктуры(Структура, "скрытые", "team"	, Ключ1С);
	
	Возврат Структура;
КонецФункции

// Возвращает структуру настроек базы знаний
//
// Параметры:
//	АдресСервера - Строка - адрес сервера, например https://<ВашДомен>.atlassian.net
//
// Возвращаемое значение:
//   Структура
//		АдресСервера			- Строка - адрес сервера в нижнем регистре
//		ЗащищенноеСоединение	- Булево - признак защищенного соединения (используется https)
//		СерверHTTP				- Строка - сервер для использования при подключении (<ВашДомен>.atlassian.net)
//		АдресWiki				- Строка - полный адрес базы знаний на сервере (https://<ВашДомен>.atlassian.net/wiki)
// 
Функция url_params(знач АдресСервера) Экспорт
	Схема = "";
	Адрес = "";
	
	АдресСервера = НРег(СокрЛП(АдресСервера));
	
	Позиция = СтрНайти(АдресСервера, "://");
	Если Позиция > 0 Тогда
		Схема = НРег(Лев(АдресСервера, Позиция - 1));
		Адрес = Сред(АдресСервера, Позиция + 3);
	КонецЕсли;
	
	АдресСервераHTTP = СтроковыеФункцииКлиентСервер.УдалитьПовторяющиесяСимволы(Адрес, "/", "Справа");
	
	АдресWiki = АдресСервера + ?(СтрЗаканчиваетсяНа(АдресСервера, "/"), "", "/") + "wiki";
	
	РеквизитыСсылки = Новый Структура;
	РеквизитыСсылки.Вставить("АдресСервера"			, АдресСервера);
	РеквизитыСсылки.Вставить("ЗащищенноеСоединение"	, (Схема = "https"));
	РеквизитыСсылки.Вставить("СерверHTTP"			, Адрес);
	РеквизитыСсылки.Вставить("АдресСервераWiki"		, АдресWiki); 
	 
	Возврат РеквизитыСсылки;
КонецФункции

// Возвращает параметры полей запросов для проверки при составлении текста cql
//
// Параметры:
//	Поле - ПеречислениеСсылка.confluence_ПоляCQL
//
// Возвращаемое значение:
//   Структура
//		Поле	- Строка - поле Confluence (cql)
//		Тип		- ОписаниеТипов - описание типов для проверки значений
//		Условия	- Массив - массив допустимых видов сравнения
// 
Функция cql_fields_params(знач Поле) Экспорт
	ПараметрыПоля = Новый Структура("Поле, Тип, Условия");
		
	МассивТипов = Новый Массив;
	МассивТипов.Добавить(Тип("Массив"));
	
	ДопустимыеУсловия = Новый Массив;
		
	Если Поле = ПредопределенноеЗначение("Перечисление.confluence_ПоляCQL.ВИерархии") Тогда
		МассивТипов.Добавить(Тип("Строка"));
		
		ДопустимыеУсловия.Добавить(ВидСравненияКомпоновкиДанных.Равно);
		ДопустимыеУсловия.Добавить(ВидСравненияКомпоновкиДанных.НеРавно);
		ДопустимыеУсловия.Добавить(ВидСравненияКомпоновкиДанных.ВСписке);
		ДопустимыеУсловия.Добавить(ВидСравненияКомпоновкиДанных.НеВСписке);
		
		ПараметрыПоля.Поле	= "ancestor";
		
	ИначеЕсли Поле = ПредопределенноеЗначение("Перечисление.confluence_ПоляCQL.Родитель") Тогда
		МассивТипов.Добавить(Тип("Строка"));
		
		ДопустимыеУсловия.Добавить(ВидСравненияКомпоновкиДанных.Равно);
		ДопустимыеУсловия.Добавить(ВидСравненияКомпоновкиДанных.НеРавно);
		
		ПараметрыПоля.Поле = "parent";
		
	ИначеЕсли Поле = ПредопределенноеЗначение("Перечисление.confluence_ПоляCQL.Заголовок") Тогда
		МассивТипов.Добавить(Тип("Строка"));
		
		ПараметрыПоля.Поле = "title";
		
	ИначеЕсли Поле = ПредопределенноеЗначение("Перечисление.confluence_ПоляCQL.Текст") Тогда
		МассивТипов.Добавить(Тип("Строка"));
		
		ПараметрыПоля.Поле = "text";
		
	ИначеЕсли Поле = ПредопределенноеЗначение("Перечисление.confluence_ПоляCQL.ДатаСоздания") Тогда
		МассивТипов.Добавить(Тип("Дата"));
		
		ДопустимыеУсловия.Добавить(ВидСравненияКомпоновкиДанных.Равно);
		ДопустимыеУсловия.Добавить(ВидСравненияКомпоновкиДанных.НеРавно);
		ДопустимыеУсловия.Добавить(ВидСравненияКомпоновкиДанных.Больше);
		ДопустимыеУсловия.Добавить(ВидСравненияКомпоновкиДанных.БольшеИлиРавно);
		ДопустимыеУсловия.Добавить(ВидСравненияКомпоновкиДанных.Меньше);
		ДопустимыеУсловия.Добавить(ВидСравненияКомпоновкиДанных.МеньшеИлиРавно);
		
		ПараметрыПоля.Поле = "created";
		
	ИначеЕсли Поле = ПредопределенноеЗначение("Перечисление.confluence_ПоляCQL.ДатаИзменения") Тогда
		МассивТипов.Добавить(Тип("Дата"));
		
		ДопустимыеУсловия.Добавить(ВидСравненияКомпоновкиДанных.Равно);
		ДопустимыеУсловия.Добавить(ВидСравненияКомпоновкиДанных.НеРавно);
		ДопустимыеУсловия.Добавить(ВидСравненияКомпоновкиДанных.Больше);
		ДопустимыеУсловия.Добавить(ВидСравненияКомпоновкиДанных.БольшеИлиРавно);
		ДопустимыеУсловия.Добавить(ВидСравненияКомпоновкиДанных.Меньше);
		ДопустимыеУсловия.Добавить(ВидСравненияКомпоновкиДанных.МеньшеИлиРавно);
		
		ПараметрыПоля.Поле = "lastmodified";
		
	ИначеЕсли Поле = ПредопределенноеЗначение("Перечисление.confluence_ПоляCQL.Пространство") Тогда
		МассивТипов.Добавить(Тип("Строка"));
		
		ДопустимыеУсловия.Добавить(ВидСравненияКомпоновкиДанных.Равно);
		ДопустимыеУсловия.Добавить(ВидСравненияКомпоновкиДанных.НеРавно);
		ДопустимыеУсловия.Добавить(ВидСравненияКомпоновкиДанных.ВСписке);
		ДопустимыеУсловия.Добавить(ВидСравненияКомпоновкиДанных.НеВСписке);
		
		ПараметрыПоля.Поле = "space";
		
	ИначеЕсли Поле = ПредопределенноеЗначение("Перечисление.confluence_ПоляCQL.ТипДанных") Тогда
		МассивТипов.Добавить(Тип("ПеречислениеСсылка.confluence_ТипыДанных"));
		
		ДопустимыеУсловия.Добавить(ВидСравненияКомпоновкиДанных.Равно);
		ДопустимыеУсловия.Добавить(ВидСравненияКомпоновкиДанных.НеРавно);
		ДопустимыеУсловия.Добавить(ВидСравненияКомпоновкиДанных.ВСписке);
		ДопустимыеУсловия.Добавить(ВидСравненияКомпоновкиДанных.НеВСписке);
		
		ПараметрыПоля.Поле = "type";
		
	Иначе 
		ПараметрыПоля.Поле = "";
	КонецЕсли;
	
	Если МассивТипов.Количество() > 1 Тогда
		ПараметрыПоля.Тип = Новый ОписаниеТипов(МассивТипов);
	КонецЕсли;
	
	ПараметрыПоля.Условия = ДопустимыеУсловия;
	
	Возврат ПараметрыПоля;
КонецФункции

#Область СлужебныеПроцедурыИФункции
 
Процедура ВставитьЗаписьСтруктуры(Коллекция, знач Имя1С, знач ИмяConfluence, знач Ключ1С)
	Если Ключ1С = Истина Тогда
		Коллекция.Вставить(Имя1С, ИмяConfluence);
	Иначе 
		Коллекция.Вставить(ИмяConfluence, Имя1С);
	КонецЕсли;
КонецПроцедуры

#КонецОбласти
