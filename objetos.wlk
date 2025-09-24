/** First Wollok example */
import wollok.game.*

object lionel {
	
	var property position = game.at(3,5)
	
	method image() {
		return "lionel-titular.png"
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}

	method levantarla() {
		self.validarLevantarla()
		pelota.elevar()
	}

	method validarLevantarla() {
		if(pelota.position() != position ){
			self.error("No esta posicionado junto a la pelota para levantarla")
		}
	}
}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)

	method elevar() {
		position = position.up(1)
		game.schedule(2000, {self.descender()})
	}

	method descender() {
		position = position.down(1)
	}	
}
