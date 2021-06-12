//Sirve para importar o inlcuir una libreria o framework
//UIKit framework desarrollado por apple que integra codigo para generar componentes visuales como por ejemplo Boton, caja de texto, etiqueta de texto.
//import UIKit
//let button: UIColor = UIColor.white

/*
 Tipos de dato String
*/

let char: Character = "A"
let strString: String = "Hello Word"

//Interpolacion de cadenas = Unir dos cadenas una sola

let name = "Israel"
let apellido = "Torres"

let nombreCompleto = name + " " + apellido

print(nombreCompleto)

//Escapar valores en cadenas
let edad: Int = 36
let price: Double = 20.1
let esMexicano: Bool = false
var nacionalidad = ""

if esMexicano {
    nacionalidad = "Si"
} else {
    nacionalidad = "No"
}

let descripcion = nombreCompleto + ", edad: \(edad), y el precio es \(price), es mexicano: \(nacionalidad)"

print(descripcion)

