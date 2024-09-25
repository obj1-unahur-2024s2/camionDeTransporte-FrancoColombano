object knightRider {
    method peso() = 500
    method peligrosidad() = 10
    method bulto() = 1
    method consecuencia() {}
}

object bumblebee {
    var estaTransformado = false
    method peso() = 800
    method transformar() {
      estaTransformado = !estaTransformado
    }
    method peligrosidad() = if(estaTransformado) 15 else 30
    method bulto() = 2
    method consecuencia() {
      if (not estaTransformado) self.transformar()
    }
}

object paqueteLadrillos {
    var property cantidadLadrillos = 0
    method peso() = cantidadLadrillos * 2
    method peligrosidad() = 2
    method bultos() {
        if(cantidadLadrillos.between(0, 100)) return 1
        if(cantidadLadrillos.between(101, 300)) return 2
        return 3
    }
    method consecuencia() {
        self.cantidadLadrillos(self.cantidadLadrillos()+12)
    }
}

object arenaGranel {
    var property peso = 0
    method peligrosidad() = 1
    method bulto() = 1
    method consecuencia(){
        self.peso(self.peso()-10)
    }
}

object bateriaAntiaerea {
    var tieneMisiles = false
    method cargarMisiles() {
        tieneMisiles = true
    }
    method descargarMisiles(){
        tieneMisiles = false
    }
    method peso() = if(tieneMisiles) 300 else 200
    method peligrosidad() = if(tieneMisiles) 100 else 0
    method bulto() = if(tieneMisiles) 2 else 1
    method consecuencia(){self.cargarMisiles()}
}

object contenedorPortuario {
    const contenido = [] 
    method agregarAlContenedor(cosa){
        contenido.add(cosa)
    }
    method peso() = 100 + contenido.sum({c => c.peso()})
    method peligrosidad() {
        if (not contenido.isEmpty())
            return contenido.max({c => c.peligrosidad()}).peligrosidad()
        return 0  
    } 
    method bulto() = 1 + contenido.sum({c => c.bulto()})
    method consecuencia(){
        contenido.forEach({c => c.consecuencia()})
    }
}

object residuosRadioactivos {
    var property peso = 0
    method peligrosidad() = 200
    method bulto() = 1
    method consecuencia(){
        self.peso(self.peso()+15)
    }
}

object embalajeSeguridad {
    var property envuelveA = elementoNull
    method peso() = envuelveA.peso()
    method peligrosidad() = envuelveA.peligrosidad()
    method bulto() = 2
    method consecuencia(){}
}

object elementoNull {
    method peso() = 0
    method peligrosidad() = 0
}