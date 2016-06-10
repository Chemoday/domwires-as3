/**
 * Created by Anton Nefjodov on 7.02.2016.
 */
package com.crazyfm.core.mvc.hierarchy
{
	import com.crazyfm.core.mvc.event.ISignalEvent;
	import com.crazyfm.core.mvc.event.SignalDispatcher;

	use namespace ns_hierarchy;

	/**
	 * Object, that part of hierarchy. Can dispatch and receive signals from hierarchy branch.
	 */
	public class AbstractHierarchyObject extends SignalDispatcher implements IHierarchyObject
	{
		private var _parent:IHierarchyObjectContainer;

		public function AbstractHierarchyObject()
		{
			super();
		}

		ns_hierarchy function setParent(value:IHierarchyObjectContainer):void
		{
			_parent = value;
		}

		/**
		 * @inheritDoc
		 */
		public function get parent():IHierarchyObjectContainer
		{
			return _parent;
		}

		/**
		 * Disposes hierarchy object and removes reference to parent, if has one.
		 */
		override public function dispose():void
		{
			_parent = null;

			super.dispose();
		}

		/**
		 * @inheritDoc
		 */
		public function handleSignal(signal:ISignalEvent):void
		{

		}
	}
}
