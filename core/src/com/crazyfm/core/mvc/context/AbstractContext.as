/**
 * Created by Anton Nefjodov on 26.01.2016.
 */
package com.crazyfm.core.mvc.context
{
	import com.crazyfm.core.common.Enum;
	import com.crazyfm.core.factory.AppFactory;
	import com.crazyfm.core.mvc.event.ISignalEvent;
	import com.crazyfm.core.mvc.hierarchy.AbstractHierarchyObject;
	import com.crazyfm.core.mvc.hierarchy.HierarchyObjectContainer;
	import com.crazyfm.core.mvc.hierarchy.ns_hierarchy;
	import com.crazyfm.core.mvc.model.*;
	import com.crazyfm.core.mvc.view.IView;
	import com.crazyfm.core.mvc.view.IViewContainer;
	import com.crazyfm.core.mvc.view.ViewContainer;

	import org.osflash.signals.events.IEvent;

	use namespace ns_hierarchy;

	/**
	 * Context contains models, views and services. Also implements <code>ICommandMapper</code>. You can map specific signals, that came out
	 * from hierarchy, to <code>ICommand</code>s.
	 */
	public class AbstractContext extends HierarchyObjectContainer implements IContext
	{
		protected var factory:AppFactory;

		private var modelContainer:IModelContainer;
		private var viewContainer:IViewContainer;

		private var commandMapper:ICommandMapper;

		public function AbstractContext(factory:AppFactory)
		{
			super();

			this.factory = factory;

			modelContainer = factory.getInstance(ModelContainer);
			add(modelContainer);

			viewContainer = factory.getInstance(ViewContainer);
			add(viewContainer);

			commandMapper = factory.getInstance(CommandMapper, factory);
		}

		/**
		 * @inheritDoc
		 */
		public function addModel(model:IModel):IModelContainer
		{
			modelContainer.addModel(model);
			(model as AbstractHierarchyObject).setParent(this);

			return this;
		}

		/**
		 * @inheritDoc
		 */
		public function removeModel(model:IModel, dispose:Boolean = false):IModelContainer
		{
			modelContainer.removeModel(model, dispose);

			return this;
		}

		/**
		 * @inheritDoc
		 */
		public function removeAllModels(dispose:Boolean = false):IModelContainer
		{
			modelContainer.removeAllModels(dispose);

			return this;
		}

		/**
		 * @inheritDoc
		 */
		public function get numModels():int
		{
			return modelContainer.numModels;
		}

		/**
		 * @inheritDoc
		 */
		public function containsModel(model:IModel):Boolean
		{
			return modelContainer.containsModel(model);
		}

		/**
		 * @inheritDoc
		 */
		public function get modelList():Array
		{
			return modelContainer.modelList;
		}

		/**
		 * @inheritDoc
		 */
		public function addView(view:IView):IViewContainer
		{
			viewContainer.addView(view);
			(view as AbstractHierarchyObject).setParent(this);

			return this;
		}

		/**
		 * @inheritDoc
		 */
		public function removeView(view:IView, dispose:Boolean = false):IViewContainer
		{
			viewContainer.removeView(view, dispose);

			return this;
		}

		/**
		 * @inheritDoc
		 */
		public function removeAllViews(dispose:Boolean = false):IViewContainer
		{
			viewContainer.removeAllViews(dispose);

			return this;
		}

		/**
		 * @inheritDoc
		 */
		public function get numViews():int
		{
			return viewContainer.numViews;
		}

		/**
		 * @inheritDoc
		 */
		public function containsView(view:IView):Boolean
		{
			return viewContainer.containsView(view);
		}

		/**
		 * @inheritDoc
		 */
		public function get viewList():Array
		{
			return viewContainer.viewList;
		}

		/**
		 * Clears all children, unmaps all commands and nullifies dependencies.
		 */
		override public function dispose():void
		{
			modelContainer.dispose();
			viewContainer.dispose();

			nullifyDependencies();

			super.dispose();
		}

		private function nullifyDependencies():void
		{
			modelContainer = null;
			viewContainer = null;

			commandMapper.clear();
			commandMapper = null;
		}

		/**
		 * Disposes all children, unmaps all commands and nullifies dependencies.
		 */
		override public function disposeWithAllChildren():void
		{
			modelContainer.disposeWithAllChildren();
			viewContainer.disposeWithAllChildren();

			nullifyDependencies();

			super.disposeWithAllChildren();
		}

		/**
		 * @inheritDoc
		 */
		override public function onEventBubbled(event:IEvent):Boolean
		{
			tryToExecuteCommand((event as ISignalEvent).type);

			return super.onEventBubbled(event);
		}

		/**
		 * @inheritDoc
		 */
		public function map(signalType:Enum, commandClass:Class):ICommandMapper
		{
			return commandMapper.map(signalType, commandClass);
		}

		/**
		 * @inheritDoc
		 */
		public function unmap(signalType:Enum, commandClass:Class):ICommandMapper
		{
			return commandMapper.unmap(signalType, commandClass);
		}

		/**
		 * @inheritDoc
		 */
		public function clear():ICommandMapper
		{
			return commandMapper.clear();
		}

		/**
		 * @inheritDoc
		 */
		public function unmapAll(signalType:Enum):ICommandMapper
		{
			return commandMapper.unmapAll(signalType);
		}

		/**
		 * @inheritDoc
		 */
		public function hasMapping(signalType:Enum):Boolean
		{
			return commandMapper.hasMapping(signalType);
		}

		/**
		 * @inheritDoc
		 */
		public function tryToExecuteCommand(signalType:Enum):void
		{
			commandMapper.tryToExecuteCommand(signalType);
		}
	}
}
