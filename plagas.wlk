class Plaga {
    var poblacion
    method transmiteEnfermedad() {
        return poblacion >= 10 && self.condicionAdicional()
    } 
    method condicionAdicional() 
    method nivelDeDaño()
    method atacar(unElemento){
        unElemento.recibirAtaqueDe(self)
        poblacion = poblacion * 1.1
    }
}

class Cucarachas inherits Plaga {
  var pesoPromedio 
  override method nivelDeDaño() {
    return poblacion * 0.5
  }
  override method condicionAdicional() {
    return pesoPromedio >= 10
  }
  override method atacar(unElemento){
        super(unElemento)
        pesoPromedio = pesoPromedio + 2
    }
}

class Pulgas inherits Plaga {
  override method nivelDeDaño() = poblacion * 2
  override method condicionAdicional() = true
}

class Garrapata inherits Pulgas {
  override method atacar(unElemento){
        unElemento.recibirAtaqueDe(self)
        poblacion = poblacion * 1.2
    }
}

class Mosquitos inherits Plaga {
  override method nivelDeDaño() = poblacion
  override method condicionAdicional() = poblacion % 3 == 0 
}