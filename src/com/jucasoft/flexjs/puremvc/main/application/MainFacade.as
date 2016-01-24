package com.jucasoft.flexjs.puremvc.main.application {
import com.jucasoft.flexjs.main.commons.controller.ExecutorCommand;
import com.jucasoft.flexjs.main.commons.facade.FacadeBase;
import com.jucasoft.flexjs.puremvc.main.application.controller.ApplicationStartupCommand;
import com.jucasoft.flexjs.puremvc.main.application.view.ApplicationMediator;

public class MainFacade extends FacadeBase {

    public static const NAME:String = "icaroWebMain";


    public function MainFacade(viewComponent:HTMLElement, name:String) {
        this._app = viewComponent;
        super(name);
    }

    private var _app:HTMLElement;

    override protected function initializeView():void {
        super.initializeView();
        registerMediator(new ApplicationMediator(_app));
    }

    override protected function initializeController():void {
        super.initializeController();
        registerCommand(MainNotification.START_UP, ApplicationStartupCommand);
        // Registro il command che servirà ad eseguire puntualmente un command senza doverlo registrare.
        registerCommand(ExecutorCommand.EXECUTE, ExecutorCommand);
    }

    public function startup():void {
        sendNotification(MainNotification.START_UP, this._app);
    }
}
}