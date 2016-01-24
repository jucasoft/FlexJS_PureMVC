package com.jucasoft.flexjs.main.commons.state.model {
import com.jucasoft.flexjs.main.commons.crud.Names;
import com.jucasoft.flexjs.main.commons.crud.StateEnums;

import org.puremvc.as3.multicore.patterns.proxy.Proxy;

/**
 * proxy per la gestione degli stati dall'applicazione.
 */
public class StateProxy extends Proxy {

    protected var names:Names;
    private var story:Array = [];

    public function StateProxy(names:Names, data:Object = null) {

        trace("StateProxy.StateProxy()");
        trace("names.states.getProxyName()l: " + names.states.getProxyName());

        this.names = names;
        if (!data)
            data = 0;
        super(names.states.getProxyName(), data);

        map = {};

        map[StateEnums.BLANK] = "BLANK";
        map[StateEnums.CHANGED] = "CHANGED";
        map[StateEnums.CREATE] = "CREATE";
        map[StateEnums.DETAIL] = "DETAIL";
        map[StateEnums.EDIT] = "EDIT";
        map[StateEnums.SEARCH] = "SEARCH";
        map[StateEnums.SEARCH_RESULT] = "SEARCH_RESULT";

    }

    public function get state():int {
        return int(getData());
    }

    private var map:Object;

    /**
     * ritorna un valore realtivo ad uno stato precedente che è stato storicizzato nell'array.
     * @param value
     */
    public function giveMeLast(value:int):Number {
        if (value >= story.length)
            return NaN;

        var result:Number = story[story.length - value];
        trace("StateProxy.giveMeLast()");
        trace("story[story.length - value]: " + result);
        trace("valore dello stato precedente: " + map[result]);

        return story[story.length - value];
    }

    public function set state(value:int):void {
        story.push(value);
        setData(value);
        sendNotification(names.states.changed, getData());
    }

}
}
