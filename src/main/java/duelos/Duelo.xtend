package duelos

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import retador.Retador
import retador.Bot
import domain.Jugador
import resultado.Victoria
import resultado.Derrota
import resultado.Resultado
import resultado.Empate

@Accessors
@Observable
class Duelo {
			
	Retador retador	
	Retador retado		
	Resultado resultado
	
	new(Retador ret1,  Retador ret2  )
	{
		this.retador = ret1
		this.retado = ret2
	}
	
	/**
	 * ejecuta la pelea entre retadores, aplicando las actualizaciones de estadisticas necesarias segun el caso
	 */
	def void realizarse(){
		switch retador {
		  case retador.esMasPoderosoQue(retado)		: aplicarCambios(new Victoria(retador, retado))
		  case retado.esMasPoderosoQue(retador)		: aplicarCambios(new Derrota(retador, retado))
		  default									: aplicarCambios(new Empate(retador, retado))
		} 
	}
	
	
	def aplicarCambios(Resultado r){			
		resultado = r
		resultado.actualizarEstadisticas(this)
	}
	
	def dispatch agregarDuelos(Bot retador, Duelo duelo){
		
	}	
	
	def dispatch agregarDuelos(Retador it, Duelo duelo){
		jugador.duelos.add(duelo)
	}
	
	def sonIgualDePoderosos(Retador it, Retador ret){
		it.poderDeAtaque == ret.poderDeAtaque
	}
	
	def boolean involucraA(Jugador jug) {
		this.retador.jugador.equals(jug) || this.retado.jugador.equals(jug)
	}
	
	
	
}