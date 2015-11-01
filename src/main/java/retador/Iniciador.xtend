package retador
import org.eclipse.xtend.lib.annotations.Accessors
import domain.Jugador
import domain.Personaje
import domain.Ubicacion
import java.util.Random
import duelos.Duelo
import calculadorDeCalificaciones.CalculadorDeCalificaciones

@Accessors
class Iniciador extends Retador{
	
	new(Jugador jugador, Personaje personaje, Ubicacion ubicacion) {
		super(jugador,personaje, ubicacion)
	}
	
	new() {
		super()
	}
			
	def paraInicializadores(){		
		estadisticas(personaje).agregarAssist
		estadisticas(personaje).agregarUnaParticipacion
		estadisticas(personaje).ubicacionesUsadas.add(ubicacion)
	}
	
	override aplicarActualizacionAlGanar(Duelo duelo) {
		agregarDuelosAJugador(duelo)
		paraInicializadores
		estadisticas(personaje).agregarUnaVictoria
		estadisticas(personaje).mejorUbicacion = ubicacion		
		val nroAlAzar = new Random().nextInt(100)
		estadisticas(personaje).calificacion = new CalculadorDeCalificaciones().calcular(this,nroAlAzar)
	}
	
	override aplicarActualizacionAlPerder(Duelo duelo) {
		agregarDuelosAJugador(duelo)
	}
	
	override aplicarActualizacionAlEmpatar(Duelo duelo) {
		agregarDuelosAJugador(duelo)
		estadisticas(personaje).agregarAssist
	}
	
		
}