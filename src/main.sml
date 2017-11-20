(*#Esse vai ser o arquivo principal do exercício. Aqui teremos diversas funções.*)

datatype formas = Circ of {id:int, raio:real, x:real, y:real, cor:string}
                | Rect of {id:int, width:real, height:real, x:real, y:real, cor:string}
                | Quadra of {x:real, y:real, width:real, height:real, cep:string}
                | Hidrante of {x:real, y:real, id:string}
                | Semaforo of {x:real, y:real, id:string}
                | Torre of {x:real, y:real, id:string};

(*gerar_cidade não gerará Circ e Rect *)


(* função helper para concatenar uma lista de strings *)
fun join_strings(lista : string list) = 
  if null lista
  then ""
  else hd lista ^ join_strings(tl lista)

val teste = join_strings["isso", "eh", "um", "teste"];

(* retornando para caso de teste 
val spc = " "
fun forma2test (f:formas) = case f of Circ => join_strings["c ", Int.toString(#id f) ^ spc, Real.toString(#raio f) ^ spc, Real.toString(#x f) ^ spc, Real.toString(#y f) ^ spc, #cor f]
                         | Rect => join_strings["r", Int.toString(#id f) ^ spc, Real.toString(#width f) ^ spc, Real.toString(#height f) ^ spc, Real.toString(#x f) ^ spc, Real.toString(#y f) ^ spc, #cor f]
                         | Quadra => ""
                         | Hidrante => ""
                         | Semaforo => ""
                         | Torre => ""
                         *)