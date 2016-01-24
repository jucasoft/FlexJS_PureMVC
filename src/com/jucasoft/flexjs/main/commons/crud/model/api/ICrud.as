package com.jucasoft.flexjs.main.commons.crud.model.api {
public interface ICrud {
    function remove(criteria:ICriteria):void;

    function create(criteria:ICriteria):void;

    function edit(criteria:ICriteria):void;

    function update(criteria:ICriteria):void;

    function search(criteria:ICriteria):void;

    function set uidChannel(value:String):void;

    function get uidChannel():String;
}
}