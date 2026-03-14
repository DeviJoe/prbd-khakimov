# Практическая работа №7. Определение типов данных для атрибутов

## 1. Логическая модель по рисунку 7.1

### RENTAL_AGREEMENT
- `number`
- `date_of_rental`
- `duration`
- `date_of_return`
- `deposit_paid`
- `daily_rental_rate`
- `rate_per_mile`

### INDIVIDUAL
- `driver_license_state`
- `driver_license_number`
- `expiration_date`
- `first_name`
- `last_name`
- `address`
- `phone`
- `risk`

### COMPANY
- `number`
- `name`
- `address`

### OFFICE
- `number`
- `name`
- `address`

### VEHICLE_TYPE
- `code`
- `description`

### VEHICLE
- `id`
- `state_of_registration`
- `registration_number`
- `date_of_last_maintenance`
- `date_of_registration_expiration`

### TRUCK subtype
- `current_odometer_reading`
- `working_ratio`
- `gas_tank_capacity`

### TRAILER subtype
- собственных атрибутов нет

## 2. Структурированный тип данных
Удобно создать структурированный тип `address_t` и назначить его атрибутам:
- `INDIVIDUAL.address`
- `COMPANY.address`
- `OFFICE.address`

### Состав `address_t`
- `street VARCHAR2(60)`
- `city VARCHAR2(40)`
- `state CHAR(2)`
- `postal_code VARCHAR2(10)`

## 3. Домены

### Домен `id_6`
- тип: `VARCHAR2(6)`
- назначение: короткие идентификаторы

### Домен `name_50`
- тип: `VARCHAR2(50)`
- назначение: наименования и ФИО

### Куда назначить `id_6`
- `RENTAL_AGREEMENT.number`
- `COMPANY.number`
- `OFFICE.number`
- `VEHICLE.id`
- `VEHICLE_TYPE.code`

### Куда назначить `name_50`
- `COMPANY.name`
- `OFFICE.name`
- `INDIVIDUAL.first_name`
- `INDIVIDUAL.last_name`

## 4. Типы данных для всех атрибутов

| Сущность | Атрибут | Тип данных |
|---|---|---|
| RENTAL_AGREEMENT | `number` | `id_6` |
| RENTAL_AGREEMENT | `date_of_rental` | `DATE` |
| RENTAL_AGREEMENT | `duration` | `NUMBER(3)` |
| RENTAL_AGREEMENT | `date_of_return` | `DATE` |
| RENTAL_AGREEMENT | `deposit_paid` | `NUMBER(10,2)` |
| RENTAL_AGREEMENT | `daily_rental_rate` | `NUMBER(10,2)` |
| RENTAL_AGREEMENT | `rate_per_mile` | `NUMBER(8,2)` |
| INDIVIDUAL | `driver_license_state` | `CHAR(2)` |
| INDIVIDUAL | `driver_license_number` | `VARCHAR2(20)` |
| INDIVIDUAL | `expiration_date` | `DATE` |
| INDIVIDUAL | `first_name` | `name_50` |
| INDIVIDUAL | `last_name` | `name_50` |
| INDIVIDUAL | `address` | `address_t` |
| INDIVIDUAL | `phone` | `VARCHAR2(20)` |
| INDIVIDUAL | `risk` | `VARCHAR2(10)` |
| COMPANY | `number` | `id_6` |
| COMPANY | `name` | `name_50` |
| COMPANY | `address` | `address_t` |
| OFFICE | `number` | `id_6` |
| OFFICE | `name` | `name_50` |
| OFFICE | `address` | `address_t` |
| VEHICLE_TYPE | `code` | `id_6` |
| VEHICLE_TYPE | `description` | `VARCHAR2(100)` |
| VEHICLE | `id` | `id_6` |
| VEHICLE | `state_of_registration` | `CHAR(2)` |
| VEHICLE | `registration_number` | `VARCHAR2(20)` |
| VEHICLE | `date_of_last_maintenance` | `DATE` |
| VEHICLE | `date_of_registration_expiration` | `DATE` |
| TRUCK | `current_odometer_reading` | `NUMBER(9)` |
| TRUCK | `working_ratio` | `NUMBER(5,2)` |
| TRUCK | `gas_tank_capacity` | `NUMBER(6,2)` |

