package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	public class Highlight extends MovieClip {
		private var px:uint;
		private var py:uint;
		private var wid:uint;
		private var hei:uint;
		public function Highlight(posx:uint,posy:uint,w:uint,h:uint):void {
			px = posx;
			py = posy;
			wid = w;
			hei = h;
			width = wid;
			height = hei;
			alpha = 0;
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onAdd(e:Event):void {
			addEventListener(MouseEvent.MOUSE_OVER,onOver);
			addEventListener(MouseEvent.MOUSE_OUT,onOut);
			removeEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onOver(e:MouseEvent):void {
			alpha = 1;
		}
		private function onOut(e:MouseEvent):void {
			alpha = 0;
		}
	}
}