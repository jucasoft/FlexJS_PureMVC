package com.jucasoft.flexjs.main.commons.crud {
public class Names {

    /**
     * Questo metodo ritorna il nome dell'entità gestita dai crud.
     * L'entità viene annidata nelle notifiche con un preciso pattern composto nel seguente modo:
     * PREFIX_ENTITY + _entityName + SUFFIX_ENTITY, nella notifica si vedrà qualcosa di simile a searchEntity(nomeEntità);
     * @param value
     * @return
     *
     */
    public static function getEntity(value:String):String {
        trace('Names.getEntity(value:String)');
        trace('value: ' + value);
        var start:int = value.indexOf(CrudEnums.PREFIX_ENTITY);
        start += CrudEnums.PREFIX_ENTITY.length;

        var end:int = value.indexOf(CrudEnums.SUFFIX_ENTITY);
        end = end - start;

        var result:String = value.substr(start, end);
        return result;
    }

    /**
     * Ricavo il nome del proxy, dalla notifica.
     * @param value
     * @return
     *
     */
    public static function getProxyName(value:String):String {
        trace('Names.getProxyName(value:String)');
        trace('value: ' + value);
        return getEntity(value) + CrudEnums.SUFFIX_PROXY_NAME;
    }

    public function Names(entityName:String) {
        trace('Names.Names(entityName:String)');
        trace('entityName: ' + entityName);
        this._entityName = entityName;
        remote = new ActionNames(entityName);
        local = new ActionNames("Local" + entityName);
        states = new StateNames("State" + entityName);
    }

    public var remote:ActionNames;
    public var local:ActionNames;
    public var states:StateNames;

    public var _entityName:String;

    public function get entityName():String {
        trace('Names.entityName():String');
        trace('return _entityName' + _entityName);
        return _entityName;
    }


}
}