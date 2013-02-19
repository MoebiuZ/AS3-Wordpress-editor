package {
	
	import flash.text.*;
	import flash.display.*;
	import flash.utils.*;
	import flash.filters.GlowFilter;
	
	public class TextoAnimado extends Sprite {
		
		public function TextoAnimado(tRota:TextField, texte:String) {
						
						var texto:String = texte;
						tRota.text = "";
			//var formato:TextFormat = new TextFormat();
			//formato.font = new MoebiuZFont().fontName;
			//formato.size = 12;
						//var tRota:TextField = new TextField();
            tRota.autoSize = TextFieldAutoSize.LEFT;
//		    tRota.embedFonts = true;
			tRota.antiAliasType = AntiAliasType.NORMAL
			//tRota.defaultTextFormat = formato;
			tRota.multiline = true;
			tRota.wordWrap = true;
			tRota.textColor = 0x999999;
			//tRota.width = 200;
			//tRota.height = 100;
			//tRota.x= 60;
			//tRota.y=60;
			
/*			var glowFilter:flash.filters.GlowFilter = new flash.filters.GlowFilter();
			var textoFilters:Array = new Array();
			textoFilters.push(glowFilter);
			textoFilters[0].blurX = 20;
			textoFilters[0].blurY = 20;
			textoFilters[0].color = 0x555555;
			textoFilters[0].quality = 2; 
			tRota.filters = textoFilters;*/
			
			
			//setInterval(pru,10);
			
			//function pru() {
			//textoFilters[0].blurX = Math.sin(1);
				//tRota.filters = textoFilters;
//			}
			
					
			var u = 0;
			
			while (u < texto.length) {
				tRota.appendText(".");
				u++;
			}
			
			//addChild(tRota);
			
			
			
			var bArray:Array = new Array();
			
			var i = 0;
			while (i < texto.length) {
				bArray[i] = i;
				i++;
			}
			
			
			var rand1;
			var rand2;
			var aux;
			
			for (var j = 0; j < bArray.length; j++) {
				rand1 = randRange(0, bArray.length - 1);
				rand2 = randRange(0, bArray.length - 1);
				
				aux = bArray[rand1];
				
				bArray[rand1] =	bArray[rand2];
				bArray[rand2] = aux;
			}
			
			
			var sArray:Array = texto.split("");
			
			var intv:uint = setInterval(comenzar,200);
			
			var ju = 0;
			function comenzar():void {
				rot5(ju);

				tRota.replaceText(bArray[ju], bArray[ju]+1, sArray[bArray[ju]]);
				if (ju == bArray.length - 1) {
					clearInterval(intv);
/*					textoFilters[0].blurX = 10;
					textoFilters[0].blurY = 10;
					tRota.filters = textoFilters;*/
				} else {
					ju++;
				}
			}
			
			

			
			function rot5(pos:uint):void {
				var intvo:uint = setInterval(dale,50,intvo);
				
				var it:uint = 0;
				function dale(kn:uint):void {

					if (it < 5) {
						tRota.replaceText(bArray[pos], bArray[pos]+1, String.fromCharCode(35+it));
						it++;
					} else {
						tRota.replaceText(bArray[pos], bArray[pos]+1, sArray[bArray[pos]]);
						clearInterval(kn);
					}
				}
									   
								   
			}
						
		}
		
		
		private function randRange(min:uint, max:uint):uint {
		    var randomNum:uint = Math.floor(Math.random() * (max - min + 1)) + min;
		    return randomNum;
		}
		
	}
}
