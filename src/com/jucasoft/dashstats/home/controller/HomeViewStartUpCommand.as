/**
 * Created with IntelliJ IDEA.
 * Home: Luca
 * Date: 25/07/14
 * Time: 10.59
 */
package com.jucasoft.dashstats.home.controller {
import com.jucasoft.dashstats.home.HomeNotification;
import com.jucasoft.dashstats.home.view.components.HomeMediator;
import com.jucasoft.dashstats.home.view.components.HomeView;
import com.jucasoft.flexjs.main.commons.crud.Names;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

public class HomeViewStartUpCommand extends SimpleCommand {
    override public function execute(notification:INotification):void {
        trace('HomeViewStartUpCommand.execute()');
        var homeView:HomeView = new HomeView();
        notification.getBody().body.appendChild(homeView.element);
        facade.registerMediator(new HomeMediator(homeView,new Names(HomeNotification.ENTITY)));
    }
}
}
