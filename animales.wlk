class Animal {
    const id = random(1000000).truncate()
    var tipo
    var peso
    var vacunado = false
    var enfermo = false
    var tiempoSinComer = 0
    var vecesComidaSinAgua = 0

    method Animal(_tipo, _peso) {
        tipo = _tipo
        peso = _peso
    }

    method tieneHambre() = true
    method tieneSed() = false
    method ganarPeso(cantidadAlimento) { peso += cantidadAlimento }
    method puedeVacunarse() = true
    method getPesoMinimoReproduccion() = 0

    method beber() {
        vecesComidaSinAgua = 0
    }

    method comer(cantidadAlimento) {
        self.ganarPeso(cantidadAlimento)
        tiempoSinComer = 0
        vecesComidaSinAgua += 1
    }

    method caminar() {
        // Los animales no pierden peso al caminar por defecto
    }

    method vacunar() {
        if (self.puedeVacunarse()) {
            vacunado = true
        }
    }

    method enfermar() {
        if (not vacunado) enfermo = true
    }

    method puedeReproducirse() {
        return not enfermo and peso > self.getPesoMinimoReproduccion()
    }

    method pasarTiempo() {
        if (self.tieneHambre()) tiempoSinComer += 1
    }

    method debeMorir() {
        return tiempoSinComer >= 3
    }
}
class Vaca inherits Animal {
    var yaComio = false

    method Vaca() {
        super("vaca", 50)
    }

    override method tieneHambre() = peso < 400
    override method tieneSed() = yaComio and vecesComidaSinAgua > 0

    override method ganarPeso(cantidadAlimento) {
        peso += (cantidadAlimento / 2)
        yaComio = true
    }

    override method beber() {
        super.beber()
        peso -= 1
        yaComio = false
    }

    override method caminar() {
        peso -= 3
    }

    override method getPesoMinimoReproduccion() = 300
}

class Chancho inherits Animal {
    method Chancho() {
        super("chancho", 30)
    }

    override method tieneHambre() = peso < 200
    override method tieneSed() = vecesComidaSinAgua >= 3

    override method ganarPeso(cantidadAlimento) {
        if (cantidadAlimento > 5) {
            peso += (cantidadAlimento - 5)
        }
    }

    override method getPesoMinimoReproduccion() = 150
}

class Gallina inherits Animal {
    method Gallina() {
        super("gallina", 4)
    }

    override method tieneHambre() = true
    override method ganarPeso(cantidadAlimento) {
        // No gana peso
    }
    override method puedeVacunarse() = false
    override method getPesoMinimoReproduccion() = 3
}