package {
	import flash.display.*;
	import flash.display.StageAlign;
    import flash.display.StageScaleMode;
	import flash.events.*;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.utils.setInterval;
	import flash.utils.clearInterval;
	
	import flash.text.*;
	
	import Centralita;
	
	
	
	public class Panel extends MovieClip {
		
		// Configuracion
		public const webURL = "http://clientes.lucanus.es/olanoymendo"; 
		public var usuario:String;
		
		
		// Despachador de eventos de la web
		public var dispatcher:EventDispatcher = new EventDispatcher();
		
		public var centralita:Centralita = new Centralita();
		
		public function Panel():void {
			// Preparamos el Stage y los listeners del mismo
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.addEventListener(Event.RESIZE, reajustar);
			stage.showDefaultContextMenu = false;
				
		
			
			var intv:uint = setInterval(precarga, 1);
						
			function precarga():void {
				
				graphics.clear();
				if (loaderInfo.bytesLoaded == loaderInfo.bytesTotal) {
					
					clearInterval(intv);
					inicializar();
				} else {
					var percent:Number = root.loaderInfo.bytesLoaded / root.loaderInfo.bytesTotal;
        	        graphics.beginFill(10879052);
    	            graphics.drawRect(0, stage.stageHeight / 2 - 2, stage.stageWidth * percent, 2);
	                graphics.endFill();
				    graphics.beginFill(5855577);
    	            graphics.drawRect(stage.stageWidth - stage.stageWidth * percent, stage.stageHeight / 2 + 2, stage.stageWidth, 2);
	                graphics.endFill();										
				}
			} // function precarga
			
			


		} // constructor LoaderMain
		
		
		//---------- Inicializar web -----------//
		private function inicializar():void {
			this.gotoAndPlay(2);
//			reajustar(null);
			addChild(centralita);
//			sec_grupo.defecto();
		} // function inicializar
		
		
		//---- Diagramación líquida: Evento a los objetos que necesitan ser reposicionados o escalados ----//
		
		private function reajustar(evento:Event):void {
			dispatcher.dispatchEvent(new Event("reajustar"));

			
			
			//Centrar secciones
			if (logo) {
				logo.x = stage.stageWidth - 180;
			}
			
			if (sec0_noticias) {
				sec0_estudio.x = stage.stageWidth/2;
				sec0_estudio.y = stage.stageHeight/2;
				sec0_noticias.x = stage.stageWidth/2;
				sec0_noticias.y = stage.stageHeight/2;
				sec0_proyectos.x = stage.stageWidth/2;
				sec0_proyectos.y = stage.stageHeight/2;
				sec0_clave.x = stage.stageWidth/2;
				sec0_clave.y = stage.stageHeight/2;
			}
							
		} // function reajustar
		
		
		
		
		private function configureListeners(dispatcher:IEventDispatcher):void {
            dispatcher.addEventListener(Event.COMPLETE, completeHandler);
            dispatcher.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
            dispatcher.addEventListener(Event.INIT, initHandler);
            dispatcher.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
            dispatcher.addEventListener(Event.OPEN, openHandler);
            dispatcher.addEventListener(ProgressEvent.PROGRESS, progressHandler);
            dispatcher.addEventListener(Event.UNLOAD, unLoadHandler);
        }

        private function completeHandler(event:Event):void {
        
        }

        private function httpStatusHandler(event:HTTPStatusEvent):void {
             
        }

        private function initHandler(event:Event):void {
            
        }

        private function ioErrorHandler(event:IOErrorEvent):void {
            
        }

        private function openHandler(event:Event):void {
           
        }

        private function progressHandler(event:ProgressEvent):void {
            
        }

        private function unLoadHandler(event:Event):void {
          
        }

  	} // class Main
} // package Main