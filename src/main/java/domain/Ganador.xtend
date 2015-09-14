package domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Ganador implements Veredicto{
	
	override actualizarEstadisticasSegunVeredicto(Retador it) {
		actualizarUsandoInicio(it,it.inicio)
		println("Termine Ganador")
	}
	
	def dispatch actualizarUsandoInicio(Retador it, Iniciador inicio) {
		estadisticas(it.personaje).agregarUnaVictoria
		estadisticas(it.personaje).mejorUbicacion = ubicacion
	}
	
	def dispatch actualizarUsandoInicio(Retador it, NoIniciador inicio) {
		estadisticas(personaje).sumarKill
	}
	
	
	
		
//	override actualizarEstadisticas(Retador it) {
//		estadisticas.agregarUnaParticipacion
//		estadisticas.agregarUnaVictoria
//		actualizacionesDependientesDeLaPosicion
//		println("Termine??")
//	}
//	
//	def void actualizacionesDependientesDeLaPosicion(Retador it) {
//		inicio.actualizarA(it)
//	}
		
//	override actualizaSegunGanesPierdasOEmpates(Retador it) {
//		estadisticas.mejorUbicacion = ubicacion		
//	}
}