import animales.*

class Granja {
    const animales = []
    var tiempo = 0

    method Granja() {
        animales.add(new Vaca())
        animales.add(new Vaca())
        animales.add(new Chancho())
        animales.add(new Chancho())
        animales.add(new Gallina())
        animales.add(new Gallina())
        animales.add(new Gallina())
    }

    method obtenerAnimalesHambre() {
        return animales.filter({ animal => animal.tieneHambre() })
    }

    method alimentarAnimales(cantidadAlimento) {
        return obtenerAnimalesHambre()
            .forEach({ animal => 
                animal.comer(cantidadAlimento) .size()
            })
            
    }

    method obtenerAnimalesSinVacunar() {
        return animales.filter({ animal => 
            not animal.estaVacunado() and animal.puedeVacunarse() 
        })
    }

    method vacunarAnimales() {
        return obtenerAnimalesSinVacunar()
            .forEach({ animal => animal.vacunar() })
            .size()
    }

    method pasarTiempo() {
        tiempo += 1
        animales.forEach({ animal => 
            animal.pasarTiempo()
            if (animal.debeMorir()) {
                animales.remove(animal)
            }
        })
    }
}