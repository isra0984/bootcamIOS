import UIKit

var greeting = "Hello, playground"
// esta es la estructura basica de un clousure

// { (paremtros de entrada) -> tipo_de_retorno in
//    declaraciones
// }

//ejemplo 1
let closure = { (value: Int) -> Int in
    return value + 1
}

print(closure(20))
print(type(of: closure))

//ejemplo 2
let closure2 = { (value: Int) -> Void in
     print(value)
}

closure2(30)

//ejemplo 3

var hello = { () -> Void in
    print("Hello!")
}

hello()

hello = { () -> Void in
    print("hello2")
}

hello()
print(type(of: hello))

//ejemplo 4 como parametro de entrada
func runClosure(name: String, closure: () -> Void) {
   print("\(name)")
   closure()
}

let greetingMessage = { () -> Void in
    print("Hola desde la funcion.....")
}

runClosure(name: "Israel", closure: greetingMessage)

//ejemplo 5 como parametro de salida

func returnMessage() -> () -> Void {
    
    let returnVal = { () -> Void in
        print("Hola desde parametro de retorno")
    }
    
    return returnVal
    
}

let x = returnMessage()
x()

//ejemplo 6 captura de valores (variable o constante de retorno)
print("############################################### Ejemplo 6")
func travel() -> (String) -> Void {
    
    var counter = 0
    
    return { (destino: String) -> Void  in
        
        counter += 1
       
        let message = counter > 1 ? "Veces" : "Vez"
        
        print("Has viajado \(counter) \(message) a \(destino)")
        
    }
    
}

let cancunTravel = travel()

cancunTravel("Cancun")
cancunTravel("Cancun")
cancunTravel("Cancun")
cancunTravel("Cancun")

//ejemplo 7 atributo scaping)
print("############################################### atributo scaping")
var closureStorage: ((Int) -> Int)?

func someFunction(closure: @escaping (Int) -> Int) {
    print("Dentro de la funcion...")
    closureStorage = closure
}

someFunction { value in
    return value + 1
}

let result = closureStorage?(50)
print(result)
print("finaliza todo....")
