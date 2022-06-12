//para usar la herramienta debug de motoko, antes la tenemos que importar.
import Debug "mo:base/Debug";

//creo la clase que va a contenter el canister, en motoko las clases las creo con la palabra "actor"
actor DBank {
  var currentValue = 300;
  currentValue := 100;

  //las constantes las declaramos de la siguiente manera:
  let id = 98234598054;

  //este comando lo uso para imprimir en la consola lo que quiera, si uso una var tengo que ponerla dentr de la función debug_show().
  Debug.print(debug_show(id));
}