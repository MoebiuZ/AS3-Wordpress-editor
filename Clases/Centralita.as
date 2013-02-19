package {
	
	import flash.display.*;
	import flash.events.*;
	import Evento;
	
	
	// Se crea na instancia de esta clase en el stage, y en ella se gaurdan todas las variables importantes de la web
	// Por ejemplo, el control de secciones.
	
	public class Centralita extends Sprite {
		
		
		private var _secNiveles:Array = new Array(0,0,0,0,0,0,0,0,0,0);
						
		private var _lock:Boolean = false;
		
		
		public function Centralita() {
			
			this.addEventListener(Event.ADDED_TO_STAGE, inicializar);
			
		
		} // Centralita
		
		
		private function inicializar(evt:Event):void {
				(root as Object).dispatcher.addEventListener(Evento.UNLOCK, unlock);
				(root as Object).dispatcher.addEventListener(Evento.SECCION, seccion);
		}
		
		
		private function seccion(evt:Evento):void {
			if (!_lock) {
				_lock = true;
				
				
				
				
				if (_secNiveles[evt.parametro1.charAt(3)] == 0) {

					_secNiveles[evt.parametro1.charAt(3)] = 1;
					(root as Object).dispatcher.dispatchEvent(new Evento(Evento.ENTRAR, evt.parametro1));
				} else {
					(root as Object).dispatcher.dispatchEvent(new Evento(Evento.SALIR, evt.parametro1));
					
					
					for (var i = parseInt(evt.parametro1.charAt(3)) + 1; i < 10; i++) {
						
						_secNiveles[i] = 0;
						
					}
					
				}
												
			}
			
		}
		
		
		private function unlock(evt:Evento):void {
			_lock = false;
		}
		
		
		public function get locked():Boolean {
			return _lock;
		}
	} // class Centralita
}