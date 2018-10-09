# Constructoras

En este ejercicio, se nos pide modelar empresas constructoras que ofrecen los servicios de trabajadores que tienen contratados, a distintos tipos de solicitantes.


## Etapa 1 - trabajadores y constructoras

De cada **trabajador** se debe poder obtener:
- a qué _sindicato_ pertenece, esto se debe asignar para cada trabajador.
- sus _honorarios por jornada_ de trabajo, cómo se determina depende del tipo de trabajador.
- en qué _localidades_ puede trabajar, cómo se determina depende del tipo de trabajador.

De cada **sindicato** nos va a interesar: en qué localidad está, y qué honorarios por jornada de trabajo recomienda para sus trabajadores.

Deben contemplarse distintos tipos de trabajadores, de acuerdo a lo que se indica a continuación.
- **Trabajadores afiliados a un sindicato**:  
  pueden trabajar solamente en la localidad donde está el sindicato, los honorarios son los que recomienda el sindicato.
- **Trabajadores de la Cooperativa del Oeste**:
  pueden trabajar en Morón, Hurlingham, El Palomar y Villa Tesei, cobran 250 pesos por jornada de trabajo.
- **Trabajadores libres**:
  se indica para cada uno en qué localidades pueden trabajar y los honorarios por jornada, además del sindicato.

Cada **constructora** contrata a varios trabajadores. Para cada una se indica un honorario de referencia.

A partir de este modelo, tiene que poder obtenerse para una empresa:
- el conjunto formado por sus _trabajadores baratos_.   
  O sea, aquellos cuyo honorario es menor al honorario de referencia de la empresa.
- el conjunto de los _sindicatos intervinientes_, o sea, los sindicatos a los que pertenecen sus trabajadores, sin repetidos.
- el trabajador _más caro_ (o sea, que sus honorarios son los más altos).
- si una determinada localidad _está cubierta_ (o sea, que haya al menos un trabajador que pueda trabajar allí).
- cuántos (un número) de sus trabajadores contratados pertenece a un determinado sindicato.
- **esta es más difícil**  
  dado un trabajador, si es _poco atractivo_ para la empresa.  
  Esto es: si para cada localidad en la que puede trabajar el profesional, la empresa cuenta con otro que también puede cubrir esa localidad, y que cobra más barato.


### Comentario que puede ayudar para la resolución  
Cada sindicato debe acordarse localidad y honorarios recomendados, se le setean y listo.  
Por otro lado, _está mal_ que los trabajadores afiliados se acuerden de qué localidades tienen habilitadas y cuáles son sus honorarios; le tienen que pedir estos datos al sindicato.

De paso: **OJO** que el sindicato está en _una_ localidad, pero el trabajador tiene que devolver una _colección_ de localidades. Un trabajador afiliado devolverá una colección con un solo elemento.

<br>


## Test de la etapa 1

Tenemos estos sindicatos:
- UOCRA Castelar: está en la localidad de Castelar, los honorarios recomendados son de 350 pesos.
- Constructoras Siglo XXI: está en Villa Tesei, los honorarios recomendados son de 280 pesos.
- Amigos de Vlad: están en Aldo Bonzi, los honorarios recomendados son de 420 pesos.
- Castelar Workers: está en Castelar, los honorarios recomendados son de 880 pesos.

y estos profesionales
- Juana, afiliada, pertenece a Constructores Siglo XXI.
- Melina, cooperativista, pertenece a Amigos de Vlad.
- Rocío, libre, pertenece a Castelar Workers, honorarios 500 pesos, puede trabajar en Villa Tesei, Ciudad Evita y Castelar.
- Luciana, libre, pertenece a Constructoras Siglo XXI, honorarios 320 pesos, puede trabajar en Villa Tesei y El Palomar.

Una constructora que contrate a estas cuatro trabajadoras, y cuyos honorarios de referencia son 350 pesos, debe tener
- como _trabajadores baratos_, a Juana, a Melina y a Luciana.
- como _sindicatos intervinientes_, a Constructoras Siglo XXI, Amigos de Vlad y Castelar Workers.
- como _trabajador más caro_ a Rocío.
- las localidades de Villa Tesei y Ciudad Evita están cubiertas, pero Tapiales no.
- dos de sus trabajadoras pertenecen a Constructoras Siglo XXI, una en Castelar Workers, ninguna (o sea cero) en UOCRA Castelar.  

Hacer los tests que sean necesarios para verificar esto. Se puede usar `fixture` para definir información que se usa en varios tests dentro de un _describe file_.

<br>

## Etapa 2 - cobros

Agregar al modelo la consecuencia de que un trabajador cobre un importe de dinero, de acuerdo a estas reglas:
- los **trabajadores afiliados** le donan un 20% al sindicato, y el resto lo gastan inmediatamente sin que quede registro en la aplicación. Hay que mantener el total recibido por donaciones de cada sindicato.
- los **cooperativistas** ponen todo lo que cobran en la _Cooperativa del Oeste_. Agregar un objeto que represente a esta Cooperativa, que mantiene el total recaudado.
- los **trabajadores libres** se guardan todo lo que cobran. Debe mantenerse el total recaudado por cada uno. <br> Un trabajador libre le puede _pasar_ una cantidad X de dinero a otro: se resta X del total recaudado, y el otro cobra X. P.ej. si `flavia` tiene 10000 de total recaudado, `tito` tiene 12000, y hacemos
  ```
  tito.pasarDinero(flavia, 4000)
  ```
  entonces `tito` pasa a tener 8000, y `flavia` 14000 (porque cobró 4000).


<br>

## Etapa 3 - solicitantes

Los **solicitantes** pueden ser personas o instituciones. Nos interesa saber para cada solicitante si puede (o no) _tener a un trabajador en su obra_.  

De cada **persona** se debe indicar en qué localidad vive. Puede ser atendida por los profesionales que pueden trabajar en la localidad donde vive.
Cada **institución** tiene una lista de sindicatos con los que tiene convenio. Puede incluir en su obra a cualquiera de los trabajadores que pertenecen a alguno de esos sindicatos.

A una empresa se le tiene que poder preguntar si puede _satisfacer_ a un solicitante.
La condición para esto es que en la obra del solicitante pueda trabajar, al menos, uno de los trabajadores contratados por la empresa.


## Etapa 4 - registro de trabajos hechos

Agregar al modelo el registro de cada trabajo que una constructora hace para un determinado solicitante.
Para esto, agregarle a los objetos que representan empresas la capacidad de entender el mensaje `darServicio`. P.ej. si `elFierroLoco` es una empresa y `juana` una solicitante, entonces haciendo
```
elFierroLoco.darServicio(juana)
```
se indica que se le está dando a Juana un servicio. Se asume que cada servicio insume una jornada de un trabajador.
Debe pasar lo siguiente:
- si el solicitante puede ser atendido (etapa 3), entonces elegir uno cualquiera de los trabajadores que puede ir a su obra, hacer que ese trabajador cobre (etapa 2) su honorario por jornada (etapa 1), y agregar al solicitante al conjunto de _clientes_ de la empresa.
- caso contrario, lanzar un error.

Agregar la posibilidad de preguntarle a una constructora: cuántos clientes tiene, y si tiene o no como cliente a un determinado solicitante.
