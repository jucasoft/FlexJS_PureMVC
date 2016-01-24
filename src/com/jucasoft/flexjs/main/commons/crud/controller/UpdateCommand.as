package com.jucasoft.flexjs.main.commons.crud.controller {
import com.jucasoft.flexjs.main.commons.crud.model.api.ICriteria;
import com.jucasoft.flexjs.main.commons.crud.model.api.ICrud;

import org.puremvc.as3.multicore.interfaces.INotification;

public class UpdateCommand extends RegisterCommandBase {
    override public function execute(note:INotification):void {
        trace("UpdateCommand.execute(note)");
        ICrud(super.getProxy(note.getName())).uidChannel = note.getType();
        ICrud(super.getProxy(note.getName())).update(ICriteria(note.getBody()));
    }
}
}
