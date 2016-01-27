/**
 * Created with IntelliJ IDEA.
 * User: Luca
 * Date: 25/07/14
 * Time: 10.59
 */
package com.jucasoft.dashstats.user.controller {
import com.jucasoft.dashstats.user.UserNotification;
import com.jucasoft.dashstats.user.model.UserProxy;
import com.jucasoft.flexjs.main.commons.crud.controller.RegisterCrudCommand;
import com.jucasoft.flexjs.main.commons.crud.controller.StartUpCommandBase;

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
