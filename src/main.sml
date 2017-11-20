(*#Esse vai ser o arquivo principal do exercício. Aqui teremos diversas funções.*)

type circ = {id:int, raio:real, x:real, y:real, cor:string};
type rect = {id:int, width:real, height:real, x:real, y:real, cor:string};
type quadra = {x:real, y:real, width:real, height:real, cep:string};
type hidrante = {x:real, y:real, id:string};
type semaforo = {x:real, y:real, id:string};
type torre = {x:real, y:real, id:string};

datatype formas = Circ of circ
                | Rect of rect
                | Quadra of quadra
                | Hidrante of hidrante
                | Semaforo of semaforo
                | Torre of torre;

val bola = Circ{id=1, raio=50.0, x=100.0, y=100.0, cor="blue"};

fun eval(f):string =
  case f of Circ c => "eh um circulo" ^ #cor c ^ Int.toString(#id c) ^ Real.toString(#x c);

val s = eval(bola);

(*gerar_cidade não gerará Circ e Rect *)

(* retornando para caso de teste *)
val spc = " "
fun forma2test(f):string = 
  case f of Circ c => "c " ^ Int.toString(#id c) ^ spc ^ Real.toString(#raio c) ^ spc ^ Real.toString(#x c) ^ spc ^ Real.toString(#y c) ^ spc ^ #cor c
  | Rect r => "r " ^ Int.toString(#id r) ^ spc ^ Real.toString(#width r) ^ spc ^ Real.toString(#height r) ^ spc ^ Real.toString(#x r) ^ spc ^ Real.toString(#y r) ^ spc ^ #cor r
  | Quadra q => "q " ^ Real.toString(#x q) ^ spc ^ Real.toString(#y q) ^ spc ^ Real.toString(#width q) ^ spc ^ Real.toString(#height q) ^ spc ^ #cep q 
  | Hidrante h => "h " ^ Real.toString(#x h) ^ spc ^ Real.toString(#y h) ^ spc ^ #id h
  | Semaforo s => "s " ^ Real.toString(#x s) ^ spc ^ Real.toString(#y s) ^ spc ^ #id s
  | Torre t => "t " ^ Real.toString(#x t) ^ spc ^ Real.toString(#y t) ^ spc ^ #id t;
