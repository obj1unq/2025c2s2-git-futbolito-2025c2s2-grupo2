
import wollok.game.*

object lionel {
	var property position = game.at(3,5)
	var property balon = pelota
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

	method patear() {
		self.validarPelotaEnPie()
		self.patearPelota()
	}

	method patearPelota() {
		balon.desplazar()
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

	method elevar() {
		position = position.up(1)
		game.schedule(2000, {self.descender()})
	}

	method descender() {
		position = position.down(1)
	}

	method desplazar() {
		var posx = position.x().max(0) + 3
		var posxx = posx.min(game.width()-1)
		position= game.at(posxx, position.y())
	  
	}	
}

