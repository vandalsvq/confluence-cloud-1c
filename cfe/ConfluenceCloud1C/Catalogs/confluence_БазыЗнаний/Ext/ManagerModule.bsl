﻿#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

#Область ПрограммныйИнтерфейс

Процедура ЗаписатьНастройки(знач БазаЗнанийСсылка, знач Настройки) Экспорт
	УстановитьПривилегированныйРежим(Истина);
	
	Если ЗначениеЗаполнено(БазаЗнанийСсылка) И ТипЗнч(БазаЗнанийСсылка) = Тип("СправочникСсылка.confluence_БазыЗнаний") Тогда
		ЭлементОбъект = БазаЗнанийСсылка.ПолучитьОбъект();
	Иначе 
		ЭлементОбъект = Справочники.confluence_БазыЗнаний.СоздатьЭлемент();
		ЭлементОбъект.ПоУмолчанию = Истина;
	КонецЕсли;
	
	ЗаполнитьЗначенияСвойств(ЭлементОбъект, Настройки,, "ДоступныеСтраницы");
	
	ЭлементОбъект.Наименование = Настройки.АдресСервера;
	ЭлементОбъект.ИспользоватьАнонимныйДоступ = НЕ ЗначениеЗаполнено(Настройки.ПользовательЛогин);
	
	ЭлементОбъект.ДоступныеСтраницы.Очистить();
	Для Каждого Идентификатор Из Настройки.ДоступныеСтраницы Цикл 
		ЭлементОбъект.ДоступныеСтраницы.Добавить().Идентификатор = Идентификатор;
	КонецЦикла;
	
	ЭлементОбъект.Записать();
	
	Справочники.confluence_БазыЗнаний.ЗаписатьТокенПользователяВХранилище(ЭлементОбъект.Ссылка,
		ЭлементОбъект.ИспользоватьАнонимныйДоступ,
		Настройки.ПользовательТокен);
КонецПроцедуры

Процедура ЗаписатьТокенПользователяВХранилище(знач БазаЗнанийСсылка, знач ИспользоватьАнонимныйДоступ, знач ТокенПользователя) Экспорт
	Если ИспользоватьАнонимныйДоступ Тогда
		ОбщегоНазначения.УдалитьДанныеИзБезопасногоХранилища(БазаЗнанийСсылка, "ПользовательТокен");
	ИначеЕсли НЕ СтроковыеФункцииКлиентСервер.ЭтоУникальныйИдентификатор(ТокенПользователя) Тогда 
		ОбщегоНазначения.ЗаписатьДанныеВБезопасноеХранилище(БазаЗнанийСсылка, ТокенПользователя, "ПользовательТокен");
	КонецЕсли;
КонецПроцедуры

Функция ПолучитьЭлементПоУмолчанию() Экспорт 
	Запрос = Новый Запрос;
	Запрос.Текст = 
	"ВЫБРАТЬ ПЕРВЫЕ 1
	|	confluence_БазыЗнаний.Ссылка КАК Ссылка
	|ИЗ
	|	Справочник.confluence_БазыЗнаний КАК confluence_БазыЗнаний
	|ГДЕ
	|	confluence_БазыЗнаний.ПоУмолчанию";
	
	РезультатЗапроса = Запрос.Выполнить();
	Если РезультатЗапроса.Пустой() Тогда
		Возврат Неопределено;
	КонецЕсли;
	
	Выборка = РезультатЗапроса.Выбрать();
	Выборка.Следующий();
	
	Возврат Выборка.Ссылка;
КонецФункции

Функция ПолучитьНастройки(знач БазаЗнанийСсылка) Экспорт
	НастройкиПоУмолчанию = Обработки.confluence_БазаЗнаний.СтруктураНастроек();
	
	Если НЕ ЗначениеЗаполнено(БазаЗнанийСсылка) ИЛИ НЕ ТипЗнч(БазаЗнанийСсылка) = Тип("СправочникСсылка.confluence_БазыЗнаний") Тогда
		БазаЗнанийСсылка = ПолучитьЭлементПоУмолчанию();
		
		Если НЕ ЗначениеЗаполнено(БазаЗнанийСсылка) Тогда
			Возврат НастройкиПоУмолчанию;
		КонецЕсли;
	КонецЕсли;
	
	УстановитьПривилегированныйРежим(Истина);
	
	Запрос = Новый Запрос;
	Запрос.УстановитьПараметр("БазаЗнанийСсылка", БазаЗнанийСсылка);
	Запрос.Текст = 
	"ВЫБРАТЬ
	|	confluence_БазыЗнаний.Ссылка КАК БазаЗнанийСсылка,
	|	confluence_БазыЗнаний.Наименование КАК АдресСервера,
	|	ВЫБОР
	|		КОГДА confluence_БазыЗнаний.ИспользоватьАнонимныйДоступ
	|			ТОГДА """"
	|		ИНАЧЕ confluence_БазыЗнаний.ПользовательЛогин
	|	КОНЕЦ КАК ПользовательЛогин,
	|	confluence_БазыЗнаний.ОткрыватьВнешниеСсылкиВ1С КАК ОткрыватьВнешниеСсылкиВ1С,
	|	confluence_БазыЗнаний.КлючПространства КАК КлючПространства,
	|	confluence_БазыЗнаний.СкрытьПолеВводаРаздела КАК СкрытьПолеВводаРаздела,
	|	confluence_БазыЗнаний.ИспользоватьАнонимныйДоступ КАК ИспользоватьАнонимныйДоступ
	|ИЗ
	|	Справочник.confluence_БазыЗнаний КАК confluence_БазыЗнаний
	|ГДЕ
	|	confluence_БазыЗнаний.Ссылка = &БазаЗнанийСсылка
	|;
	|
	|////////////////////////////////////////////////////////////////////////////////
	|ВЫБРАТЬ
	|	confluence_БазыЗнанийДоступныеСтраницы.Ссылка КАК Ссылка,
	|	confluence_БазыЗнанийДоступныеСтраницы.НомерСтроки КАК НомерСтроки,
	|	confluence_БазыЗнанийДоступныеСтраницы.Идентификатор КАК Идентификатор
	|ИЗ
	|	Справочник.confluence_БазыЗнаний.ДоступныеСтраницы КАК confluence_БазыЗнанийДоступныеСтраницы
	|ГДЕ
	|	confluence_БазыЗнанийДоступныеСтраницы.Ссылка = &БазаЗнанийСсылка";
	
	РезультатЗапроса = Запрос.ВыполнитьПакет();
	
	Если НЕ РезультатЗапроса[0].Пустой() Тогда
		Выборка = РезультатЗапроса[0].Выбрать();
		Выборка.Следующий();
		
		ЗаполнитьЗначенияСвойств(НастройкиПоУмолчанию, Выборка);
		
		Если НЕ Выборка.ИспользоватьАнонимныйДоступ Тогда
			НастройкиПоУмолчанию.ПользовательТокен = Справочники.confluence_БазыЗнаний.ПолучитьТокенПользователяИзХранилища(БазаЗнанийСсылка);
		КонецЕсли;
		
		НастройкиПоУмолчанию.ДоступныеСтраницы = РезультатЗапроса[1].Выгрузить().ВыгрузитьКолонку("Идентификатор");
	КонецЕсли;
	
	Возврат НастройкиПоУмолчанию;
КонецФункции

Функция ПолучитьТокенПользователяИзХранилища(знач БазаЗнанийСсылка) Экспорт
	Возврат ОбщегоНазначения.ПрочитатьДанныеИзБезопасногоХранилища(БазаЗнанийСсылка, "ПользовательТокен");
КонецФункции

#КонецОбласти

#КонецЕсли