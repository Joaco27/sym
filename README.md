# README

# Decisiones de Diseño

- Si bien se podia construir una jerarquía para los Links, se decidió por no hacerlo debido a problemas para referenciar al modelo Link en formularios y errores

- Para el modelo User se utilizó la gema devise, que construye dicho modelo con email y password. Además se le agregó campo username

- El modelo link posee los métodos: total_access (devuelve el total de accesos), today_access (devuelve los accesos diarios) e is_accessable? (devuelve si un link puede ser accedido)

- En el modelo Access, para saber la fecha del acceso se utiliza el campo created_at


# Requisitos
- Ruby >=2.7
- Rails =7.2
- Base de Datos: SQLite

# Descarga y Uso
### Clonar el repositorio
$ git clone https://github.com/Joaco27/sym.git

### Nos posicionamos dentro del proyecto
$ cd sym

### En caso de no tener instalado bundler
$ gem install bundler

### Instalar dependencias
$ bundle install

### Creacion de la BD
$ rails db:create

### Correr migraciones para la BD
$ rails db:migrate

### Cargar datos de prueba
$ rails db:seed

### Levantar la app
$ rails server

### Ver pagina web
Dirigirse a la Url http://127.0.0.1:3000/

# Autor
Joaquin Tartaruga
