package com.jucasoft.flexjs.main.commons.mediator {
import com.jucasoft.flexjs.main.commons.extensions.eventmap.api.IEventMap;
import com.jucasoft.flexjs.main.commons.extensions.eventmap.impl.EventMap;
import com.jucasoft.flexjs.main.commons.utils.ClassUtils;

import flash.events.IEventDispatcher;

import mx.events.FlexEvent;
import mx.utils.UIDUtil;

import org.puremvc.as3.multicore.interfaces.IMediator;
import org.puremvc.as3.multicore.patterns.mediator.Mediator;

public class MediatorBase extends Mediator {

    public function MediatorBase(mediatorName:String = null, viewComponent:Object = null) {
        trace("MediatorBase.MediatorBase()");
        // se non viene passato il nome del mediator, lo ricavo in automatico dal uid del componente grafico.
        mediatorName = mediatorName ? mediatorName : UIDUtil.getUID(viewComponent) + String(Math.random());

        trace("Registrazione nuovo mediator, mediatorName: " + mediatorName);
//        trace("Class: " + ClassUtils.getName(ClassUtils.forInstance(this)));
        trace("mediatorName: " + mediatorName);


        super(mediatorName, viewComponent);

        // evento per la gestione dell'autoderegistrazione.
        enableAutoRemove(_autoRemove);
    }

    protected var eventMap:IEventMap = new EventMap();
    private var _autoRemove:Boolean = false;
    private var mediatorMap:Vector.<IMediator> = new Vector.<IMediator>;

    override public function initializeNotifier(key:String):void {
        super.initializeNotifier(key);
    }

    /**
     * Quando viene deregistrato il mediator,
     * vengono tolti tutti gli eventi associati a questa vista e tutti i mediator figli.
     */
    override public function onRemove():void {
//        trace("MediatorBase.onRemove()");
        removeAllListerner();
        removeAllMediator();
        trace(":: ON_REMOVE_MEDIATOR :: " + ClassUtils.getName(ClassUtils.forInstance(this)) + ".onRemove() - MEDIATOR_NAME: " + mediatorName);
    }

    public function addViewListener(eventString:String, listener:Function, useCapture:Boolean = false):void {
//        trace("MediatorBase.addViewListener()");
        eventMap.map(IEventDispatcher(viewComponent), eventString, listener, useCapture);
    }

    public function removeViewListener(eventString:String, listener:Function, useCapture:Boolean = false):void {
//        trace("MediatorBase.removeViewListener()");
        eventMap.unmap(IEventDispatcher(viewComponent), eventString, listener, useCapture);
    }

    protected function enableAutoRemove(value:Boolean):void {
        if (_autoRemove == value)
            return;

        _autoRemove = value;
        if (_autoRemove)
            addViewListener(FlexEvent.REMOVE, onAutoDeregister);
        else
            removeViewListener(FlexEvent.REMOVE, onAutoDeregister);
    }

    protected function registerMediator(mediator:IMediator):void {
        mediatorMap.push(mediator);
        facade.registerMediator(mediator);
    }

    protected function removeMediator(mediatorName:String):IMediator {

        var i:int = mediatorMap.length;
        while (i--) {
            var mediator:IMediator = mediatorMap[i];
            if (mediator.getMediatorName() == mediatorName) {
                mediatorMap.splice(i, 1);
                break;
            }
        }

        return facade.removeMediator(mediatorName);
    }

    protected function removeAllMediator():void {
//        trace("MediatorBase.removeAllMediator()");
        var mediator:IMediator;
        while (mediator = mediatorMap.pop()) {
            facade.removeMediator(mediator.getMediatorName());
        }
    }

    protected function removeAllListerner():void {
//        trace("MediatorBase.removeAllListerner()");
        eventMap.unmapAll();
    }

    protected function areYouSure(text:String, title:String, result:Function):void {
//        var closeHandler:Function = function anonim(event:flash.events.Event):void {
//            Alert(event.currentTarget).removeEventListener(flash.events.Event.CLOSE, closeHandler);
//            if (event.detail == Alert.OK)
//                result();
//        };
//        Alert.show(text, title, Alert.OK + Alert.CANCEL, null, closeHandler);
    }

    /**
     * Funziona da richiamare escusivamente dal metodo OnRegister per verificare se la view è totalmente creata.
     * Esempio:
     *    override public function onRegister():void {
     *       if(!isInitialized())
     *           return;
     *
     *       // codice da scrivere
     *       // codice da scrivere
     *       // codice da scrivere
     *   }
     *
     * @return
     */
    protected function isInitialized():Boolean {
        // fixme
//        trace(ClassUtils.getName(ClassUtils.forInstance(this)) + ".isInitialized()");
//        if (!viewComponent || !UIComponent(viewComponent).initialized) {
//            addViewListener(FlexEvent.CREATION_COMPLETE, onComplete);
//            trace("return false");
//            return false;
//        }
//        trace("return true");
//        return true;
    }

    /**
     * passando un evento, viene inviata una notifica a tutta l'applicazione utilizzando come name il type dell'evento.
     * @param event
     */
    protected function dispachContext(event:Event):void {
//        trace("MediatorBase.dispachContext()");
//        trace("event.type: " + event.type);
        sendNotification(event.type, event);
    }

    private function onAutoDeregister(event:FlexEvent):void {
//        trace(":: AUTODEREGISTRAZIONE ATTIVA :: " + ClassUtils.getName(ClassUtils.forInstance(this)) + ".onAutoDeregister()");
        facade.removeMediator(getMediatorName());
    }

    private function onComplete(event:FlexEvent):void {
//        trace(ClassUtils.getName(ClassUtils.forInstance(this)) + ".onComplete()");
        removeViewListener(FlexEvent.CREATION_COMPLETE, onComplete);
        onRegister();
    }

}
}
