package com.jucasoft.flexjs.main.commons.crud {
public class ActionNames {

    public var _entityName:String;

    public function ActionNames(entityName:String) {
        this._entityName = entityName;

        // notifiche crud
        _create = CrudEnums.CREATE + entity;
        _edit = CrudEnums.EDIT + entity;
        _remove = CrudEnums.REMOVE + entity;
        _search = CrudEnums.SEARCH + entity;
        _update = CrudEnums.UPDATE + entity;

        // notifiche aggiunte per comportamenti locali.
        _cancel = CrudEnums.CANCEL + entity;
        _save = CrudEnums.SAVE + entity;
        _selected = CrudEnums.SELECTED + entity;


        _initComplete = CrudEnums.INIT_COMPLETE + entity;

        _success = CrudEnums.SUCCESS + entity;

        _createSuccess = CrudEnums.CREATE + _success;
        _editSuccess = CrudEnums.EDIT + _success;
        _removeSuccess = CrudEnums.REMOVE + _success;
        _searchSuccess = CrudEnums.SEARCH + _success;
        _updateSuccess = CrudEnums.UPDATE + _success;
        _cancelSuccess = CrudEnums.CANCEL + _success;
        _saveSuccess = CrudEnums.SAVE + _success;
        _selectedSuccess = CrudEnums.SELECTED + _success;

        _fail = CrudEnums.FAIL + entity;

        _createFail = CrudEnums.CREATE + _fail;
        _editFail = CrudEnums.EDIT + _fail;
        _removeFail = CrudEnums.REMOVE + _fail;
        _searchFail = CrudEnums.SEARCH + _fail;
        _updateFail = CrudEnums.UPDATE + _fail;
        _cancelFail = CrudEnums.CANCEL + _fail;
        _saveFail = CrudEnums.SAVE + _fail;
        _selectedFail = CrudEnums.SELECTED + _fail;
    }

    /*    public function get entityName():String {
     return _entityName;
     }*/

    public function get entity():String {
        return CrudEnums.PREFIX_ENTITY + _entityName + CrudEnums.SUFFIX_ENTITY;
    }

    private var _create:String;
    private var _edit:String;
    private var _remove:String;
    private var _search:String;
    private var _update:String;
    private var _cancel:String;
    private var _save:String;
    private var _selected:String;

    private var _initComplete:String;

    private var _success:String;

    private var _createSuccess:String;
    private var _editSuccess:String;
    private var _removeSuccess:String;
    private var _searchSuccess:String;
    private var _updateSuccess:String;
    private var _cancelSuccess:String;
    private var _saveSuccess:String;
    private var _selectedSuccess:String;

    private var _fail:String;

    private var _createFail:String;
    private var _editFail:String;
    private var _removeFail:String;
    private var _searchFail:String;
    private var _updateFail:String;
    private var _cancelFail:String;
    private var _saveFail:String;
    private var _selectedFail:String;

    public function getProxyName():String {
        return _entityName + CrudEnums.SUFFIX_PROXY_NAME;
    }

    public function getDestinationName():String {
        return _entityName + CrudEnums.SUFFIX_DESTINATION_NAME;
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

    public function get search():String {
        return _search;
    }

    public function get update():String {
        return _update;
    }

    public function get initComplete():String {
        return _initComplete;
    }

    public function get success():String {
        return _success;
    }

    public function get createSuccess():String {
        return _createSuccess;
    }

    public function get editSuccess():String {
        return _editSuccess;
    }

    public function get removeSuccess():String {
        return _removeSuccess;
    }

    public function get searchSuccess():String {
        return _searchSuccess;
    }

    public function get updateSuccess():String {
        return _updateSuccess;
    }

    public function get fail():String {
        return _fail;
    }

    public function get createFail():String {
        return _createFail;
    }

    public function get editFail():String {
        return _editFail;
    }

    public function get removeFail():String {
        return _removeFail;
    }

    public function get searchFail():String {
        return _searchFail;
    }

    public function get updateFail():String {
        return _updateFail;
    }

    public function get cancel():String {
        return _cancel;
    }

    public function get save():String {
        return _save;
    }

    public function get cancelSuccess():String {
        return _cancelSuccess;
    }

    public function get saveSuccess():String {
        return _saveSuccess;
    }

    public function get cancelFail():String {
        return _cancelFail;
    }

    public function get saveFail():String {
        return _saveFail;
    }

    public function get selected():String {
        return _selected;
    }

    public function get selectedSuccess():String {
        return _selectedSuccess;
    }

    public function get selectedFail():String {
        return _selectedFail;
    }
}
}
