object knightRider {
	
	method peso() { return 500 }

	method nivelPeligrosidad() { return 10 }

	method totalBultos() = 1

	method estaSiendoCargada() {}
}

object bumblebee {
	
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
	
	method totalBultos() = 2
	
	method estaSiendoCargada() { transformadoEnAuto = false }
}

class PaqueteDeLadrillos {
	
	var property cantidadLadrillos = 0
	var pesoPorLadrillo = 2
	
	method peso() { return pesoPorLadrillo * cantidadLadrillos }
	
	method nivelPeligrosidad() { return 2 }
	
	method cantidadDeLadrillos(cantLadrillos) { cantidadLadrillos += cantLadrillos}
	
	method cantidadDeLadrillos() {return cantidadLadrillos}
	 
	method totalBultos() { return (self.cantidadDeLadrillos() /  100).roundUp() }
	
	method estaSiendoCargada() { self.cantidadDeLadrillos(12)}
}

object arena {
	
	var peso = 0
	
	method peso() { return peso }
	
	method peso(pesoArena) {peso += pesoArena}
	
	method nivelPeligrosidad() { return 2}
	
	method totalBultos() = 1
	
	method estaSiendoCargada() { self.peso(20)}
}

object bateriaAntiaerea {
	
	var estaCargada = false
	
	method peso() { return if (estaCargada) { 300 } else { 200 }  }
	
	method nivelPeligrosidad() { return if (estaCargada) { 100 } else { 0 }  }
	
	method cargar() { estaCargada = not estaCargada }
	
	method totalBultos() { return if (estaCargada) { 2 } else { 1 }  }
	
	method estaSiendoCargada() { estaCargada = true}
}

object contenedorPortuario {
	
	var cosas = []
	var pesoPropio = 100
	
	method cargar(unaCosa) {cosas.add(unaCosa)}
	
	method descargar(unaCosa){cosas.remove(unaCosa)}
	
	method estaVacio() = cosas.isEmpty()

	method peso() { return if (self.estaVacio()) { pesoPropio } else { pesoPropio + self.pesoDeCarga() }  }

	method pesoDeCarga() = cosas.sum({cosa => cosa.peso()})
	
	method nivelPeligrosidad() { return if (self.estaVacio()) { 0 } else { self.mayorNivelDePeligrosidadDeCarga() } }
	
	method mayorNivelDePeligrosidadDeCarga() = cosas.map( {cosa => cosa.nivelPeligrosidad()} ).max()
	
	method totalBultos() { return if (self.estaVacio()) { 1 } else { self.totalBultosCarga()  + 1 } }
	
	method totalBultosCarga() = cosas.sum({cosa => cosa.totalBultos()})
	
	method estaSiendoCargada() { cosas.forEach({ cosa => cosa.estaSiendoCargada()})}
}

object residuosRadioactivos {
	
	var peso = 0
	
	method peso() { return peso  }
	
	method peso(unPeso) { peso += unPeso  }
	
	method nivelPeligrosidad() { return 200 }
	
	method totalBultos() = 1
	
	method estaSiendoCargada() { self.peso(15)}
}

object embalajeDeSeguridad {
	
	var cosaAEnvolver = knightRider
	
	method envolver(unaCosa) { cosaAEnvolver = unaCosa}

	method peso() { return cosaAEnvolver.peso()  }

	method nivelPeligrosidad() { return cosaAEnvolver.nivelPeligrosidad().div(2) }
	
	method totalBultos() = 2
	
	method estaSiendoCargada() {}
	
}