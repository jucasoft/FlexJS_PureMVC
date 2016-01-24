/**
 * Created with IntelliJ IDEA.
 * User: Luca
 * Date: 03/02/14
 * Time: 11.24
 */
package com.jucasoft.flexjs.main.commons.extensions.eventmap.impl {
import com.jucasoft.flexjs.main.commons.extensions.eventmap.api.IEventMap;

import flash.events.IEventDispatcher;

public class EventMap implements IEventMap {

    private const _listeners:Vector.<EventMapConfig> = new Vector.<EventMapConfig>();

    public function map(dispatcher:IEventDispatcher, type:String, listener:Function, useCapture:Boolean):void {
        _listeners.push(new EventMapConfig(dispatcher, type, listener, useCapture));
        dispatcher.addEventListener(type, listener, useCapture);
    }

    public function unmap(dispatcher:IEventDispatcher, type:String, listener:Function, useCapture:Boolean):void {
        var i:int = _listeners.length;
        while (i--) {
            var config:EventMapConfig = _listeners[i];
            if (config.equalTo(dispatcher, type, listener, useCapture)) {
                dispatcher.removeEventListener(type, listener);
                _listeners.splice(i, 1);
                return;
            }
        }
    }

    public function unmapAll():void {
        trace("EventMap.unmapAll()");
        const currentListeners:Vector.<EventMapConfig> = _listeners;

        var eventConfig:EventMapConfig;
        var dispatcher:IEventDispatcher;
        while (eventConfig = currentListeners.pop()) {
            trace("eventConfig.eventString: " + eventConfig.eventString);
            dispatcher = eventConfig.dispatcher;
            dispatcher.removeEventListener(eventConfig.eventString, eventConfig.listener, eventConfig.useCapture);
        }
    }
}
}
