--Creating Packages
/*
¿Qué son los paquetes PL / SQL?
• Un paquete es un objeto de esquema que agrupa lógicamente
Tipos de PL / SQL, variables y subprogramas.
• Los paquetes generalmente tienen dos partes:
- Una especificación (spec)
- Un cuerpo
• La especificación es la interfaz del paquete. Eso
declara los tipos, variables, constantes, excepciones,
cursores y subprogramas a los que se puede hacer referencia desde
Fuera del paquete.
• El cuerpo define las consultas para los cursores y el código.
para los subprogramas.
• Habilite el servidor Oracle para leer múltiples objetos en
memoria a la vez
*/

/*
Ventajas de usar paquetes
• Modularidad: encapsulando construcciones relacionadas
• Mantenimiento sencillo: mantener funcionalidades relacionadas lógicamente
juntos
• Diseño de aplicación más fácil: codificación y compilación de
especificación y cuerpo por separado
• Provisión para ocultar información:
- Solo las declaraciones en la especificación del paquete son visibles
y accesible a las aplicaciones.
- Las construcciones privadas en el cuerpo del paquete están ocultas y
inaccesible.
- Toda la codificación está oculta en el cuerpo del paquete.
*/


/*
Crea un paquete en dos partes:
• La especificación del paquete es la interfaz para sus aplicaciones. Declara al público
tipos, variables, constantes, excepciones, cursores y subprogramas disponibles para su uso. los
La especificación del paquete también puede incluir PRAGMA, que son directivas para el compilador.
• El cuerpo del paquete define sus propios subprogramas y debe implementarse completamente
subprogramas declarados en la parte de especificación. El cuerpo del paquete también puede definir
Construcciones PL / SQL, como tipos, variables, constantes, excepciones y cursores.
*/



/*
Los componentes públicos se declaran en la especificación del paquete. La especificación define un
interfaz pública de programación de aplicaciones (API) para usuarios de características y funcionalidades de paquetes,
es decir, se puede hacer referencia a los componentes públicos desde cualquier entorno de servidor Oracle que sea
externo al paquete.
Los componentes privados se colocan en el cuerpo del paquete y solo pueden ser referenciados por otros
construye dentro del mismo cuerpo del paquete. Los componentes privados pueden hacer referencia al público.
componentes de un paquete.
Nota: Si una especificación de paquete no contiene declaraciones de subprograma, no hay
requisito para un cuerpo de paquete
*/


/*
Creando la especificación del paquete:
Uso de la declaración CREAR PAQUETE
*/

CREATE [OR REPLACE] PACKAGE package_name IS|AS
public type and variable declarations
subprogram specifications
END [package_name];


/*
La opción O REEMPLAZAR cae y vuelve a crear el
especificación del paquete
• Las variables declaradas en la especificación del paquete son
inicializado a NULL por defecto.
• Todas las construcciones declaradas en una especificación de paquete son
visible para los usuarios que tienen privilegios en el paquete.
*/
