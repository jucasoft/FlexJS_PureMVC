/**
 * Created by Luca on 23/01/2016.
 */
package com.jucasoft.flexjs.main.commons.event {
import org.apache.flex.events.Event;

public class ResultEvent extends org.apache.flex.events.Event {
    public function ResultEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
        super(type, bubbles, cancelable);
    }

    public var result:Object;
}
}
