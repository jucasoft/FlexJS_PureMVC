package com.jucasoft.flexjs.main.commons.crud.controller {
import com.jucasoft.flexjs.main.commons.crud.StateNames;
import com.jucasoft.flexjs.main.commons.state.model.StateProxy;

import org.puremvc.as3.multicore.interfaces.INotification;

public class ChangeStateCommand extends RegisterCommandBase {

    //Nella notifica arriva il codice del nuovo stato.
    override public function execute(notification:INotification):void {
        trace("ChangeStateCommand.execute()");

        var proxy:StateProxy = StateProxy(getProxy(notification.getName()));
        var stateValue:int = StateNames.getStateValue(notification.getName());

        trace("proxy.state: " + proxy.state);
        trace("stateValue: " + stateValue);
        trace("proxy.state = stateValue;");

        proxy.state = stateValue;
    }

}
}
