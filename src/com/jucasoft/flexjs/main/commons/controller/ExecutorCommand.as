/**
 * Created with IntelliJ IDEA.
 * User: Luca
 * Date: 17/04/14
 * Time: 15.26
 */
package com.jucasoft.flexjs.main.commons.controller {
import com.jucasoft.flexjs.main.commons.utils.RandomizerUtil;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

/**
 * Questo command si occupa di eseguire un determinato command evitando di doverlo registrare e deregistrare.
 */
public class ExecutorCommand extends SimpleCommand {
    public static const EXECUTE:String = "ExecuteExecutorCommand";

    /**l
     *
     * Il body della notifica deve contenere due attributi
     *      commandClass: la classe del command da eseguire.
     *      body: loggetto che verra inviato nella notifica come body.
     *
     *      {commandClass:EsempioCommand, body:esempioBody}
     *
     * @param notification
     */
    override public function execute(notification:INotification):void {

        var clazz:Class = Class(notification.getBody().commandClass);
        var object:Object = notification.getBody().body;

        //fixme
        var name:String = RandomizerUtil.randomNumber(9999999999999999999999999999999999999999999, 1).toString();

        facade.registerCommand(name, clazz);
        sendNotification(name, object);
        facade.removeCommand(name);

    }
}
}
