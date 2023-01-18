# Security
Переписал инициализацию БД:
  - добавил два файла -- schema.sql, data.sql
  - добавил в application.properties строку "spring.sql.init-mode=always". Она отвечает за включение ручной инициализации. hbm2ddl при этом должно быть none
  - изменил "hibernate.dialect" на "spring.jpa.database-platform=org.hibernate.dialect.MySQL8Dialect", иначе не запускалось
  - не забудь поменять название бд в пропертях и в этих двух новых файлах, либо создай свою бд с тем же именем
  
 Исправил templates -- в new.html убрал из тега "th:selected=user.getUserRoles()", иначе option оставался пустым
 
 Переписал метод getViewForCreateUser -- на вход теперь подается пустой юзер и кладется в форму, все лишь с помощью @ModelAttribute. Раньше туда летел почему-то текущий юзер
 
 Изменил отношения между entity:
  - из Role убрал все ссылки на User
  - переписал отношения как OneToMany
  - Добавил каскады PERSIST and MERGE
  - Изменил реализацию для поля ролей -- теперь это не Collection а Set
  - соответственно, переделал геттер/сеттер для этого поля
  
 На текущий момент обнаружена одна проблема -- при сохранении пользоватлея дублируются роли в таблице roles
 
 Возможные решения:
  - пересмотреть контроллер, конкретно метод получения списка ролей
  - пересмотреть метод с post-запросом, и от него дальше по цепочке сервис и дао