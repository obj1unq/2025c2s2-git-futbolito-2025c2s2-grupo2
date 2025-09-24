/** First Wollok example */
import wollok.game.*

object lionel {
	
	var property position = game.at(3,5)
	var property camiseta = "titular"
	
	method image() {
		return "lionel-" + camiseta + ".png"
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}
	
	method cambiarCamiseta(){
		self.validarCambioCamiseta()
		if(camiseta == "titular"){
			camiseta = "suplente"
		}
		else{
			camiseta = "titular"
		}
	}

	method validarCambioCamiseta(){
		if(self.position() != game.at(0, 5)){
			self.error("No está en el borde izquierdo, no puede cambiar la camiseta")
		}
	}
}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)	
}
