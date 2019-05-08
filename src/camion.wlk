import cosas.*

object camion {
	const property cosas = []
	
	const pesoMaximo = 2500
	
	method cargar(unaCosa) {
		unaCosa.cambiar()
		cosas.add(unaCosa)
	}
	
	method descargar(unaCosa) {
		cosas.remove(unaCosa)
	}
	
	method pesoTotal() {
		return cosas.sum({ cosa => cosa.peso()})
	}
	
	method excedidoDePeso() {
		return self.pesoTotal() > pesoMaximo
	}
	
	method objetosPeligrosos(nivel) = cosas.filter( {cosa => cosa.peligrosidad() > nivel})
	
	method objetosMasPeligrososQue(cosa) = self.objetosPeligrosos(cosa.peligrosidad())	
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) = self.objetosPeligrosos(nivelMaximoPeligrosidad).size() == 0
	
	method tieneAlgoQuePesaEntre(min, max) = cosas.between({cosa => cosa.peso().between(min, max)})
	
	method cosaMasPesada() = cosas.max({cosa => cosa.peso()})
	
	method totalBultos() = cosas.sum({cosa => cosa.totalBultos()})
	
	method pesos() = cosas.map({cosa => cosa.peso()})
}
