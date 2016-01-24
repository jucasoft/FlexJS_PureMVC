/**
 * Created with IntelliJ IDEA.
 * User: Luca
 * Date: 25/07/14
 * Time: 10.59
 */
package com.jucasoft.flexjs.puremvc.user.controller {
import com.jucasoft.flexjs.main.commons.crud.controller.RegisterCrudCommand;
import com.jucasoft.flexjs.main.commons.crud.controller.StartUpCommandBase;
import com.jucasoft.flexjs.puremvc.user.UserNotification;
import com.jucasoft.flexjs.puremvc.user.model.UserProxy;

import org.puremvc.as3.multicore.interfaces.INotification;

public class UserStartUpCommand extends StartUpCommandBase {
    override public function execute(notification:INotification):void {

        this.setCommand(RegisterCrudCommand)
                .setEntityName(UserNotification.ENTITY)
                .setProxy(UserProxy);

        super.execute(notification);

    }
}
}
