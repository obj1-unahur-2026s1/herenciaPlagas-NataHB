class Plaga{
  var poblacion

  method nivelDeDaño()
  method transmitenEnfermedades() = poblacion >= 10
  method atacarElemento(elem) { elem.serAtacadoPor(self) ; poblacion *= 1.1} 
}

class PlagaCucarachas inherits Plaga{
  var pesoPromedio
  override method nivelDeDaño() = poblacion / 2
  override method transmitenEnfermedades() = super() && pesoPromedio >= 10
  override method atacarElemento(elem) {
    super(elem); 
    pesoPromedio += 2
  }
}

class PlagaPulgas inherits Plaga{
  override method nivelDeDaño() = poblacion * 2  
}

class PlagaGarrapatas inherits PlagaPulgas{
  override method atacarElemento(elem) {
    elem.serAtacadoPor(self);
    poblacion *= 1.2
  }
}

class PlagaMosquitos inherits Plaga{
  override method nivelDeDaño() = poblacion
  override method transmitenEnfermedades() = super() && poblacion % 3 == 0
}