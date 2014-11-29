package {
	import flash.display.MovieClip;
	import flash.events.Event;
	public class Masker extends MovieClip {
		private var px:uint;
		private var py:uint;
		private var wid:uint;
		private var hei:uint;
		
		private var dh:uint=0;
		
		private var par:MovieClip;
		public function Masker(posx:uint,posy:uint,w:uint,h:uint):void {
			px = posx;
			py = posy;
			x = px;
			y = py;
			wid = w;
			hei = h;
			width = wid;
			height = hei;
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
			addEventListener(Event.ENTER_FRAME,onLoop);
		}
		private function onAdd(e:Event):void {
			par = MovieClip(parent);
			removeEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onLoop(e:Event):void {
			this.height += (dh-height)*.2;
		}
		public function openMenu():void {
			dh = hei;
		}
		public function closeMenu():void {
			dh = 0;
		}
	}
}