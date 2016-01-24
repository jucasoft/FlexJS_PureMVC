/**
 * Created with IntelliJ IDEA.
 * User: Luca
 * Date: 13/06/14
 * Time: 16.12
 */
package com.jucasoft.flexjs.main.commons.form.event {
import flash.events.Event;

public class FormEvent extends Event {

    public static const ITEM_IHANGED:String = "itemIhangedFormEvent";
    public static const CHANGED:String = "changedFormEvent";

    public var item:Object;

    public function FormEvent(type:String, item:Object = null, bubbles:Boolean = false, cancelable:Boolean = false) {
        this.item = item;
        super(type, bubbles, cancelable);
    }

    override public function clone():Event {
        return new FormEvent(type, item, bubbles, cancelable);
    }

}
}
