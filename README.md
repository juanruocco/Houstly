# Houstly

la pagina quedara subida a houstly.heroku.com

Si se sube a master se sube al servidor automaticamente, por eso no meterse con esta rama


Para correr la app debe iniciarse rails y mongodb:
rails: rails s(asi se hace en mac)
mongo: mongod(en mac)
y de ahy correr en la web: localhost:3000(o como lo hayan configurado rails)

despues hay que configurar el sitio:

Por ahora hay cosas quemadas(para sitio para el hotel finca y/o psygon)

Se inicializa el proyecto en el archivo app/controllers/application_controller.rb con la variable
  @current_place = Place.find_by(:name_id => "finca")


Para configurar hay que crear los siguientes modelos:
place,rooms,tours

Places :localhost:3000/places
id:finca/psygon	(quemado para que coja las imagenes)
name:cualquier valor
location: cualquier valor
description: cualquier valor
video: (cualquier valor) https://www.youtube.com/embed/0fpL7OzKP5w?rel=0&amp;controls=0&amp;showinfo=0
Number Sliders Images:1(valor quemado para las images)
Number Thumb Images: 5 (quemado para las imagenes)


Rooms (localhost:3000/rooms)
id:(valores quemado por las fotos), valores: venus, saturno,mercurio)
name:(cualquier valor)

Tours (localhsot:3000/tours)
name:valores quemadospara las fotos(caballos,rafting,noche_romantica)
title:cualquier valor
description:cualquier valor

-- (27/10/2017)Tomas:
Usuarios (localhost:3000/users) : listado de usuarios
Registro de Usuarios (localhost:3000/users/new) : registro de un nuevo usuario

Autenticacion basica para cualquier modificación en Places
usuario: house (valor quemado)
clave: secret (valor quemado)
-- fin Tomas
