package com.jucasoft.flexjs.main.commons.crud.controller {
import com.jucasoft.flexjs.main.commons.crud.Names;
import com.jucasoft.flexjs.main.commons.crud.model.vo.InitCriteria;

import org.puremvc.as3.multicore.interfaces.IFacade;
import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.interfaces.IProxy;

public class RegisterCrudCommand {

    public function RegisterCrudCommand(facade:IFacade) {
        this.facade = facade;
    }

    protected var facade:IFacade;

    public function execute(note:INotification):void {

        trace("=== RegisterCrudCommand.execute(note) ===");
        if (!note.getBody() && !(note.getBody() is InitCriteria))
            throw new Error("Attenzione: il body di questa notifica non è valido.");

        var initCriteria:InitCriteria = InitCriteria(note.getBody());

        var names:Names = initCriteria.names;

        facade.registerCommand(names.remote.create, CreateCommand);
        trace("names.create: " + names.remote.create);

        facade.registerCommand(names.remote.edit, EditCommand);
        trace("names.edit: " + names.remote.edit);

        facade.registerCommand(names.remote.remove, RemoveCommand);
        trace("names.remove: " + names.remote.remove);

        facade.registerCommand(names.remote.search, SearchCommand);
        trace("names.search: " + names.remote.search);

        facade.registerCommand(names.remote.update, UpdateCommand);
        trace("names.update: " + names.remote.update);

        facade.registerCommand(names.remote.save, SaveCommand);
        trace("names.update: " + names.remote.save);

        var crudProxy:IProxy;
        var proxyClass:Class;

        proxyClass = initCriteria.proxy;

        crudProxy = IProxy(new proxyClass(names));

        facade.registerProxy(crudProxy);

    }

}
}
