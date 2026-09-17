object casa {
    var suciedad = 0
    var cuidador = tom
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

    method cuidador(nuevoCuidador){
        cuidador=nuevoCuidador
    }

    
}


object tom{
    var energia =100
    const velocidad = energia/10 +5

    method velocidad() = velocidad

    method limpiarCasa(){
        casa.limpiar(100) 
        energia-=40
    }

    method puedeAtrapar(quilombero) = self.velocidad() > quilombero.velocidad()

    method puedeDormir(){
    energia +=50    
    }

    
}

object jerry{
    var peso =5
    const velocidad = 10-peso

    method velocidad() = velocidad

    method hacerQuilombo(){
        casa.ensuciar(110)
        peso+=1
    }
}

object tuffy{
    const velocidad = 10

   method hacerQuilombo(){
        self.hacerRuido()
   } 

}

object robocat {

    method limpiarCasa(){
        casa.limpiar(casa.suciedad()) 
    }

    method puedeAtrapar(quilombero) = true
}



object pandilla{
    const miembros = [jerry,tuffy]
}

object ningunQuilombero{
    method velocidad()=0
    method hacerQuilombo(){}
}
