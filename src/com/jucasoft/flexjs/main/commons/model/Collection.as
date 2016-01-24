/**
 * Created by Luca on 23/01/2016.
 */
package com.jucasoft.flexjs.main.commons.model {
import org.apache.flex.collections.ArrayList;

public class Collection extends ArrayList implements ICollection{
    public function Collection(initialSource:Array=null) {
        super(initialSource);
    }

    public function addAll(vales:ICollection):void {
    }

    public function set filterFunction(value:Object):void {
    }

    public function set sort(value:Object):void {
    }

    public function refresh():void {
    }
}
}
