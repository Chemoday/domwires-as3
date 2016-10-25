/**
 * Created by Anton Nefjodov on 26.01.2016.
 */
package com.domwires.core.mvc.model
{
	import com.domwires.core.mvc.hierarchy.IHierarchyObjectContainer;

	/**
	 * Container for models.
	 */
	public interface IModelContainer extends IModel, IHierarchyObjectContainer
	{
		/**
		 * Adds model to current container.
		 * @param model
		 * @return
		 */
		function addModel(model:IModel):IModelContainer;

		/**
		 * Removes model from current container.
		 * @param model
		 * @param dispose
		 * @return
		 */
		function removeModel(model:IModel, dispose:Boolean = false):IModelContainer;

		/**
		 * Removes all models from current container.
		 * @param dispose
		 * @return
		 */
		function removeAllModels(dispose:Boolean = false):IModelContainer;

		/**
		 * Returns number of models in current container.
		 */
		function get numModels():int;

		/**
		 * Returns true, if current container has provided model.
		 * @param model
		 * @return
		 */
		function containsModel(model:IModel):Boolean;

		/**
		 * Returns list of models in current container.
		 */
		function get modelList():Array;
	}
}