class Elemento{
  method esBueno()
  method serAtacadoPor(unaPlaga)
}

class Hogar inherits Elemento{
  var nivelDeMugre
  const confort
  
  override method esBueno() = nivelDeMugre*2 <= confort
  override method serAtacadoPor(unaPlaga) {
    nivelDeMugre += unaPlaga.nivelDeDaño()
  }
}

class Huerta inherits Elemento{
  const nivelDeCosecha = 10
  var capacidadDeProduccion 
  override method esBueno() = capacidadDeProduccion > nivelDeCosecha
  override method serAtacadoPor(unaPlaga) {
    capacidadDeProduccion -= unaPlaga.nivelDeDaño()*0.1
    if (unaPlaga.transmitenEnfermedades()){
      capacidadDeProduccion -= 10
    }
  }

}

class Mascota inherits Elemento{
  var nivelDeSalud
  override method esBueno() = nivelDeSalud > 250 
  override method serAtacadoPor(unaPlaga) {if (unaPlaga.transmitenEnfermedades()) {nivelDeSalud -= unaPlaga.nivelDeDaño()}}
}

class Barrio{
  const elementos = []

  method elementoEsBueno(elem) = elem.esBueno()
  method cantidadElementosBuenos() = elementos.count({e=>self.elementoEsBueno(e)})
  method esCopado() = self.cantidadElementosBuenos() > elementos.size()/2
}