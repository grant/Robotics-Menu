package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	public class TopLevelBtn extends MovieClip {
		private var id:uint;
		private var px:uint;
		private var py:uint;
		private var wid:uint;
		private var hei:uint;
		
		private var link:int;
		private var subMenu:uint;
		
		private var hl:Highlight;
		
		private var par:MovieClip;
		public function TopLevelBtn(i:uint,posx:uint,posy:uint,w:uint,h:uint,l:int,sub:uint):void {
			//CONSTRUCTING VARIABLES//
			id = i;
			px = posx;
			py = posy;
			wid = w;
			hei = h;
			x = px;
			y = py;
			//link
			link = l;
			subMenu = sub;
			//width doesn't work
			//width = wid;
			//height doesn't work
			//height = hei;
			//ENDING CONSTRUCTING VARIABLES//
			hl = new Highlight(0,0,w,h);
			addChild(hl);
			
			if(subMenu>0){
				addEventListener(MouseEvent.MOUSE_OVER,onOver);
				addEventListener(MouseEvent.MOUSE_OUT,onOut);
			}
			
			gotoAndStop(id+1);
			this.buttonMode = true;
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onAdd(e:Event):void {
			par = MovieClip(parent);
			addEventListener(MouseEvent.CLICK,onClick);
			removeEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onClick(e:MouseEvent):void {
			if(link!=-1){ 
				par.goToLink(link);
			}
		}
		private function onOver(e:MouseEvent):void {
			par.changeIfMenuOpen(true,subMenu-1);
		}
		private function onOut(e:MouseEvent):void {
			par.changeIfMenuOpen(false,subMenu-1);
		}
	}
}