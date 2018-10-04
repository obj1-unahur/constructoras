// esta clase está completa, no necesita nada más
class TrabajadorCooperativista {
	var sindicato

	method sindicato() { return sindicato }
	method sindicato(sind) { sindicato = sind }

	method localidadesDondePuedeTrabajar() { return #{"Morón", "Hurlingham", "El Palomar", "Villa Tesei"} }

	method honorariosPorHora() { return 250 }
}


// a esta clase le faltan métodos
class TrabajadorAfiliado {
	var sindicato

	method sindicato() { return sindicato }
	method sindicato(sind) { sindicato = sind }
}


// a esta clase le faltan atributos y métodos
class TrabajadorLibre {
	var sindicato

	method sindicato() { return sindicato }
	method sindicato(sind) { sindicato = sind }
}
