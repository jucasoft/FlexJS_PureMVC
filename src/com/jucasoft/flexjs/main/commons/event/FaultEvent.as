/**
 * Created by Luca on 23/01/2016.
 */
package com.jucasoft.flexjs.main.commons.event {
import org.apache.flex.events.Event;

public class FaultEvent extends org.apache.flex.events.Event {
    public function FaultEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
        super(type, bubbles, cancelable);
    }
}
}
