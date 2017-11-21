(*#Esse vai ser o arquivo principal do exercício. Aqui teremos diversas funções.*)

type circ = {id:int, raio:real, x:real, y:real, cor:string};
type rect = {id:int, width:real, height:real, x:real, y:real, cor:string};
type quadra = {x:real, y:real, width:real, height:real, cep:string, fill:string, stroke:string};
type hidrante = {x:real, y:real, id:string, fill:string, stroke:string};
type semaforo = {x:real, y:real, id:string, fill:string, stroke:string};
type torre = {x:real, y:real, id:string, fill:string, stroke:string};

datatype formas = Circ of circ
                | Rect of rect
                | Quadra of quadra
                | Hidrante of hidrante
                | Semaforo of semaforo
                | Torre of torre;

val bola = Circ{id=1, raio=50.0, x=100.0, y=100.0, cor="blue"};

(*
fun eval(f):string =
  case f of Circ c => "eh um circulo" ^ #cor c ^ Int.toString(#id c) ^ Real.toString(#x c);

val s = eval(bola);
*)

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

val rect = "<rect ";
val circ = "<circle ";
val x = "x=\"";
val y = "y=\"";
val cx = "cx=\"";
val cy = "cy=\"";
val raio = "r=\"";
val height = "height=\"";
val width = "width=\"";
val fill = "fill=\"";
val stroke = "stroke=\"";
val asp = "\" ";
val close = "/>";

fun monta_circ(raio':string, x':string, y':string, fill':string, stroke':string):string = 
  circ ^ raio ^ raio' ^ asp ^ x ^ x' ^ asp ^ y ^ y' ^ asp ^ fill ^ fill' ^ asp ^ stroke ^ stroke' ^ asp ^ close 

fun monta_rect(width':string, height':string, x':string, y':string, fill':string, stroke':string):string = 
  rect ^ width ^ width' ^ asp ^ height ^ height' ^ asp ^ x ^ x' ^ asp ^ y ^ y' ^ fill ^ fill' ^ asp ^ stroke ^ stroke' ^ asp ^ close

fun forma2svg(f):string =
  case f of Circ c => monta_circ(Real.toString(#raio c), Real.toString(#x c), Real.toString(#y c), #cor c, "black")
  | Rect r => monta_rect(Real.toString(#width r), Real.toString(#height r), Real.toString(#x r), Real.toString(#y r), #cor r, "black")
  | Quadra q => monta_rect(Real.toString(#width q), Real.toString(#height q), Real.toString(#x q), Real.toString(#y q), #fill q, #stroke q)
  | Hidrante h => monta_circ("16", Real.toString(#x h), Real.toString(#y h), #fill h, #stroke h)
  | Semaforo s => monta_circ("16", Real.toString(#x s), Real.toString(#y s), #fill s, #stroke s)
  | Torre t => monta_circ("16", Real.toString(#x t), Real.toString(#y t), #fill t, #stroke t);

val svg = forma2svg(bola);