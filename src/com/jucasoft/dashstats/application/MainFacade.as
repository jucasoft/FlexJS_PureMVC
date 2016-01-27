package com.jucasoft.dashstats.application {
import com.jucasoft.dashstats.application.controller.MainStartUpMacroCommand;
import com.jucasoft.dashstats.application.view.MainMediator;
import com.jucasoft.dashstats.application.view.components.Main;
import com.jucasoft.flexjs.main.commons.controller.ExecutorCommand;
import com.jucasoft.flexjs.main.commons.facade.FacadeBase;

public class MainFacade extends FacadeBase {

    public static const NAME:String = "icaroWebMain";


    public function MainFacade(viewComponent:Main, name:String) {
        this._app = viewComponent;
        super(name);
    }

    private var _app:Main;

    override protected function initializeView():void {
        super.initializeView();
        registerMediator(new MainMediator(_app));
    }

    override protected function initializeController():void {
        super.initializeController();
        registerCommand(MainNotification.START_UP, MainStartUpMacroCommand);
        // Registro il command che servirà ad eseguire puntualmente un command senza doverlo registrare.
        registerCommand(ExecutorCommand.EXECUTE, ExecutorCommand);
    }

    public function startup():void {
        sendNotification(MainNotification.START_UP, this._app);
    }
}
}