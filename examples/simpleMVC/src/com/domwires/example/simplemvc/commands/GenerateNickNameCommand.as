/**
 * Created by CrazyFlasher on 1.12.2016.
 */
package com.domwires.example.simplemvc.commands
{
	import com.domwires.core.mvc.command.AbstractCommand;
	import com.domwires.example.simplemvc.model.IAppModel;
	import com.domwires.example.simplemvc.utils.RandomStringUtil;

	public class GenerateNickNameCommand extends AbstractCommand
	{
		[Autowired]
		public var model:IAppModel;

		override public function execute():void
		{
			super.execute();

			var nickName:String;
			var randomName:Number;
			var randomSurname:Number;
			var name:Array = ["Hayman ", "Junious ", "Nathaniel ", "Alvin ", "Lashley ", "Rolandus ", "Rolandus", "Albany"];
			var surName:Array = ["Beemer", "Ingles", "Geffer", "Pariet", "Knowlton", "Riddel", "Todd"];
			randomName = Math.floor(Math.random() * name.length);
			randomSurname = Math.floor(Math.random() * surname.length);
			nickName = name[randomName] + " " + surName[randomSurname];
			model.setNickName(nickName);

			// Or i can just copy GenerateFirstNameCommand and use random string, but who cares?
		}
	}
}
