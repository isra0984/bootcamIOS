//Funciones

var pasosGuardados = 0

func caminar(pasos: Int) {
    pasosGuardados = pasosGuardados + pasos
    print("Usted camino \(pasosGuardados) pasos.")
}

caminar(pasos: 20)
caminar(pasos: 20)
caminar(pasos: 2)
//pasos = 20
//caminar()

