## Test PostgreSQL

### Войти в БД

```bash
docker exec -it postgres_tutor_db psql -h localhost -U tutor -d tutor_db
```

### Lessons

#### Lesson 1

Выборка определенных столбцов из таблицы с заданием алиасов для этих столбцов (атрибутов):

```sql
select
	shipped_date as date,
	ship_country as country,
	ship_region as region,
	ship_city as city,
	ship_address as address
from orders
```

... здесь `ship_address` - оригинальное имя атрибута строки таблицы, `as address` - задание алиаса (alias) для данного атрибута (`address` - имя алиаса).

Добавление в выборку сгенерированного стобца:

```sql
select
	*,
	round(od.unit_price * od.quantity) as amount
from order_details od
```

... здесь столбец с именем `amount` будет создан и добавлен в выборку - как результат арифметической операции умножения стобца `unit_price` на столбец `quantity`; в оригинальной таблтце столбца `amount` не существует - он будет только временно, в выборке существовать; здесь `od` - это алиас для таблицы `order_details`; `round` - встроенная функция SQL - выполняет окргуление результата арифметической операции в данном случае.

Пример создания выборки из таблицы с указанием алисов для столбцов:

```sql
select
	s.company_name as "Наименование компании",
	s.phone as "Телефон компании грузоотправителя"
from shippers s
```
