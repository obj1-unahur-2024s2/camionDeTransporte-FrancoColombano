import cosas.*
object camion {
    const carga = []

    method cargar(cosa){
        carga.add(cosa)
        cosa.consecuencia()
    }

    method descargar(cosa){
        carga.remove(cosa)
    }

    method peso() = 1000 + carga.sum({c => c.peso()})

    method cargaImpar() = cosas.all({c => c.peso().odd()})

    method hayCargaConPeso(peso) = carga.any({c => c.peso() == peso})

    method cargaConPeligrosidad(peligrosidad) {
        return
        carga.find({c => c.peligrosidad() == peligrosidad})
    }

    method cosasQueSuperanPeligrosidad(peligrosidad){
        return
        cosas.filter({c => c.peligrosidad() > peligrosidad})
    }

    method cosasQueSuperaPeligrosidadDe(cosa){
        return
        self.cosasQueSuperaPeligrosidadDe(cosa.peligrosidad())
    }

    method estaExcedidoDePeso() = self.peso() > 2500

    method puedeCircularEnRuta(peligrosidad) {
        return
        not self.estaExcedidoDePeso() and 
        not self.algunElementoSuperaPeligrosidad(peligrosidad)
    }

    method algunElementoSuperaPeligrosidad(peligrosidad){
        return
        carga.any({c => c.peligrosidad() > peligrosidad})
    }
    } 