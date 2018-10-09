// esta clase está completa, no necesita nada más
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
}

class TrabajadorLibre {
	var sindicato
	var localidadesDondePuedeTrabajar = #{}
	var honorariosPorHora

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
	
	method puedeTrabajarEn(localidad) {
		return self.localidadesDondePuedeTrabajar().contains(localidad)
	}
}