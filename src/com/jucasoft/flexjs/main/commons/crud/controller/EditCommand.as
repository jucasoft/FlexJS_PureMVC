package com.jucasoft.flexjs.main.commons.crud.controller {
import com.jucasoft.flexjs.main.commons.crud.model.api.ICriteria;
import com.jucasoft.flexjs.main.commons.crud.model.api.ICrud;

import org.puremvc.as3.multicore.interfaces.INotification;

public class EditCommand extends RegisterCommandBase {
    override public function execute(note:INotification):void {
        trace("EditCommand.execute(note)");
        trace("note.getName(): " + note.getName());
        trace("note.getBody(): " + note.getBody());
        trace("note.getType(): " + note.getType());

        ICrud(super.getProxy(note.getName())).uidChannel = note.getType();
        ICrud(super.getProxy(note.getName())).edit(ICriteria(note.getBody()));
    }
}
}
