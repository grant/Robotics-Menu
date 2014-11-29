package {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	public class SubMenu extends MovieClip {
		private var px:uint;
		private var py:uint;
		private var buttons:Array;
		
		private var masker:Masker;
		
		private var mouseIsOver:Array = new Array();
		private var oneIsOver:Boolean = false;
		public function SubMenu(posx:uint,posy:uint,btn:Array):void {
			px = posx;
			py = posy;
			x = px;
			y = py;
			
			buttons = btn;
			
			masker = new Masker(0,0,150,buttons.length*25);
			mask = masker;
			addChild(masker);
			
			for(var i:uint = 0;i<buttons.length;i++){
				mouseIsOver[i] = false;
			}
			
			setButtons();
		}
		private function setButtons():void {
			for(var i:uint = 0;i<buttons.length;i++){
				addChild(buttons[i]);
			}
		}
		public function changeOpen(isOpen:Boolean):void {
			if(isOpen){
				masker.openMenu();
			} else {
				if(!oneIsOver){
					masker.closeMenu();
				}
			}
		}
		public function isOver(over:Boolean,order:uint):void {
			mouseIsOver[order] = over;
			calcOneIsOver();
			if(oneIsOver){
				masker.openMenu();
			} else {
				masker.closeMenu();
			}
		}
		private function calcOneIsOver():void {
			oneIsOver = false;
			for(var i:uint = 0;i<mouseIsOver.length;i++){
				if(mouseIsOver[i]){
					oneIsOver = true;
				}
			}
		}
	}
}