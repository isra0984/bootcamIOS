import UIKit

//Clases

//enumeracion
enum NumeroDePuertas: Int {
    case cuatro = 4
    case dos = 2
    case cinco = 5
}
//Representa un objeto en este un automovil
class AutomovilClase {
    
    var puertas: NumeroDePuertas = NumeroDePuertas.cuatro
    var llantas: Int = 0
    var color: String = "negro"
    var numeroDeGas: Int = 0
    
    //Constructor
    init(puertas: NumeroDePuertas, llantas: Int, color: String, numeroDeGas: Int) {
        self.puertas = puertas
        self.llantas = llantas
        self.color = color
        self.numeroDeGas = numeroDeGas
    }
    
    init(puertas: NumeroDePuertas, llantas: Int, color: String) {
        self.puertas = puertas
        self.llantas = llantas
        self.color = color
    }
    
    init() {
    }
    
    func encender() {
        
        if numeroDeGas > 0 {
            print("El auto esta encendido")
        } else {
            print("El auto no puede encender por que no tiene gasolina")
        }
        
    }
    
    func dameElNumeroDePuertas() -> Int {
        return puertas.rawValue
    }
    
    func apagar() {
        print("El auto esta apagado")
    }
    
    func cargarGasolina(medidorGasolina: Int) {
        numeroDeGas = medidorGasolina
    }
    
}

//Instanciar o crear
let strName: String = String("Israel")
//Nace mi objeto

var miObjetoAutomovil: AutomovilClase = AutomovilClase()
var miSegundaClaseAutomovil = miObjetoAutomovil

print("El color del automovil es: \(miObjetoAutomovil.color)")
//Vamos a la gasolineria y lo pones premium
miObjetoAutomovil.encender()
miObjetoAutomovil.cargarGasolina(medidorGasolina: 100)
miObjetoAutomovil.encender()

print("Gasolina: \(miSegundaClaseAutomovil.numeroDeGas)")

//Estructuras
struct AutomovilEstructura {
    
    var llantas: Int = 0
    var color: String = ""
    var puertas: Int = 0
    
    //Constructor
    init(llantas: Int, color: String, puertas: Int) {
        self.llantas = llantas
        self.color = color
        self.puertas = puertas
    }
    
    init() {
    }
    
    func dameElNumeroDePuertas() -> Int {
        return puertas
    }
    
}

print("Estructura__________________________________________________________________")

//Instanciar o crear objeto apartir de una estructura
var objetoAutomovilStructura = AutomovilEstructura(llantas: 4, color: "Rojo", puertas: 2)
var segundoObjetoStructura = objetoAutomovilStructura

let puertas = objetoAutomovilStructura.dameElNumeroDePuertas()
print("Numero de puertas = \(puertas)")

objetoAutomovilStructura.puertas = 4

print("Puertas: \(segundoObjetoStructura.puertas)")
