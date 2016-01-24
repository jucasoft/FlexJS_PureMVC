package com.jucasoft.flexjs.main.commons.crud.controller {
import com.jucasoft.flexjs.main.commons.crud.model.api.ICriteria;
import com.jucasoft.flexjs.main.commons.crud.model.api.ICrud;
import com.jucasoft.flexjs.main.commons.crud.model.vo.Criteria;

import org.puremvc.as3.multicore.interfaces.INotification;

public class SaveCommand extends RegisterCommandBase {
    override public function execute(note:INotification):void {
        trace("SaveCommand.execute(note)");
        ICrud(super.getProxy(note.getName())).uidChannel = note.getType();

        if (Criteria(note.getBody()).data.id)
            ICrud(super.getProxy(note.getName())).edit(ICriteria(note.getBody()));
        else
            ICrud(super.getProxy(note.getName())).create(ICriteria(note.getBody()));

    }
}
}
