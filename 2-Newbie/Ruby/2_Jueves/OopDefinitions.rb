-->Inheritance 

Permite a otra clase recibir las propiedades y metodos de una clase ya existente. detro de Inheritance se tienen dos conceptos subclassing (hacer una clase basada en otra) y overriding (cambiar como funciona la clase previa) y con esto se pueden organizar los objetos en hierarchy. La clase principal se llama superclass o base-class, o de manera coloquial clase padre. La clase que hereda las propiedades se llama subclass o derived-class, o tambien clase hijo. los hijos son intancias mas especificas que las superclases. 

--> Composition

son las relaciones esntre objetos. Cada objeto tiene sus caracterisitcas y responsabilidades, pero estan relacionadas a traves de una clase. 

--> Encapsulation

consiste en "ocultar" un codigo para usarlo como caja negra, es decir, puedes usarlo, pero no ver o modificar el interior de ese codigo. La idea de la Encapsulation es mantener las clases separadas y evitar que esten estrechamente unidas entre si. 

--> Duck Typing

signific que el codigo aceptarà cualquier objeto que tenga un método particular. 

-->the Law of Demeter

es una guia para el desarrollo de software que en resumen inlcuye que cada unidad tiene conocimiento limitado sobre otras, solo se comunican entre unidades cercanas y conocidas. 

-->Overriding Methods (and using super)

Significa tener que las clases hijas tiene metodos con edl mismo nombre que los padres, pero con especificacines diferentes. La ejecucuon del metodod depende del objeto que llama al metodo.

--> Scope

consite en determinar el alcance de las variables, en donde pueden usarse y llamarse.

-->Private vs Publics Methods

los metodos provados con aquellos que no pueden ser llamados fuera de su clase.Los publicos pueden usarse por cuaquiera.

-->Instance vs Class Methods and variables

las instancias de una clase pueden llamar los metodos definidos en esa clase por medio de instancia.nombreMetodo, si son metodos de instancia, pero los metodos de clase solo se aplican a las clases. Las variables de clase soo se pueden usar dentro de la clase.

--> Polimorfismo

Son metodos cuyos argumentos pueden ser de diferentes tipos, por ejemplo si tengo un metodo suma(a,b) a y b pueden ser numeros, arreglos o strings

-->Separation of Concerns(SoC)

Consiste en separar un codigo en diferentes secciones, donde cada una tenga diferente informacion que afecta el codigo. Un programa que sigue el SoC es llamado modular. 




