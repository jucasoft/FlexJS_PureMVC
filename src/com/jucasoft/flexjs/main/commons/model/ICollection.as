/**
 * Created by Luca on 23/01/2016.
 */
package com.jucasoft.flexjs.main.commons.model {
public interface ICollection {
    function get source():Array;

    function set source(value:Array):void;

    function toArray():Array;

    function getItemAt(index:int):Object;

    function getItemIndex(item:Object):int;

    function addItem(item:Object):void;

    function addItemAt(item:Object, index:int):void;

    function setItemAt(item:Object, index:int):Object;

    function removeItem(item:Object):Boolean;

    function removeItemAt(index:int):Object;

    function removeAll():void;

    function addAll(vales:ICollection):void

    function set filterFunction (value:Object):void;

    function set sort (value:Object):void;

    function refresh():void;

    function itemUpdated(item:Object):void;

    function itemUpdatedAt(index:int):void;

    function get length():int;


}
}
