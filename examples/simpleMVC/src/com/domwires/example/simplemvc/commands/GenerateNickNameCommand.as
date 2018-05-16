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

            var nickname:String;
            var random_name:Number;
            var random_surname:Number;
            var name:Array = new Array("Hayman ","Junious ","Nathaniel ","Alvin ","Lashley ","Rolandus ", "Rolandus", "Albany");
            var surname:Array = new Array("Beemer","Ingles","Geffer","Pariet","Knowlton","Riddel", "Todd");
            random_name = Math.floor(Math.random() * name.length);
            random_surname = Math.floor(Math.random() * surname.length);
            nickname = name[random_name] + " " + surname[random_surname];
			model.setNickName(nickname);

			// Or i can just copy GenerateFirstNameCommand and use random string, but who cares?
		}
	}
}
