package com.jucasoft.flexjs.main.commons.extensions.eventmap.impl {
import flash.events.IEventDispatcher;

public class EventMapConfig {

    public function EventMapConfig(dispatcher:IEventDispatcher, eventString:String, listener:Function, useCapture:Boolean) {
        _dispatcher = dispatcher;
        _eventString = eventString;
        _listener = listener;
        _useCapture = useCapture;
    }

    private var _dispatcher:IEventDispatcher;

    public function get dispatcher():IEventDispatcher {
        return _dispatcher;
    }

    private var _eventString:String;

    public function get eventString():String {
        return _eventString;
    }

    private var _listener:Function;

    public function get listener():Function {
        return _listener;
    }

    private var _useCapture:Boolean;

    public function get useCapture():Boolean {
        return _useCapture;
    }

    public function equalTo(dispatcher:IEventDispatcher, eventString:String, listener:Function, useCapture:Boolean):Boolean {
        return _eventString == eventString
                && _dispatcher == dispatcher
                && _listener == listener
                && _useCapture == useCapture;
    }
}
}
