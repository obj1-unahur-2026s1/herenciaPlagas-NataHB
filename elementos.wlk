class Hogar {
    var mugre
    const confort
    method esBueno() = mugre * 2 <= confort
    method recibirAtaqueDe(unaPlaga) {
      mugre = mugre + unaPlaga.nivelDeDaño()
    }
}

class Huerta{
    var produccion
    method esBueno() = produccion > nivelDeCosechas.valor()
    method recibirAtaqueDe(unaPlaga) {
      produccion = produccion - (unaPlaga.nivelDeDaño() * 0.1 + if(unaPlaga.transmiteEnfermedad()) 10 else 0)
    } 
}

object nivelDeCosechas {
  var property valor = 10 
}

class Mascota {
  var salud
  method esBueno() = salud > 250 
  method recibirAtaqueDe(unaPlaga) {
    if (unaPlaga.transmiteEnfermedad()){
        salud = (salud - unaPlaga.nivelDeDaño()).max(0)
    }
  }
}

class Barrio {
  const elementos = []
  // SI MAS DE LA MITAD ES BUENO ENTONCES ES COPADO
  method esCopado() {
    return 
    self.cantElementosBuenos() > elementos.size() / 2
  } 

  method cantElementosBuenos() = elementos.count({e=>e.esBueno()})
}