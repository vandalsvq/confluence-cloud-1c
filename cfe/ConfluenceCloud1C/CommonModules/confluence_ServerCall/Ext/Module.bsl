﻿
Функция ЗначениеВСтрокуJSON(знач Значение) Экспорт
	
	ЗаписьJSON = Новый ЗаписьJSON;
	ЗаписьJSON.УстановитьСтроку();
	ЗаписьJSON.ПроверятьСтруктуру = Ложь;
	ЗаписатьJSON(ЗаписьJSON, Значение);
	СтрокаJSON = ЗаписьJSON.Закрыть();
	ЗаписьJSON = Неопределено;
	
	Возврат СтрокаJSON;
	
КонецФункции

Функция ЗначениеИзСтрокиJSON(знач СтрокаJSON) Экспорт
	
	ЧтениеJSON = Новый ЧтениеJSON;
	ЧтениеJSON.УстановитьСтроку(СтрокаJSON);
	Результат = ПрочитатьJSON(ЧтениеJSON, Истина);
	ЧтениеJSON = Неопределено;
	
	Возврат Результат;
	
КонецФункции