package com.jucasoft.flexjs.main.commons.crud.controller {
import com.jucasoft.flexjs.main.commons.crud.Names;

import org.puremvc.as3.multicore.interfaces.ICommand;
import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.interfaces.IProxy;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

public class RegisterCommandBase extends SimpleCommand implements ICommand {

    override public function execute(note:INotification):void {
        throw new Error("Metodo da sovrascrivere.");
    }

    protected function getProxy(notificationName:String):IProxy {
        var proxyName:String = Names.getProxyName(notificationName);

        if (!proxyName) {
            throw new Error("Attenzione, la notifica ' " + notificationName + " ' utilizzata non contiene nessuna entità.");
        }
        if (!facade.hasProxy(proxyName)) {
            throw new Error("Attenzione, non esiste nessun proxy registrato con il nome : " + proxyName);
        }

        var proxy:IProxy = facade.retrieveProxy(proxyName);

        return IProxy(proxy);
    }

}
}