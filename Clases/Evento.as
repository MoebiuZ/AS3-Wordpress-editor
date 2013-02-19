package {
   
   import flash.events.Event;
   
   public class Evento extends Event {
      
		public static const SALIR:String = "salir";
		public static const ENTRAR:String = "entrar";
		public static const SECCION:String = "seccion";
		public static const UNLOCK:String = "unlock";
	          
   		private var _parametro1:String;
   		private var _parametro2:String;
   		private var _parametro3:String;		
   
		public function Evento(type:String, parametro1:String = "", parametro2:String = "", parametro3:String = "", bubbles:Boolean = false, cancelable:Boolean = false) {
			super(type, bubbles, cancelable);
			
			if (parametro1) {
				_parametro1 = parametro1;
			}
			if (parametro2) {
				_parametro2 = parametro2;
			}
			if (parametro3) {
				_parametro3 = parametro3;
			}
		}

		
   		public override function clone():Event {
    	    return new Evento(type, _parametro1, _parametro2, _parametro3, bubbles, cancelable);
	   	}
		
		
		
		/* -------------- Getters y Setters -------------- */
		
		public function get parametro1():String {
			return _parametro1;
		}
		public function set parametro1(valor:String):void {
			_parametro1 = valor;
		}

		
		public function get parametro2():String {
			return _parametro2;
		}
		public function set parametro2(valor:String):void {
			_parametro2 = valor;
		}
		
		
		public function get parametro3():String {
			return _parametro3;
		}
		public function set parametro3(valor:String):void {
			_parametro3 = valor;
		}
	
   } // class
} // package