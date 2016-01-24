package com.jucasoft.flexjs.main.commons.crud.view {
import com.jucasoft.flexjs.main.commons.crud.Names;
import com.jucasoft.flexjs.main.commons.mediator.MediatorBase;

import org.puremvc.as3.multicore.interfaces.INotification;

/**
 * Questo mediator è la classe base di tutti i crud mediator.
 */
public class CrudMediator extends MediatorBase {

    public function CrudMediator(mediatorName:String, viewComponent:Object, names:Names) {
        this.names = names;
        super(mediatorName, viewComponent);
    }

    protected var names:Names;

    /**
     * Registro tutte le notifiche che dovrenno essere gestite dal crud
     */

    /*
     override public function listNotificationInterests():Array {
     return [
     names.remote.search,
     names.remote.searchSuccess,
     names.remote.searchFail,
     names.remote.create,
     names.remote.createSuccess,
     names.remote.createFail,
     names.remote.edit,
     names.remote.editSuccess,
     names.remote.editFail,
     names.remote.remove,
     names.remote.removeSuccess,
     names.remote.removeFail,
     names.remote.update,
     names.remote.updateSuccess,
     names.remote.updateFail
     ];
     }
     */


    override public function handleNotification(note:INotification):void {

        switch (note.getName()) {
            case names.remote.search:
                onSendSearch(note);
                break;
            case names.remote.searchSuccess:
                onSearchSuccess(note);
                break;
            case names.remote.searchFail:
                onSearchFail(note);
                break;
            case names.remote.create:
                onSendCreate(note);
                break;
            case names.remote.createSuccess:
                onCreateSuccess(note);
                break;
            case names.remote.createFail:
                onCreateFail(note);
                break;
            case names.remote.edit:
                onSendEdit(note);
                break;
            case names.remote.editSuccess:
                onEditSuccess(note);
                break;
            case names.remote.editFail:
                onEditFail(note);
                break;
            case names.remote.remove:
                onSendRemove(note);
                break;
            case names.remote.removeSuccess:
                onRemoveSuccess(note);
                break;
            case names.remote.removeFail:
                onRemoveFail(note);
                break;
            case names.remote.update:
                onSendUpdate(note);
                break;
            case names.remote.updateSuccess:
                onUpdateSuccess(note);
                break;
            case names.remote.updateFail:
                onUpdateFail(note);
                break;
        }

    }

    protected function onSendSearch(note:INotification):void {
        //throw new Error("Metodo da sovrascrivere.");
    }

    protected function onSearchSuccess(note:INotification):void {
        //throw new Error("Metodo da sovrascrivere.");
    }

    protected function onSearchFail(note:INotification):void {
        //throw new Error("Metodo da sovrascrivere.");
    }

    protected function onSendCreate(note:INotification):void {
        //throw new Error("Metodo da sovrascrivere.");
    }

    protected function onCreateSuccess(note:INotification):void {
        //throw new Error("Metodo da sovrascrivere.");
    }

    protected function onCreateFail(note:INotification):void {
        //throw new Error("Metodo da sovrascrivere.");
    }

    protected function onSendEdit(note:INotification):void {
        //throw new Error("Metodo da sovrascrivere.");
    }

    protected function onEditSuccess(note:INotification):void {
        //throw new Error("Metodo da sovrascrivere.");
    }

    protected function onEditFail(note:INotification):void {
        //throw new Error("Metodo da sovrascrivere.");
    }

    protected function onSendRemove(note:INotification):void {
        //throw new Error("Metodo da sovrascrivere.");
    }

    protected function onRemoveSuccess(note:INotification):void {
        //throw new Error("Metodo da sovrascrivere.");
    }

    protected function onRemoveFail(note:INotification):void {
        //throw new Error("Metodo da sovrascrivere.");
    }

    protected function onSendUpdate(note:INotification):void {
        //throw new Error("Metodo da sovrascrivere.");
    }

    protected function onUpdateSuccess(note:INotification):void {
        //throw new Error("Metodo da sovrascrivere.");
    }

    protected function onUpdateFail(note:INotification):void {
        //throw new Error("Metodo da sovrascrivere.");
    }

}
}
