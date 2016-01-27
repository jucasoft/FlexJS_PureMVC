/**
 * Created with IntelliJ IDEA.
 * User: Luca
 * Date: 25/07/14
 * Time: 10.59
 */
package com.jucasoft.dashstats.user.controller {
import com.jucasoft.dashstats.user.UserNotification;
import com.jucasoft.dashstats.user.view.components.UserMediator;
import com.jucasoft.dashstats.user.view.components.UserView;
import com.jucasoft.flexjs.main.commons.crud.Names;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

public class UserViewStartUpCommand extends SimpleCommand {
    override public function execute(notification:INotification):void {
        trace('UserViewStartUpCommand.execute()');
        var homeView:UserView = new UserView();
        notification.getBody().body.appendChild(homeView.element);
        facade.registerMediator(new UserMediator(homeView, new Names(UserNotification.ENTITY)));
    }
}
}
