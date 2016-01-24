package com.jucasoft.flexjs.main.commons.crud.controller {
import com.jucasoft.flexjs.main.commons.crud.Names;
import com.jucasoft.flexjs.main.commons.crud.model.vo.InitCriteria;

import org.puremvc.as3.multicore.interfaces.ICommand;
import org.puremvc.as3.multicore.interfaces.IFacade;
import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.interfaces.IProxy;

public class RegisterDecoderCommand implements ICommand {

    public function RegisterDecoderCommand(facade:IFacade) {
        this.facade = facade;
    }

    protected var facade:IFacade;

    public function execute(note:INotification):void {

        trace("=== RegisterDecoderCommand.execute(note) ===");
        if (!note.getBody() && !(note.getBody() is InitCriteria))
            throw new Error("Attenzione: il body di questa notifica non è valido.");

        var initCriteria:InitCriteria = InitCriteria(note.getBody());

        var names:Names = initCriteria.names;

        facade.registerCommand(names.remote.search, SearchCommand);
        trace("names.search: " + names.remote.search);

        var crudProxy:IProxy;
        var proxyClass:Class;

        proxyClass = initCriteria.proxy;

        crudProxy = IProxy(new proxyClass(names));

        facade.registerProxy(crudProxy);
        trace("=== END ===");

    }

    public function sendNotification(notificationName:String, body:Object = null, type:String = null):void {
        facade.sendNotification(notificationName, body, type)
    }

    public function initializeNotifier(key:String):void {

    }
}
}
