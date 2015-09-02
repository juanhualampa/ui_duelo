package domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Denuncia {
	
	Duelo contexto	
	Motivo unMotivo	
	Descripcion unaDescripcion
	
	new(Duelo contexto, Motivo unMotivo, Descripcion unaDescripcion) {
    	this.contexto = contexto
    	this.unMotivo = unMotivo
    	this.unaDescripcion = unaDescripcion
    }
    
    def void castigar() {
    	if(calcularValidez())
    		unMotivo.evaluarse(contexto)	//cada motivo sabe evaluarse y castigar si corresponde
    	else {
    		val abuso = new AbusoDelSistemaDeDenuncias()	//podria ir el string de pantalla
    		abuso.sancionar(this)
    		
    		}
    }
    
	
	def calcularValidez() {
		/*
		 * Deberia decirme si es fake y no, y con esa informacion que se hace???
		 * 
		 */ 
		
		(unaDescripcion.poseeMenosDe20Caracteres() || unaDescripcion.sonMenosDe3Palabras())
	}
	
//	def void getObtenerJugadorACastigar() {
//		if(calcularValidez())
//    		unMotivo.evaluarse(this)	//cada motivo sabe evaluarse y castigar si corresponde
//    	else {
//    		val abuso = new AbusoDelSistemaDeDenuncias()	//podria ir el string de pantalla
//    		abuso.sancionar(this)
//    		
//    		}
//	}
	
}
