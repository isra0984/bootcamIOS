import UIKit

//Tipos de datos numericos

let edad: Int = 1213343243432
let price: Double = 12.0
let ancho: Float = 15.0

//para medidas de componentes graficos
let anchoIOS: CGFloat = 12.0

//Operadores aritmeticos  * / + -

//operador de multiplicacion
let a = 2
let b = 3
let resMult = a * b
print("El resultado de la multiplicacion es: \(resMult)")
let resDiv: Double = Double(a) / Double(b)
print("El resultado de la divicion es: \(resDiv)")
let resSum = a + b
print("El resultado de la suma es: \(resSum)")
let resSus = a - b
print("El resultado de la resta es: \(resSus)")
//operador de comparacion o logicos  == != < > <= >=
//Valores de tipo Bool solo almacenas dos tipos de valores
let valBool: Bool = false
let valBoolDos: Bool = true

let x = 1
let y = 1

let z = 10
let w = 20

print("*************************************************")
// operador de comparacion igual a ==
print("a es igual b: \(a == b)")
print("x es igual y: \(x == y)")
// operador de comparacion diferente de !=
print("a es diferente de b: \(a != b)")
print("x es diferente de y: \(x != y)")
// operador de comparacion diferente de menor o mayor <>
print("z es menor a w: \(z < w)")
print("z es mayor a w: \(z > w)")

let g = 30
let f = 30
let h = 50
// operador de comparacion diferente de menor igual o mayor igual <= >=
print("g es menor o igual a f: \(g <= f)")
print("g es mayor o igual a f: \(g >= f)")

print("g es menor o igual a h: \(g <= h)")
print("g es mayor o igual a h: \(g >= h)")


let cadena1 = "Hola"
let cadena2 = "Hola"
let cadena3 = "word"

print(cadena1 == cadena2 && cadena1 == cadena3) //con el operador and(&&) las dos condiciones se deben cumplir
print(cadena1 == cadena2 || cadena1 == cadena3) //con el operador or(||) solo una de las condiciones se debe cumplir

let cad1 = "a"
let cad2 = "b"

print("cad1 es menor a cad2: \(cad1 < cad2)")
print("cad1 es mayor a cad2: \(cad1 > cad2)")
print("cadena1 es igual a cadena2: \(cadena1 == cadena2)")
print("cadena1 es igual a cadena3: \(cadena1 == cadena3)")
print("cadena1 es diferente a cadena3: \(cadena1 != cadena3)")

