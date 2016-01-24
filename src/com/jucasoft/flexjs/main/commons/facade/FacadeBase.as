package com.jucasoft.flexjs.main.commons.facade {
import com.jucasoft.flexjs.main.commons.utils.ClassUtils;

import org.puremvc.as3.multicore.interfaces.IMediator;
import org.puremvc.as3.multicore.patterns.facade.Facade;

public class FacadeBase extends Facade {

    public static const REMOVE_APP:String = 'removeApp';

    public function FacadeBase(key:String) {
        super(key);
    }

    protected var app:HTMLElement;

    override public function registerMediator(mediator:IMediator):void {
        /**
         * verifico che non esista già un mediator instanziato con lo stesso nome.
         */
        if (hasMediator(mediator.getMediatorName())) {
            var clazz:String = ClassUtils.getFullyQualifiedSuperClassName(ClassUtils.forInstance(mediator));
            throw new Error("Attenzione si sta registrando un mediator con un mome già in uso, mediatorName: " + mediator.getMediatorName() + " ClasseMediator: " + clazz);
        }

        super.registerMediator(mediator);
    }

//    public static const REMOVE_APP:String = 'removeApp';
//    protected var app:Container;
//    metodo utile solo per la versione multicore
//    public function remove():void {
//        removeCore(multitonKey);
//        app.dispatchEvent(new Event(REMOVE_APP));
//        this.app.parent.removeChild(app);
//        app.removeAllChildren();
//        app = null;
//    }
}
}