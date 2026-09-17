object casa { 
    var suciedad 
    var cuidador 
    var quilombero
    
    method suciedad()=suciedad
    
    method pasarDia(){
    cuidador.limpiarCasa()
    self.atrapaQuilombero(cuidador)
    }
    
    method pasarNoche(){
    cuidador.dormir()
    quilombero.hacerQuilombo()
    }
    
    method atrapaQuilombero(cuidadorCasa){
        if (cuidadorCasa.puedeAtrapar(quilombero)){
            quilombero=ningunQuilombero
        }
    }
    
    method limpiar(limpieza){
        suciedad -= limpieza
    }
    
    method ensuciar(suciedadQuilombero){
        suciedad +=suciedadQuilombero
    }

    method cuidador()=cuidador
    
    method cuidador(nuevoCuidador){
        cuidador=nuevoCuidador
    }
}

object tom{ 
    var energia =100 
    method velocidad() = energia/10 +5
    
    method limpiarCasa(){
        casa.limpiar(100) 
        energia-=40
    }

    method puedeAtrapar(unQuilombero) = self.velocidad() > unQuilombero.velocidad()

    method dormir(){
        energia +=50    
    }

    method loInterrumpen(){
        energia -=20 
    }
}

object jerry{ 
    var peso = 5 
    method velocidad() = 10 - peso

    method hacerQuilombo(){
        casa.ensuciar(110)
        peso+=1
    }
}

object tuffy{ 
    const velocidad = 10

    method velocidad() = velocidad

    method hacerQuilombo(){ 
        self.hacerRuido() 
    }

    method hacerRuido(){
        casa.cuidador().loInterrumpen()
    }
}

object robocat {
    method limpiarCasa(){
        casa.limpiar(casa.suciedad()) 
    }

    method puedeAtrapar(quilombero) = true

    method dormir(){}
    method loInterrumpen(){}
}

object max{
    var energia = 450
    method velocidad() = 10
    method energia() = energia

    method limpiarCasa(){
        casa.limpiar(0) 
        energia+=50
    }

    method puedeAtrapar(unQuilombero) = self.energia() > unQuilombero.velocidad()

    method dormir(){
        energia +=120   
    }

    method loInterrumpen(){
        energia -=300 
    }
}


object pandilla{ 
    const miembros = [jerry,tuffy] 

    method velocidad()= miembros.map({miembro => miembro.velocidad()}).min() /2

    method hacerQuilombo(){ 
        miembros.forEach({miembro => miembro.hacerQuilombo()})
        if (miembros.size()>3){
            casa.cuidador().loInterrumpen()
        }
    }
}
