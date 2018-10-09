import sindicato.*

class TrabajadorCooperativista {
	var sindicato

	method sindicato() { return sindicato }
	method sindicato(sind) { sindicato = sind }

	method localidadesDondePuedeTrabajar() { 
		return #{"Morón", "Hurlingham", "El Palomar", "Villa Tesei"}
	}
	
	method puedeTrabajarEn(localidad) {
		return self.localidadesDondePuedeTrabajar().contains(localidad)
	}

	method honorariosPorHora() { return 250 }
	
	method cobrar(importe) {
		cooperativaDelOeste.recaudar(importe)
	}
}

class TrabajadorAfiliado {
	var sindicato

	method sindicato() { return sindicato }
	method sindicato(sind) { sindicato = sind }
	
	method localidadesDondePuedeTrabajar() {
		return #{sindicato.localidad()}
	}
	
	method honorariosPorHora() { 
		return sindicato.honorariosRecomendados()
	}
	
	method puedeTrabajarEn(localidad) {
		return self.localidadesDondePuedeTrabajar().contains(localidad)
	}
	
	method cobrar(importe) {
		sindicato.recibirDonacion(importe * 0.2)
	}
}

class TrabajadorLibre {
	var sindicato
	var localidadesDondePuedeTrabajar = #{}
	var honorariosPorHora
	var totalRecaudado = 0

	method sindicato() { return sindicato }
	method sindicato(sind) { sindicato = sind }
	
	method localidadesDondePuedeTrabajar(localidades) { 
		localidadesDondePuedeTrabajar = localidades
	}
	
	method localidadesDondePuedeTrabajar() { 
		return localidadesDondePuedeTrabajar
	}
	
	method honorariosPorHora(hono) { honorariosPorHora = hono }
	method honorariosPorHora() { return honorariosPorHora }
	
	method totalRecaudado() { return totalRecaudado }
	
	method puedeTrabajarEn(localidad) {
		return self.localidadesDondePuedeTrabajar().contains(localidad)
	}
	
	method cobrar(importe) {
		totalRecaudado += importe
	}
	
	method pasarDinero(destinatario, importe) {
		totalRecaudado -= importe
		destinatario.cobrar(importe)
	}
}