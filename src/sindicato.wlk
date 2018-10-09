class Sindicato {
	var localidad
	var honorariosRecomendados
	var donacionesRecibidas = 0
	
	method localidad(loca) { localidad = loca }
	method localidad() { return localidad }
	
	method honorariosRecomendados(honorarios) { 
		honorariosRecomendados = honorarios
	}
	
	method honorariosRecomendados() { 
		return honorariosRecomendados
	}
	
	method donacionesRecibidas() { return donacionesRecibidas }
	
	method recibirDonacion(importe) {
		donacionesRecibidas += importe
	}
}

object cooperativaDelOeste {
	var totalRecaudado = 0
	
	method totalRecaudado() {
		return totalRecaudado
	}
	
	method recaudar(importe) {
		totalRecaudado += importe
	}
}