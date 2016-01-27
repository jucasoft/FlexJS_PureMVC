package com.jucasoft.dashstats.application.view {

import com.jucasoft.dashstats.application.view.components.Main;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.mediator.Mediator;

/**
 * A Mediator for interacting with the top level Application.
 */
public class MainMediator extends Mediator {
    public static const NAME:String = 'MainMediator';

    /**
     * Constructor.
     *
     * @param object the viewComponent
     */
    public function MainMediator(viewComponent:Main) {
        super(NAME, viewComponent);
    }

    /**
     * List all notifications this Mediator is interested in.
     *
     * @return Array the list of Nofitication names
     */
    override public function listNotificationInterests():Array {
        return [];
    }

    /**
     * Handle all notifications this Mediator is interested in.
     *
     * @param INotification a notification
     */
    override public function handleNotification(note:INotification):void {
    }

    /**
     * Handles the applications view state based on the workflow state defined in Application Proxy
     */
    private function changeViewState():void {
    }

    /**
     * Cast the viewComponent to its actual type.
     *
     * @return app the viewComponent cast to Login
     */
    protected function get app():Main {
        return viewComponent as Main;
    }

    override public function onRegister():void {

    }
}
}