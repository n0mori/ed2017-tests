(*#Esse vai ser o arquivo principal do exercício. Aqui teremos diversas funções.*)

datatype formas = Circ of {id:int, raio:real, x:real, y:real, cor:string}
                | Rect of {id:int, width:real, height:real, x:real, y:real, cor:string}
                | Quadra of {x:real, y:real, width:real, height:real, cep:string}
                | Hidrante of {x:real, y:real, id:string}
                | Semaforo of {x:real, y:real, id:string}
                | Torre of {x:real, y:real, id:string};

(*gerar_cidade não gerará Circ e Rect *)