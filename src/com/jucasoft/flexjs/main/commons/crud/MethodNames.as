/**
 * Created with IntelliJ IDEA.
 * User: Luca
 * Date: 07/04/14
 * Time: 11.34
 */
package com.jucasoft.flexjs.main.commons.crud {
public class MethodNames {
    public function MethodNames() {
    }

    public function searchMethod(value:String):MethodNames {
        this._search = value
        return this;
    }

    public function createMethod(value:String):MethodNames {
        this._create = value
        return this;
    }

    public function editMethod(value:String):MethodNames {
        this._edit = value
        return this;
    }

    public function removeMethod(value:String):MethodNames {
        this._remove = value
        return this;
    }

    public function updateMethod(value:String):MethodNames {
        this._update = value
        return this;
    }

    public function get search():String {
        return _search;
    }

    public function get create():String {
        return _create;
    }

    public function get edit():String {
        return _edit;
    }

    public function get remove():String {
        return _remove;
    }

    public function get update():String {
        return _update;
    }

    private var _search:String;
    private var _create:String;
    private var _edit:String;
    private var _remove:String;
    private var _update:String;


}
}
