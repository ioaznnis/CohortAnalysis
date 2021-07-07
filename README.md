# CohortAnalysis

Некоторая попытка реализовать когортный анализ.

Имя файла для сохранения и строка подключения в БД - в appsettings.json

По умолчанию файл создается "рядом" с исполняемым файлом. Однако допускается полный и относительный путь.


Структура БД, которая необходима для работы приложения:

```sql
use Cohort
go

create table Orders
(
	Id int identity
		constraint [PK_dbo.Order]
			primary key,
	PhoneNumber nvarchar(11) not null,
	DateAdded datetime not null
)
go
```
