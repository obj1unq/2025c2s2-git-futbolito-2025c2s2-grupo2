/** First Wollok example */
import wollok.game.*

object lionel {
	var property position = game.at(3,5)
	var property balon = pelota
	
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
		self.validarPelotaEnPie()
		balon.elevar()
	}
	
	method taquito() {
		self.validarPelotaEnPie()
		balon.position(game.at((balon.position().x()-2).max(0), balon.position().y()))
	}

	method validarPelotaEnPie() {
		if(position != balon.position()){
			self.error("La pelota no esta en el pie")
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
