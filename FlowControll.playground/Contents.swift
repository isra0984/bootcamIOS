/*
 Estructuras de control
 */

let a = 5
let b = 10
let c = 20

//if
if a > b {
    print("la condicion se cumple")
} else {
    print("la condicion no se cumple")
}
//if aninadado
if a > b {
    print("la condicion se cumple")
} else if a > c {
    print("la condicion no se cumple")
} else {
    print("Ninguna condicion se cumple")
}

//Switch statements
switch a {
case 1:
    print("igual a uno")
case 2:
    print("igual a dos")
case 5:
    print("igual a cinco")
default:
    print("Ninguna condicion se cumple")
}

let cadena = "Pruebas"
switch cadena {
case "sdsd":
    print("igual a uno")
case "ssd":
    print("igual a dos")
case "Pruebas":
    print("igual a Pruebas")
default:
    print("Ninguna condicion se cumple")
}

//Ciclo for
// For con operandor de rango ...
for n in 1...5 {
    print(n)
}

//arrays nos permiten almacenar mas de un valor en una sola variable
let names: [String] = ["Arthur", "Israel", "Irving", "Rodrigo", "Monce"]
let anyObjects: [Any] = ["Israel", 0, true, 0.0]

var cualquierValor: Any = "adDADSDSADS"
//CASTEO IGUALAR AL TIPO DE DATO
if let variableAComparar = cualquierValor as? String {
    if variableAComparar == "Z" {
        print("Soy Z")
    } else {
        print("No soy Z, soy:\(variableAComparar)")
    }
}

for name in names {
    print(name)
}

for any in anyObjects {
    print(any)
    //Si el valor es de tipo String asingalo a la variable valor
    if let valor = any as? String {
        
        if valor == "Israel" {
            print("Dentro del cast: \(valor)")
        }
    }
}

print("_______________________________________________________")

var numbers = [1,2,3,4,5,6]
//print(numbers)
//agrega valores al arreglo
numbers.append(7)
//print(numbers)
////quita valores del arreglo
numbers.remove(at: 0)
//print(numbers)

for i in numbers {
    print(i)
}

print("WHILE________________________________________________")
//While
var index = 10
//Mientras se cumpla la condicion realiza ciclos o interacciones
while index < 20 {
    
    print("Valor de index es \(index)")
    index = index + 1
    
}













