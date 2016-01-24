package com.jucasoft.flexjs.main.commons.crud.controller {
import com.jucasoft.flexjs.main.commons.crud.Names;
import com.jucasoft.flexjs.main.commons.crud.model.vo.InitCriteria;

import org.puremvc.as3.multicore.interfaces.INotification;

import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

public class RemoveCrudCommand extends SimpleCommand {
    override public function execute(note:INotification):void {
        super.execute(note);

        if (!note.getBody() && !(note.getBody() is InitCriteria ))
            throw new Error("Attenzione: il body della notifica non valido.");

        var initCriteria:InitCriteria = InitCriteria(note.getBody());

        var names:Names = initCriteria.names;

        facade.removeCommand(names.remote.create);
        facade.removeCommand(names.remote.edit);
        facade.removeCommand(names.remote.remove);
        facade.removeCommand(names.remote.search);
        facade.removeCommand(names.remote.update);
        facade.removeProxy(names.remote.getProxyName());

    }
}
}
