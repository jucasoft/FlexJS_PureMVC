/**
 * Created by Luca on 24/01/2016.
 */
package com.jucasoft.dashstats.home.view.components {
import com.jucasoft.dashstats.home.model.vo.Home;
import com.jucasoft.flexjs.main.commons.crud.Names;
import com.jucasoft.flexjs.main.commons.crud.model.vo.Criteria;
import com.jucasoft.flexjs.main.commons.model.Collection;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.mediator.Mediator;

public class HomeMediator extends Mediator {
    public static var NAME:String = 'HomeMediator';
    private var names:Names;

    public function HomeMediator(viewComponent:HomeView, names:Names) {
        trace('HomeMediator.HomeMediator(viewComponent:Object, names:Names)');
        this.names = names;
        super(NAME, viewComponent);
    }

    override public function onRegister():void {
        trace('HomeMediator.onRegister()');
        sendNotification(names.remote.search, new Criteria());
    }

    override public function onRemove():void {
        trace('HomeMediator.onRemove()');
        super.onRemove();
    }

    override public function listNotificationInterests():Array {
        return [names.remote.searchSuccess];
    }

    override public function handleNotification(notification:INotification):void {
        trace('HomeMediator.handleNotification(notification:INotification)');
        trace('notification.getName(): ' + notification.getName());
        makeTable(Collection(notification.getBody()));
    }

    private function makeTable(values:Collection):void {
        for each (var home:Home in values) {
//            app.addElement(HTMLDivElement(window.document.createElement("DIV")));
        }
    }

    protected function get app():HomeView {
        return viewComponent as HomeView;
    }
}
}
