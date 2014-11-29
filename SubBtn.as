package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	public class SubBtn extends MovieClip {
		private var order:uint;
		private var id:uint;
		private var link:int;
		
		private var hl:Highlight;
		
		private var mouseIsOver:Boolean;
		
		private var par:MovieClip;
		private var par2:MovieClip;
		public function SubBtn(o:uint,i:uint,l:int):void {
			order = o;
			id = i;
			link = l;
			
			gotoAndStop(id+1);
			y = o*25;
			
			if(id!=2&&id!=6){
				this.buttonMode = true;
				hl = new Highlight(0,0,width,height);
				addChild(hl);
			}
			
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onAdd(e:Event):void {
			par = MovieClip(parent);
			par2 = MovieClip(parent.parent);
			addEventListener(MouseEvent.CLICK,onClick);
			addEventListener(MouseEvent.MOUSE_OUT,onOut);
			addEventListener(MouseEvent.MOUSE_OVER,onOver);
			removeEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onClick(e:MouseEvent):void {
			if(link!=-1){ 
				par2.goToLink(link);
			}
		}
		private function onOver(e:MouseEvent):void {
			mouseIsOver = true;
			over();
		}
		private function onOut(e:MouseEvent):void {
			mouseIsOver = false;
			over();
		}
		private function over():void {
			par.isOver(mouseIsOver,order);
		}
	}
}