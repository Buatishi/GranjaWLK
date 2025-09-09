import animales.*
import granja.*
// Run all tests

// Run describe

describe  "Poniendo a prueba la granja"{

  // Run test | Debug test
test "no deberia permitir cantidad negativa de animales" {
    assert.throws { 
        granja.agregarAnimales(-5) 
    }
}

  // Run test | Debug test
test "la gallina no puede poner mas huevos de los permitidos" {
    repeat(100) { gallina.poneHuevo() }   
    assert.throws {
        gallina.poneHuevo()
    }
}

  // Run test | Debug test
test "buscar un animal inexistente rompe" {
    assert.throws {
        granja.buscarAnimal("dinosaurio")
    }
}
