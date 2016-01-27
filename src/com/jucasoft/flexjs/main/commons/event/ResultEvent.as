/**
 * Created by Luca on 23/01/2016.
 */
package com.jucasoft.flexjs.main.commons.event {
import org.apache.flex.events.Event;

public class ResultEvent extends org.apache.flex.events.Event {

    public function ResultEvent(type:String, result:Object, bubbles:Boolean = false, cancelable:Boolean = false) {
        this.result = result;
        super(type, bubbles, cancelable);
    }

    override public function cloneEvent():org.apache.flex.events.Event {
        return new ResultEvent(type, this.result, bubbles, cancelable);
    }

    public var result:Object;
}
}
