# Лабораторна робота №1. Варіант 14.
## Сліпченко Максим, КМ-81.
## Опис репозиторію:

### Директорія до запуску програми
```
dbis_lab1
├── main.py
|── logs
|   |──status.csv
|── output
|   |──time_log.log
|   |──query_data.csv
├── data - треба створити
│   ├── Odata2019File.csv - треба додати
│   └── Odata2020File.csv - треба додати
├── scripts
│   ├── csv_to_batches.py
│   └── small_funcs.py
│   └── constants.py
│   └── batches_to_table.py
└── sql_queries
    ├── CREATE.sql
    └── query.sql

```
Щоб додати CSV файли результатами ЗНО, треба створити директорію "data" та розмістити в ній ці файли.
Також було додано папку output з файлами, що генеруються вже після того, як програма відпрацьовує до кінця. Ця директорія не бере участі в роботи програми, вона була додана для того, щоб ви побачили ці файли без повного виконання довгого скрипта.
### Директорія після запуску програми
```
dbis_lab1
├──main.py
├── batches
│   ├── batch_1.csv
│   ├── batch_2.csv
|   |──...
├── data
│   ├── Odata2019File.csv
│   └── Odata2020File.csv
├── logs
|   |──status.csv
│   └── time_log.log
├── main.py
├── query_results
│   └── query_data.csv
├── scripts
│   ├── csv_to_batches.py
│   └── small_funcs.py
│   └── constants.py
│   └── batches_to_table.py
└── sql_queries
    ├── CREATE.sql
    └── query.sql

```
Файл query_data.csv містить CSV дані до запиту, вказаному за варіантом - дані про середній бал з англійської мови в кожному регіоні за роками. Файл містить рядок - заголовок (Регіон, Рік, Середній бал з англійської мови), в наступних рядках приведені відповідно конкретні дані.

Файл time_log.log містить час (в хвилинах та секундах) виконання функціональних блоків програми.
## Запуск програми

Щоб запустити скрипт, треба виконати консольну команду:

```bash
python3 main.py dbname username password host port
```
де після main.py йде перелічення конфігураційних даних для з'єднання з сервером PostgreSQL.

Програма може перебувати в трьох станах: EMPTY_DATABASE, INSERTION_IS_NOT_FINISHED, TABLE_POPULATED. Операції після запуску скрипта відповідають цім станам:

EMPTY_DATABASE: таблиця не створена. Скрипт розбиває CSV файли в директорії "data" на більш малі файли. Після цього кожний файл додається до бази даних. Коли вся таблиця заповнена даними, виконується запит до бази даних, створюється файл та додається у query_results.csv. У кінці створюється файл time_log.log з замірами часу.

INSERTION_IS_NOT_FINISHED: вставка даних до таблиці виконується з останнього вставленого файлу. Виконання запиту не відбувається та замірів часу немає.

TABLE_POPULATED: таблиця заповнена. Можна за бажанням створити файл з результатами запиту. Також є можливість видалити таблицю.
