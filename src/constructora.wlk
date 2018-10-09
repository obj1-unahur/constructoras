class Constructora {
	var trabajadores
	var honorarioReferencia
	
	method trabajadores() { return trabajadores }
	method trabajadores(trab) { trabajadores = trab}
	
	method honorarioReferencia() { return honorarioReferencia }
	method honorarioReferencia(hono) { honorarioReferencia = hono}
	
	method trabajadoresBaratos() {
		return trabajadores.filter { 
			trab => trab.honorariosPorHora() < honorarioReferencia
		}
	}
	
	method sindicatosIntervinientes() {
		return trabajadores.map { trab => trab.sindicato() }.asSet()
	}
	
	method trabajadorMasCaro() {
		return trabajadores.max { trab => trab.honorariosPorHora() }
	}
	
	method estaCubierta(localidad) {
		return trabajadores.any { 
			trab => trab.puedeTrabajarEn(localidad)
		}
	}
	
	method trabajadoresPorSindicato(sindicato) {
		return trabajadores
			.count { trab => trab.sindicato() == sindicato }
	}
}