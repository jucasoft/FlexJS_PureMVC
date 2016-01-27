/**
 * Created by Luca on 24/01/2016.
 */
package com.jucasoft.dashstats.user.view.components {
import com.jucasoft.dashstats.user.model.vo.User;
import com.jucasoft.flexjs.main.commons.crud.Names;
import com.jucasoft.flexjs.main.commons.crud.model.vo.Criteria;
import com.jucasoft.flexjs.main.commons.model.Collection;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.mediator.Mediator;

public class UserMediator extends Mediator {
    public static var NAME:String = 'UserMediator';
    private var names:Names;

    public function UserMediator(viewComponent:UserView, names:Names) {
        trace('UserMediator.UserMediator(viewComponent:Object, names:Names)');
        this.names = names;
        super(NAME, viewComponent);
    }

    override public function onRegister():void {
        trace('UserMediator.onRegister()');
        sendNotification(names.remote.search, new Criteria());
    }

    override public function onRemove():void {
        trace('UserMediator.onRemove()');
        super.onRemove();
    }

    override public function listNotificationInterests():Array {
        return [names.remote.searchSuccess];
    }

    override public function handleNotification(notification:INotification):void {
        trace('UserMediator.handleNotification(notification:INotification)');
        trace('notification.getName(): ' + notification.getName());
        makeTable(Collection(notification.getBody()));
    }

    private function makeTable(values:Collection):void {
        for each (var home:User in values) {
//            app.addElement(HTMLDivElement(window.document.createElement("DIV")));
        }
    }

    protected function get app():UserView {
        return viewComponent as UserView;
    }
}
}
