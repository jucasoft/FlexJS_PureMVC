package com.jucasoft.flexjs.main.commons.extensions.eventmap.api {
import flash.events.IEventDispatcher;

public interface IEventMap {

    function map(dispatcher:IEventDispatcher, type:String, listener:Function, useCapture:Boolean):void;

    function unmap(dispatcher:IEventDispatcher, type:String, listener:Function, useCapture:Boolean):void;

    function unmapAll():void;

}
}
