package com.jucasoft.flexjs.main.commons.crud {
public class StateNames {

    /**
     * lo stato attuale dell'applicazione viene contenuto nel proxy dello stato
     * ed ogni volta che lo stato viene modificato nel proxy viene inviata la notifica CHANGED
     * @param entityName
     */
    public function StateNames(entityName:String) {
        this._entityName = entityName;
        _changed = NAME + StateEnums.CHANGED + entity;

        _blank = NAME + StateEnums.BLANK + entity;
        _search = NAME + StateEnums.SEARCH + entity;
        _searchResult = NAME + StateEnums.SEARCH_RESULT + entity;
        _create = NAME + StateEnums.CREATE + entity;
        _edit = NAME + StateEnums.EDIT + entity;
        _detail = NAME + StateEnums.DETAIL + entity;
    }

    public static const NAME:String = "State";

    private var _entityName:String;

    public function getProxyName():String {
        return _entityName + CrudEnums.SUFFIX_PROXY_NAME;
    }

    /**
     * ricavo dal nome della notifica il valore dello stato.
     * @param value
     * @return
     */
    public static function getStateValue(value:String):int {
        trace("StateNames.getStateValue(value:String)");
        trace("value: " + value);
        var start:int = value.indexOf(NAME) + NAME.length;
        trace("start: " + start);
        var result:String = value.substr(start, 1);
        trace("result: " + result);
        return int(result);
    }

    public function get entity():String {
        return CrudEnums.PREFIX_ENTITY + _entityName + CrudEnums.SUFFIX_ENTITY;
    }

    private var _changed:String;

    public function get changed():String {
        return _changed;
    }

    private var _blank:String;
    private var _search:String;
    private var _searchResult:String;
    private var _create:String;
    private var _edit:String;
    private var _detail:String;

    public function get entityName():String {
        return _entityName;
    }

    public function get blank():String {
        return _blank;
    }

    public function get search():String {
        return _search;
    }

    public function get searchResult():String {
        return _searchResult;
    }

    public function get create():String {
        return _create;
    }

    public function get edit():String {
        return _edit;
    }

    public function get detail():String {
        return _detail;
    }
}
}