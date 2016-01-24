/* 
 PureMVC Flex/WebORB Demo – Login 
 Copyright (c) 2007 Jens Krause <jens.krause@puremvc.org> <www.websector.de>
 Your reuse is governed by the Creative Commons Attribution 3.0 License
 */
package com.jucasoft.flexjs.puremvc.main.application.view {

import com.jucasoft.flexjs.main.core.Application;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.mediator.Mediator;

/**
 * A Mediator for interacting with the top level Application.
 */
public class ApplicationMediator extends Mediator {
    public static const NAME:String = 'ApplicationMediator';

    /**
     * Constructor.
     *
     * @param object the viewComponent
     */
    public function ApplicationMediator(viewComponent:Element) {
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
    protected function get app():Application {
        return viewComponent as Application;
    }
}
}