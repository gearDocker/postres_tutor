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

#### Lesson 2

#### Lesson 3

Оператор фильтрации `where`:

```sql
select
	*
from products p
where p.category_id = 7
```

... оператор `where` не поддерживает работу с алиасами; такой пример вызовет ошибку:

```sql
select
c.city as t
from customers c
where t ilike 'c%'
```

... здесь `t` - это алиас для `c.city`; это происходит потому, что оператор `where` - **срабатывает раньше**, чем присваиваются алиасы.

Оператор `in` работает аналогично методу `includes` в JavaScript:

```sql
select * from products p where p.supplier_id in (12, 24)
```

... чтобы не писать:

```sql
select * from products p where p.supplier_id = 12 or p.supplier_id = 24
```

... что идентично по результату.

Оператор `not` - инверсия; например:

```sql
select * from products p where p.supplier_id not in (12, 24, 14, 1, 6)
```

... будет сделана выборка всех значений из атрибута `supplier_id`, кроме указанных - `(12, 24, 14, 1, 6)`; аналогично:

```sql
select * from products p where not p.supplier_id = 8
```

Оператор `between ... and` - позволяет сделать выборку диапазона значений:

```sql
select * from products p where p.unit_price between 40 and 50
```

... причем у оператора `between` обе границы - включительно; аналогично оператор `between` работает с датами:

```sql
select * from orders o where o.order_date between '1996-08-01' and '1996-09-01'
```

Проверка на `null`:

```sql
select * from customers c where c.region is null
```

```sql
select * from customers c where c.region is not null
```

... в комментариях не нуждается.

Оператор `like` и `ilike` - для поиска строки в подстроке; `like` регистрозависимый:

```sql
select * from customers c where c.company_name like 'A%'
```

... здесь `%` - тоже самое, что `*` в JavaScript - любой кол-во символов; регистронезависимый вариант:

```sql
select * from customers c where c.company_name ilike 'a%'
```
