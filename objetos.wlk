
import wollok.game.*

object lionel {
	
	var property position = game.at(3,5)
	var property unaPelota = pelota
	
	method image() {
		return "lionel-titular.png"
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}
	
	method patear() {
		self.validarMismaPosicionPelota()
		self.patearPelota()
	}

	method validarMismaPosicionPelota() {
		if (pelota.position() != self.position())
			{self.error("No estoy cerca de la pelota, no puedo patear")}
	}

	method patearPelota() {
		unaPelota.desplazar()
	  
	}
}


object pelota {
	const property image = "pelota.png"
	var property position = game.at(5,5)

	method desplazar() {
		var posx = position.x().max(0) + 3
		var posxx = posx.min(game.width()-1)
		position= game.at(posxx, position.y())
	  
	}	
}
