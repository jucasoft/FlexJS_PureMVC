/**
 * Created with IntelliJ IDEA.
 * User: Luca
 * Date: 10/04/14
 * Time: 11.39
 */
package com.jucasoft.flexjs.main.commons.crud.controller {
import com.jucasoft.flexjs.main.commons.crud.Names;
import com.jucasoft.flexjs.main.commons.crud.model.api.ICriteria;
import com.jucasoft.flexjs.main.commons.crud.model.api.IStartUpCommand;
import com.jucasoft.flexjs.main.commons.crud.model.vo.InitCriteria;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
import org.puremvc.as3.multicore.patterns.observer.Notification;

/**
 *
 * esempio:
 *
 *     override public function execute(notification:INotification):void {
 *       this.setCommand(RegisterDecoderCommand)
 *               .setEntityName(CodiceFiscaleNotification.ENTITY)
 *               .setProxy(CodiceFiscaleProxy)
 *               .execute(notification);
 *       }
 *
 */
public class StartUpCommandBase extends SimpleCommand implements IStartUpCommand {

    private var _command:Class;
    private var _entityName:String;
    private var _proxy:Class;

    override public function execute(note:INotification):void {
        var names:Names = new Names(_entityName);
        var criteriaA:ICriteria = new InitCriteria(names, _proxy);
        new _command(facade).execute(new Notification(note.getName(), criteriaA));
    }

    /**
     * Viene indicato il command che si occupa della registrazione
     * attualmente esiste:
     * RegisterDecoderCommand utilizzato per la registrazione automatica degli elementi necessari per le chiamate ai decoder.
     * RegisterCrudCommand utilizzato per la registrazione automatica degli elementi necessari le strutture crud.
     * ....
     * @param value
     * @return
     */
    public function setCommand(value:Class):IStartUpCommand {
        _command = value;
        return this;
    }

    /**
     * Chiave che crea un contesto per le chimata, nei casi più comuni si può utilizzate il nome dell'entità principale.
     * @param value
     * @return
     */
    public function setEntityName(value:String):IStartUpCommand {
        _entityName = value;
        return this;
    }

    /**
     * Classe proxy da registrare.
     * @param value
     * @return
     */
    public function setProxy(value:Class):IStartUpCommand {
        _proxy = value;
        return this;
    }

}
}
