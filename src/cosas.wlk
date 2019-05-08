object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method totalBultos() = 1
	method cambiar() {}
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
	method totalBultos() = 2
	method cambiar() { self.transformar()}
}

object paqueteDeLadrillos {
	
	var cantidadLadrillos = 0
	
	method peso() { return 2 * cantidadLadrillos }
	method nivelPeligrosidad() { return 2  }
	method cantidadDeLadrillos(cantLadrillos) { cantidadLadrillos += cantLadrillos}
	method cantidadDeLadrillos() {return cantidadLadrillos} 
	method totalBultos() { return if (self.cantidadDeLadrillos() > 100) { 2 } else if(self.cantidadDeLadrillos() > 200) { 3 } else 1  }
	method cambiar() { self.cantidadDeLadrillos(12)}
}

object arena {
	
	var peso = 0
	method peso() { 
		return peso
	}
	
	method peso(pesoArena) { 
		peso += pesoArena
	}
	
	method nivelPeligrosidad() { 
		return 2
	}
	
	method totalBultos() = 1
	
	method cambiar() { self.peso(20)}
	
}

object bateriaAntiaerea {
	
	var estaCargada = false
	
	method peso() { return if (estaCargada) { 300 } else { 200 }  }
	method nivelPeligrosidad() { return if (estaCargada) { 100 } else { 0 }  }
	method cargar() { estaCargada = not estaCargada }
	method totalBultos() { return if (estaCargada) { 2 } else { 1 }  }
	method cambiar() { self.cargar()}
}

object contenedorPortuario {
	
	var cosas = []
	var pesoPropio = 100
	
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}
	
	method descargar(unaCosa){
		cosas.remove(unaCosa)	
	}
	
	method estaVacio() = cosas.isEmpty()
	
	method peso() { return if (self.estaVacio()) { pesoPropio } else { pesoPropio + self.pesoDeCarga() }  }
	
	method pesoDeCarga() = cosas.sum({cosa => cosa.peso()})
	
	method nivelPeligrosidad() { return if (self.estaVacio()) { 0 } else { self.mayorNivelDePeligrosidadDeCarga() } }
	
	method mayorNivelDePeligrosidadDeCarga() = cosas.map( {cosa => cosa.nivelPeligrosidad()} ).max()
	
	method totalBultos() { return if (self.estaVacio()) { 1 } else { self.totalBultosCarga() } }
	
	method totalBultosCarga() = cosas.sum({cosa => cosa.totalBultos()})
	
	method cambiar() { cosas.forEach({ cosa => cosa.cambiar()})}
}

object residuosRadioactivos {
	var peso = 0
	
	method peso() { return peso  }
	method peso(unPeso) { peso += unPeso  }
	method nivelPeligrosidad() { return 200  }
	method totalBultos() = 1
	method cambiar() { self.peso(15)}
}

object embalajeDeSeguridad {
	
	var cosaAEnvolver = knightRider
	
	method envolver(unaCosa) {
		cosaAEnvolver = unaCosa
	}
	method peso() { return cosaAEnvolver.peso()  }
	
	method nivelPeligrosidad() { return cosaAEnvolver.peligrosidad().div(2) }
	method totalBultos() = 2
	method cambiar() {}
	
}