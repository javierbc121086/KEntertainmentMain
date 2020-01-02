# KEntertainmentMain

KEntertainmentMain es una aplicación iOS que muestra 3 listas de Pelícuas (Favorite, Recommendations, Rated) y 3 listas de Tv Show (Favorite, Recommendations, Rated).


## Dependendencias Pods

Se crearon 4 dependencias Pods que pertenecen al contexto Kavak Entertainment

1. KEntertainmentDomain
1. KEntertainmentService
1. KEntertainmentData
1. KEntertainmentProcess


## Descripción

### Capas de la Aplicación

1. KEntertainmentDomain

Capa o dependencia de la aplicación encargada de encapsular y exponer los modelos del negocio y tipos complejos reutilizables entre las capas o la aplicación principal.

2. KEntertainmentService

Capa o dependencia encargada de consumir servicios a web services, su unica función es solicitar información de servidores remotos, y procesar las respuestas para convertir entidades a modelos y exponerlos por medio del patron delegado.

3. KEntertainmentData

Capa encargada de persistir información compleja sobre Core Data y FileManager. Se ocupa en el contexto de Kavak Entertainment para poder almacenar y recuperar la lista de peliculas y tv shows junto con las imagenes remotas descargadas en caso de que el dispositivo no cuente con una conexión valida de datos móviles.

4. KEntertainmentProcess

Capa encargada de coordinar las petciones a web services o recuperacion de datos en cache o persistencia, comunmente se conoce como Presenter o ViewModel

5. KEntertainmentMain

Aplicación principal Kavak Entertainment, donde se implementan los Pods KEntertainmentDomain, KEntertainmentService, KEntertainmentData y KEntertainmentProcess.

Kavak Entertainment se encarga de construir el cascaron UI/UX de la aplicación que podra ver el usuario final.


### En qué consiste y cuál es el propósito de el principio de responsabilidad única?

"Si cada clase tiene una unica responsabilidad, esta sera mas facil de mantener"

Esto quiere decir que nuestras funcionalidades deben tener una alta cohesión, para poder mantener y reutilizar nuestro código.

Una de las alternatibas implementadas sobre este proyecto son los cocoa pods (no es mandatorio, ya que se pueden implementar las librerias o frameworks a mano, pero no tenemos la ventaja de distribuir las funcionalidades de forma remota, segura y elegante), ya que al asegurarnos que esten separados e independientes de la aplicación principal, aseguramos que se puede dar mantenimiento de forma independiente y reusable en otros proyectos.


### Qué características tiene, según su opinión, un código limpio?

En mi opinion, un codigo limpio debe ser pequeño, entendible y simple, separando las funcionalidades siguiendo el principio "Divide y venceras", podremos detectar fallas o areas de oportunidad mas facil.

Un codigo limpio si o si debe ser testeable. Podemos usar pruebas unitarias para ayudarnos a probas las funcioanlidades de nuestro código.

### Describa la razón del patrón de diseño usado.

El patrón de diseño de software usado para la arquitectura de la aplicación es MVC + N Capas

Para el proyecto del cascarón (KEntertainmentMain) por la complegidad de la app, basta con usar un MVC, en caso de necesitar mas capas, se pueden agregar mas Pods o capas directamente sobre KEntertainmentMain (MVP, MVVM, Etc).

Las N Capas se sobre entiende que son los Pods KEntertainmentDomain, KEntertainmentService, KEntertainmentData, KEntertainmentProcess descritos con anterioridad.


## Notas adicionales importantes

A. Se implementaron patrones de diseño de software sonre la capa service, las cuales son:

1. Factory
1. Chain of Responsability

Sobre el cascarón de la aplicación (KEntertainmentMain) se implemento:

3. Strategy

El patrón de diseño de software  sobre la logica de la table view y la collection view, al evitar cargar rows diferentes acoplando un if/else o switch (Se puede analizar su implementación sobre el proyecto).


B. Se puede optar por otras opciones similares a los Cocoa Pods, ya que al final, solo se usan para la distribuccion y permisos de acceso, se puede optar por usar Carthage, SPM, los Frameworks compilados o los proyectos directamnete embebidos en el proyecto principal o cascaron.
