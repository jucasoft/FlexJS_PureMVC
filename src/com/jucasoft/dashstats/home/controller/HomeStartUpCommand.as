/**
 * Created with IntelliJ IDEA.
 * Home: Luca
 * Date: 25/07/14
 * Time: 10.59
 */
package com.jucasoft.dashstats.home.controller {
import com.jucasoft.dashstats.home.HomeNotification;
import com.jucasoft.dashstats.home.model.HomeProxy;
import com.jucasoft.flexjs.main.commons.crud.controller.RegisterCrudCommand;
import com.jucasoft.flexjs.main.commons.crud.controller.StartUpCommandBase;

import org.puremvc.as3.multicore.interfaces.INotification;

public class HomeStartUpCommand extends StartUpCommandBase {
    override public function execute(notification:INotification):void {

        this.setCommand(RegisterCrudCommand)
                .setEntityName(HomeNotification.ENTITY)
                .setProxy(HomeProxy);

        super.execute(notification);

    }
}
}
