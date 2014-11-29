package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	public class Main extends MovieClip {
		var links:Array = new Array();
		var topBtns:Array = new Array();
		var subMenus:Array = new Array();
		var subMenuBtns:Array = new Array();
		public function Main():void {
			setLinks();
			setButtons();
			setSubMenus();
			addButtons();
			addSubMenus();
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onAdd(e:Event):void {
			stage.showDefaultContextMenu = false;
			removeEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function setLinks():void {
			//Links array is 0 based (for setting buttons)
			//home
			links[0] = new Array("index.html","_self");
			//announcements
			links[1] = new Array("Announcements.html","_self");
			//resources
			links[2] = new Array("Resources.html","_self");
			//forum
			links[3] = new Array("http://www.sfhsrobotics.com/forum","_self");
			
			////////////
			//ABOUT US//
			////////////
			
			//first robotics
			links[4] = new Array("About Us_FIRST Robotics.html","_self");
			//team 2367
			links[5] = new Array("About Us_Team 2367.html","_self");
			
			/////////////////////////
			//ROBOTICS COMPETITIONS//
			/////////////////////////
			
			//logomotion
			links[6] = new Array("Robotics Competitions_FIRST_LogoMotion.html","_self");
			//breakaway
			links[7] = new Array("Robotics Competitions_FIRST_Breakaway.html","_self");
			//lunacy
			links[8] = new Array("Robotics Competitions_FIRST_Lunacy.html","_self");
			//round up
			links[9] = new Array("Robotics Competitions_VEX_Round Up.html","_self");
			//clean sweep
			links[10] = new Array("Robotics Competitions_VEX_Clean Sweep.html","_self");
			//elevation
			links[11] = new Array("Robotics Competitions_VEX_Elevation.html","_self");
			
			/////////
			//MEDIA//
			/////////
			
			//logomotion
			links[12] = new Array("Media_FIRST_LogoMotion.html","_self");
			//breakaway
			links[13] = new Array("Media_FIRST_Breakaway.html","_self");
			//lunacy
			links[14] = new Array("Media_FIRST_Lunacy.html","_self");
			//round up
			links[15] = new Array("Media_VEX_Round Up.html","_self");
			//clean sweep
			links[16] = new Array("Media_VEX_Clean Sweep.html","_self");
			//elevation
			links[17] = new Array("Media_VEX_Elevation.html","_self");
			//team 2367
			links[18] = new Array("Media_Team 2367.html","_self");
			
			//About Us
			links[19] = new Array("About_Us.html","_self");
			//Robotics Competitions
			links[20] = new Array("Robotics_Competitions.html","_self");
			//Media
			links[21] = new Array("Media.html","_self");
		}
		private function setButtons():void {
			topBtns[0] = new TopLevelBtn(0,0,0,60,35,0,0);//home
			topBtns[1] = new TopLevelBtn(1,60,0,70,35,19,1);//about us
			topBtns[2] = new TopLevelBtn(2,130,0,165,35,20,2);//robotics competitions
			topBtns[3] = new TopLevelBtn(3,295,0,70,35,21,3);//media
			topBtns[4] = new TopLevelBtn(4,365,0,120,35,1,0);//announcements
			topBtns[5] = new TopLevelBtn(5,485,0,100,35,2,0);//resources
			topBtns[6] = new TopLevelBtn(6,585,0,75,35,3,0);//forum
		}
		private function setSubMenus():void {			
			//BUTTONS//
			//subMenuBtns are -1 based and descends (for setting buttons)
			//About Us
			subMenuBtns[0] = new Array();
			subMenuBtns[0][0] = new SubBtn(0,0,4);
			subMenuBtns[0][1] = new SubBtn(1,1,5);
			//Robotics Competitions
			subMenuBtns[1] = new Array();
			subMenuBtns[1][0] = new SubBtn(0,2,-1);
			subMenuBtns[1][1] = new SubBtn(1,3,6);
			subMenuBtns[1][2] = new SubBtn(2,4,7);
			subMenuBtns[1][3] = new SubBtn(3,5,8);
			subMenuBtns[1][4] = new SubBtn(4,6,-1);
			subMenuBtns[1][5] = new SubBtn(5,7,9);
			subMenuBtns[1][6] = new SubBtn(6,8,10);
			subMenuBtns[1][7] = new SubBtn(7,9,11);
			//Media
			subMenuBtns[2] = new Array();
			subMenuBtns[2][0] = new SubBtn(0,2,-1);
			subMenuBtns[2][1] = new SubBtn(1,3,12);
			subMenuBtns[2][2] = new SubBtn(2,4,13);
			subMenuBtns[2][3] = new SubBtn(3,5,14);
			subMenuBtns[2][4] = new SubBtn(4,6,-1);
			subMenuBtns[2][5] = new SubBtn(5,7,15);
			subMenuBtns[2][6] = new SubBtn(6,8,16);
			subMenuBtns[2][7] = new SubBtn(7,9,17);
			subMenuBtns[2][8] = new SubBtn(8,10,18);
			
			//MENUS//
			subMenus[0] = new SubMenu(60,35,subMenuBtns[0]);
			subMenus[1] = new SubMenu(130,35,subMenuBtns[1]);
			subMenus[2] = new SubMenu(295,35,subMenuBtns[2]);
		}
		private function addButtons():void {
			for(var i:uint = 0;i<topBtns.length;i++){
				addChild(topBtns[i]);
			}
		}
		private function addSubMenus():void {
			for(var i:uint = 0;i<subMenus.length;i++){
				addChild(subMenus[i]);
			}
		}
		public function goToLink(linkId:uint):void {
			var url:String = links[linkId][0];
			var type:String = links[linkId][1];
   			var req:URLRequest = new URLRequest(url);
			navigateToURL(req,type);
		}
		public function changeIfMenuOpen(ifOpen:Boolean,subMenuId:uint):void {
			subMenus[subMenuId].changeOpen(ifOpen);
		}
	}
}