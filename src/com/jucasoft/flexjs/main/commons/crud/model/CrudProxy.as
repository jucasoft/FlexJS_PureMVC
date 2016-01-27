package com.jucasoft.flexjs.main.commons.crud.model {

import com.jucasoft.flexjs.main.commons.crud.Names;
import com.jucasoft.flexjs.main.commons.crud.model.api.ICriteria;
import com.jucasoft.flexjs.main.commons.crud.model.api.ICrud;
import com.jucasoft.flexjs.main.commons.event.FaultEvent;
import com.jucasoft.flexjs.main.commons.event.ResultEvent;
import com.jucasoft.flexjs.main.commons.model.Collection;
import com.jucasoft.flexjs.main.commons.model.ICollection;
import com.jucasoft.flexjs.main.commons.utils.ObjectUtil;

import org.puremvc.as3.multicore.patterns.proxy.Proxy;

public class CrudProxy extends Proxy implements ICrud {


    private var _uidChannel:String;

    public function get uidChannel():String {
        return _uidChannel;
    }

    public function set uidChannel(value:String):void {
        _uidChannel = value;
    }

    public static function findAny(list:ICollection, values:Object):int {
        for (var i:int = 0; i < list.length; i++) {
            var obj:Object = list.getItemAt(i);
            var same:Boolean = true;

            for (var prop:String in values) {
                if (obj[prop] != values[prop]) {
                    same = false;
                }
            }
            if (same)
                return i;
        }
        return -1;
    }

    /**
     * @param names
     * @param data
     *
     */
    public function CrudProxy(names:Names, data:Object = null) {
        trace("CrudProxy.CrudProxy()");
        trace("names.remote.getProxyName(): " + names.remote.getProxyName());

        this.names = names;
        if (!data)
            data = new Collection();
        super(this.names.remote.getProxyName(), data);
    }

    protected var names:Names;

    /**
     * sovrascrivere questo metodo per cambiare la chiave primaria dell'oggetto.
     *
     */
    protected function get primaryKey():String {
        return "id";
    }

    override public function onRegister():void {
        trace("CrudProxy.onRegister()");
        trace("names.remote.initComplete: " + names.remote.initComplete);
        sendNotification(names.remote.initComplete, getData());
    }

    public function remove(criteria:ICriteria):void {
        throw new Error("");
    }

    public function create(criteria:ICriteria):void {
        throw new Error("");
    }

    public function edit(criteria:ICriteria):void {
        throw new Error("");
    }

    public function update(criteria:ICriteria):void {
        throw new Error("");
    }

    public function search(criteria:ICriteria):void {
        throw new Error("");
    }

    protected function removedItem(value:Object):void {
        var obj:Object = {};
        obj[primaryKey] = value[primaryKey];
        var pos:Number = findAny(ICollection(getData()), obj);
        if (pos != -1) {
            ICollection(getData()).removeItemAt(pos);
            getData().refresh();
        }
    }

    protected function updateItem(value:Object):void {
        var obj:Object = {};
        obj[primaryKey] = value[primaryKey];
        var pos:Number = findAny(ICollection(getData()), obj);
        if (pos != -1) {
            ICollection(getData()).setItemAt(value, pos);
            getData().refresh();
        }
    }

    /**
     * RESULT
     * @param event
     *
     */
    protected function onResultRemove(event:ResultEvent):void {
        removedItem(event.result);
        sendNotification(names.remote.removeSuccess, event.result, _uidChannel);
    }

    protected function onResultCreate(event:ResultEvent):void {
        ICollection(getData()).addItem(event.result);
        sendNotification(names.remote.createSuccess, event.result, _uidChannel);
    }

    protected function onResultEdit(event:ResultEvent):void {
        updateItem(event.result);
        sendNotification(names.remote.editSuccess, event.result, _uidChannel);
    }

    protected function onResultUpdate(event:ResultEvent):void {
        updateItem(event.result);
        sendNotification(names.remote.updateSuccess, event.result, _uidChannel);
    }

    protected function onResultSearch(event:ResultEvent):void {
        trace('CrudProxy.onResultSearch(event:ResultEvent)');
        trace("proxyName: " + getProxyName());
        ICollection(getData()).filterFunction = null;
        ICollection(getData()).sort = null;
        ICollection(getData()).refresh();

        ICollection(getData()).removeAll();
        ICollection(getData()).addAll(ICollection(event.result));
        ICollection(getData()).refresh();
        sendNotification(names.remote.searchSuccess, getData(), _uidChannel);
    }

    /**
     * FAULT
     * @param event
     *
     */
    protected function onFaultRemove(event:FaultEvent):void {
        trace("CrudProxy.onFaultRemove(event:FaultEvent)");
        trace("proxyName: " + getProxyName());
        trace(ObjectUtil.toString(event));
        sendNotification(names.remote.removeFail, event, _uidChannel);
    }

    protected function onFaultCreate(event:FaultEvent):void {
        trace("CrudProxy.onFaultCreate(event)");
        trace("proxyName: " + getProxyName());
        trace(ObjectUtil.toString(event));
        sendNotification(names.remote.createFail, event, _uidChannel);
    }

    protected function onFaultEdit(event:FaultEvent):void {
        trace("CrudProxy.onFaultEdit(event)");
        trace("proxyName: " + getProxyName());
        trace(ObjectUtil.toString(event));
        sendNotification(names.remote.editFail, event, _uidChannel);
    }

    protected function onFaultUpdate(event:FaultEvent):void {
        trace("CrudProxy.onFaultUpdate(event)");
        trace("proxyName: " + getProxyName());
        trace(ObjectUtil.toString(event));
        sendNotification(names.remote.updateFail, event, _uidChannel);
    }

    protected function onFaultSearch(event:FaultEvent):void {
        trace("CrudProxy.onFaultSearch(event)");
        trace("proxyName: " + getProxyName());
        trace(ObjectUtil.toString(event));
        sendNotification(names.remote.searchFail, event, _uidChannel);
    }

}
}
