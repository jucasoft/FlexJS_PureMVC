/**
 * Created by Luca on 23/01/2016.
 */
package com.jucasoft.flexjs.main.commons.form {
import com.jucasoft.flexjs.main.commons.form.model.api.IForm;
import com.jucasoft.flexjs.main.commons.ui.Container;

public class FormBase extends Container implements IForm {
    public function FormBase(element:Element = null) {
        super(element);
    }

    private var _item:Object;

    /**
     * raccoglie i dati dal form.
     * @param obj
     */
    public function collectData(obj:Object):void {
        throw new Error("");
    }

    /**
     * mette i dati nel form.
     * @param obj
     */
    public function plantData(obj:Object):void {
        throw new Error("");
    }

    /**
     * metodo invocato per annullare le modifiche reinserendo i gli ultimi dati passati come erogatore.
     */
    public function reset():void {
        plantData(_item);
    }

    protected var validators:Array;

    /**
     * metodo per settare la lista di validator
     * @param value
     */
    public function setValidator(value:Array):void {
        validators = value;
    }

    /**
     * metodo che ritorna la lista dei validator per questo form.
     * @return
     */
    public function getValidators():Array {
        return validators;
    }

    private var _crud:String;

    public function get crud():String {
        return _crud;
    }

    public function set crud(value:String):void {
        _crud = value;
    }

    public function isValid():Boolean {
        return true;
    }

    /**
     * resetta i messaggi di errore dei componenti grafici.
     */
    public function resetErrorString():void {

    }

    public function get item():Object {
        return _item;
    }

    public function set item(value:Object):void {
        _item = value;
    }


}
}
