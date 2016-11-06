/**
 * Created by Anton Nefjodov on 30.01.2016.
 */
package com.domwires.core.mvc.message
{
	import com.domwires.core.common.Enum;
	import com.domwires.core.common.IDisposable;
	import com.domwires.core.mvc.message.IMessageDispatcherImmutable;

	/**
	 * Common message dispatcher. Can be used for listening and dispatching messages for views and models.
	 * Bubbling feature in any objects (Not only DisplayObjects, like in EventDispatcher).
	 */
	public interface IMessageDispatcher extends IMessageDispatcherImmutable, IDisposable
	{
		/**
		 * Add message listener to specified object. Listens bubbled messages also.
		 * @param type Message type
		 * @param listener Function that will be called when message received
		 */
		function addMessageListener(type:Enum, listener:Function):void;

		/**
		 * Removes message listener from object. Bubbled messages will be also ignored.
		 * @param type Message type
		 */
		function removeMessageListener(type:Enum, listener:Function):void;

		/**
		 * Removes all message listeners from object. Bubbled messages will be also ignored.
		 */
		function removeAllMessageListeners():void;

		/**
		 * Dispatches message from bottom to top of the hierarchy.
		 * @param type Message type
		 * @param data Optional data that will sent with message
		 * @param bubbles If true, then message will bubble up to hierarchy
		 */
		function dispatchMessage(type:Enum, data:Object = null, bubbles:Boolean = false):void;

		/**
		 * Handle specified message without dispatching it.
		 * @param message
		 */
		function handleMessage(message:IMessage):void;
	}
}
