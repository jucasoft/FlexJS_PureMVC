package com.jucasoft.flexjs.main.commons.form.model.api {
public interface IForm {

    function reset():void;

    function set item(value:Object):void;

    function get item():Object;

    function set crud(value:String):void;

    function get crud():String;

    function collectData(obj:Object):void;

    function plantData(obj:Object):void;

    function isValid():Boolean;

    function resetErrorString():void;

    function setValidator(value:Array):void;

    function getValidators():Array;

}
}
