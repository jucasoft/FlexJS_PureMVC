/**
 * Created with IntelliJ IDEA.
 * User: Luca
 * Date: 07/02/14
 * Time: 15.24
 */
package com.jucasoft.flexjs.main.commons.crud.controller {
import com.jucasoft.flexjs.main.commons.crud.Names;
import com.jucasoft.flexjs.main.commons.crud.model.vo.InitCriteria;

import org.puremvc.as3.multicore.interfaces.IFacade;
import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.interfaces.IProxy;

public class RegisterStatesCommand {


    public function RegisterStatesCommand(facade:IFacade) {
        this.facade = facade;
    }

    private var facade:IFacade

    public function execute(note:INotification):void {
        trace("RegisterStatesCommand.execute()");

        if (!note.getBody() && !(note.getBody() is InitCriteria))
            throw new Error("Attenzione: il body non valido.");

        var initCriteria:InitCriteria = InitCriteria(note.getBody());

        var names:Names = initCriteria.names;

        facade.registerCommand(names.states.blank, ChangeStateCommand);
        facade.registerCommand(names.states.create, ChangeStateCommand);
        facade.registerCommand(names.states.detail, ChangeStateCommand);
        facade.registerCommand(names.states.edit, ChangeStateCommand);
        facade.registerCommand(names.states.search, ChangeStateCommand);
        facade.registerCommand(names.states.searchResult, ChangeStateCommand);

        var proxy:IProxy;
        var proxyClass:Class;
        proxyClass = initCriteria.proxy;
        proxy = IProxy(new proxyClass(names));
        facade.registerProxy(proxy);

    }
}
}
