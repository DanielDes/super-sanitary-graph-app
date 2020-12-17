* Explique el ciclo de vida de un view controller


Un view controller consta de cinco eventos específicos que nos ayuda a manejar el comportamiento del viewcontroller.

El ciclo va en el siguiente orden:

- viewDidLoad
  - Configuramos el estado inicial de la vista. Este evento ocurre una vez, a no ser que la vista sea removida completamente de memoria
- viewWillAppear
  - En este paso preparamos la información que vamos a desplegar
  - O también es útil cuando necesitamos que la vista haga algo siempre que aparezca
- viewDidAAppear 
  - Para este punto el controlador y la vista ya están completamente instanciadas, asi como las subviews definidas en el storyboard
  - Aquí se puede hacer animaciones o consultas.
- viewWillDissapear
  - Cada vez que la vista va a ser quitada de la pantalla, este metodo se llama. Aqui se cancelan peticiones pendientes o tambien cancelamos otras tareas pendientes.
- viewDidDissapear
  - Aquí dejamos de observar notificaciones o eventos. 


* ¿Qué es el ARC?

ARC (Automatic Reference Counting)

Se trata de un sistema de gestionamiento de memoria. Es el principal encargado de crear espacios en memoria y de también liberarlos. Cuando se hace instancia de un objeto
ARC entra en acción y asigna un espacio para ese objeto además de que mantiene registro del la localidad de ese objeto. Una vez que ARC detecte que ese objeto ya no se usa
o que ya no es prescindible ARC des-instancia el objeto y deja libre esa localidad de memoria para otros objetos.

La manera en específico en el que ARC actúa es que, checa si un cierto dato tiene referencias fuertes, si el objeto ya no tiene referencias fuertes o strong significa que
el dato ya no se está ocupando, por lo que se puede quitar sin problemas de memoria. Con respecto a las referencias debiles, ARC literalmente las ignora, porque no son 
agregadas al contador, por lo que cualquier dato que solo tenga referencias débiles es quitado de memoria. 

* ¿En qué casos se usa strong, weak y unowned?

Strong se usa por default cuando hacemos instancia de nuevos objetos o valores. Se puede especificar por medio de la palabra reservada pero no es tan necesario. ARC no 
lo quita en cuanto hayan objetos con referencias fuertes a este dato.

Cuando usamos weak no agregamos la referencia al contador de ARC. Esto hace que la variable tenga que ser declarada como opcional.

Por último unowned es igual para los ojos de ARC, pero se maneja de manera diferente. La variable unowned se declara como no opcional. Este se debe de usar
unicamente cuando se tiene certeza que durante su vida util no se va a desinstanciar, ya que si ARC entra en acción y desinstancia el dato, nos quedamos
con un apuntador "inseguro".


