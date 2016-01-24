package com.jucasoft.flexjs.main.commons.decoder.view {
import com.jucasoft.flexjs.main.commons.crud.Names;
import com.jucasoft.flexjs.main.commons.crud.view.CrudMediator;
import com.jucasoft.flexjs.main.commons.decoder.model.DecoderProxy;
import com.jucasoft.flexjs.main.commons.model.Collection;
import com.jucasoft.flexjs.main.commons.model.ICollection;

import org.puremvc.as3.multicore.interfaces.INotification;

public class DecoderMediator extends CrudMediator {

    /**
     * Mediator per il caricamento di dati applicativi.
     * Se già presenti dei dati nel proxy, non viene effettuata la chiamata al server.
     *
     * esempio di registrazione
     * registerMediator(new DecoderMediator(viewComponent, new Names(XxxxxxNotifications.XXX_TYPES)));
     *
     * @param view componente grafico che deve avere l'attributo "dataProvider"
     * @param names
     * @param attribute     attributo nel quale viene settato il valore di riotrno.
     * @param autoRemove    indica al mediator se deve deregistrarsi in automatico quando il componente grafico che media viene rimosso.
     */
    public function DecoderMediator(view:Object, names:Names, attribute:String = "dataProvider", autoRemove:Boolean = true) {

        if (!view.hasOwnProperty(attribute)) {
            trace("Oggetto grafico non consentito.");
        }

        this._attribute = attribute;

        // le classi padri creeranno in automatico il nome del mediator.
        super(null, view, names);
        enableAutoRemove(autoRemove);
    }

    private var _attribute:String;
    private var _filterFunction:Function;
    private var _onSetDataFunction:Function;
    private var _loadOnRegister:Boolean = true;

    protected function set dataProvider(value:Collection):void {
        if (_filterFunction) {
            value.filterFunction = _filterFunction;
            value.refresh();
        }
        data = value;
    }

    private function set data(value:Object):void {
        viewComponent[_attribute] = value;
        if (_onSetDataFunction != null)
            _onSetDataFunction(value);
    }

    override public function listNotificationInterests():Array {
        return [
            names.remote.searchSuccess
        ];
    }

    override protected function onSearchSuccess(note:INotification):void {
        setData();
    }

    private function setData():void {

        var proxy:DecoderProxy = DecoderProxy(facade.retrieveProxy(names.remote.getProxyName()));

        if (!proxy.loaded) {
            sendNotification(names.remote.search);
            return;
        }

        if (proxy.getData() is ICollection)
            dataProvider = new Collection(Array(proxy.getData()));
        else
            data = proxy.getData();

    }

    override public function onRegister():void {
        if (!isInitialized())
            return;

        trace("DecoderMediatorBase.onRegister():void");
        trace("names.remote.getProxyName(): " + names.remote.getProxyName());

        if (_loadOnRegister)
            setData();

    }

    override public function onRemove():void {
        trace("DecoderMediator.onRemove()");
        super.onRemove();
    }

    /**
     * Evita che al onRegister venga inviata la notifica per caricare i dati se non presenti.
     * @param value
     * @return
     */
    public function loadOnRegister(value:Boolean):DecoderMediator {
        _loadOnRegister = value;
        return this;
    }

    /**
     * filterFunction che verrà applicata alla lista.
     * @param value
     * @return
     */
    public function filterFunction(value:Function):DecoderMediator {
        _filterFunction = value;
        return this;
    }

    /**
     * @param value    function onSetData(value:Object);
     * @return
     */
    public function onSetDataFunction(value:Function):DecoderMediator {
        _onSetDataFunction = value;
        return this;
    }

}
}
