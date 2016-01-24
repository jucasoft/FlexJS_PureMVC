package com.jucasoft.flexjs.main.commons.crud.model {
import com.jucasoft.flexjs.main.commons.crud.CrudEnums;
import com.jucasoft.flexjs.main.commons.crud.MethodNames;
import com.jucasoft.flexjs.main.commons.crud.Names;
import com.jucasoft.flexjs.main.commons.crud.model.api.ICriteria;
import com.jucasoft.flexjs.main.commons.crud.model.vo.Criteria;

public class RemoteObjectProxy extends CrudProxy {

    protected var destination:String;
    private var _methodNames:MethodNames;
    protected var channelSet:String;

    public function RemoteObjectProxy(names:Names, destination:String, data:Object = null) {
        this.destination = destination;
        this.channelSet = ChannelSet.getChannelSet();
        super(names, data);
    }

    private function applyMetods(methodNames:MethodNames):void {
        if (!methodNames)
            return;
        var defaultListeners:Array = [];
        if (methodNames.search) {
            setListeners(methodNames.search, onResultSearch, onFaultSearch);
            defaultListeners.push(methodNames.search);
        }

        if (methodNames.create) {
            setListeners(methodNames.create, onResultCreate, onFaultCreate);
            defaultListeners.push(methodNames.create);
        }

        if (methodNames.edit) {
            setListeners(methodNames.edit, onResultEdit, onFaultEdit);
            defaultListeners.push(methodNames.edit);
        }

        if (methodNames.remove) {
            setListeners(methodNames.remove, onResultRemove, onFaultRemove);
            defaultListeners.push(methodNames.remove);
        }

        if (methodNames.update) {
            setListeners(methodNames.update, onResultUpdate, onFaultUpdate);
            defaultListeners.push(methodNames.update);
        }

        setDefaultListeners(defaultListeners);
    }

    /**
     * Metodo da sovrascrivere per cambiare le firme dei metodi crud.
     * @return
     */
    protected function getMethodNames():MethodNames {
        return new MethodNames()
                .searchMethod(CrudEnums.SEARCH)
                .editMethod(CrudEnums.EDIT)
                .createMethod(CrudEnums.CREATE)
                .removeMethod(CrudEnums.REMOVE)
                .updateMethod(CrudEnums.UPDATE);
    }

    protected var ro:RemoteObject;

    override public function onRegister():void {
        ro = new RemoteObject(destination, names.remote.getProxyName());
        ro.showBusyCursor = true;
        _methodNames = getMethodNames();
        applyMetods(_methodNames);
        ro.onRegister();
        ro.channelSet = ChannelSet.getChannelSet();
        super.onRegister();
    }

    protected function setDefaultListeners(operations:Array):void {
        ro.setDefaultListeners(operations);
    }

    protected function setListeners(operation:String, resultListener:Function, faultListener:Function):void {
        ro.setListeners(operation, resultListener, faultListener);
    }

    protected function getOperation(name:String):* {
        return ro.getOperation(name);
    }

    override public function remove(criteria:ICriteria):void {
        getOperation(_methodNames.remove).send(Criteria(criteria).data);
    }

    override public function create(criteria:ICriteria):void {
        getOperation(_methodNames.create).send(Criteria(criteria).data);
    }

    override public function edit(criteria:ICriteria):void {
        getOperation(_methodNames.edit).send(Criteria(criteria).data);
    }

    override public function update(criteria:ICriteria):void {
        getOperation(_methodNames.update).send(Criteria(criteria).data);
    }

    override public function search(criteria:ICriteria):void {
        getOperation(_methodNames.search).send(criteria);
    }
}
}
