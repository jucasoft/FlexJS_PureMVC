/**
 * Created by Luca on 23/01/2016.
 */
package com.jucasoft.dashstats.application.view.components {
import com.jucasoft.flexjs.main.commons.HtmlContainer;

public class Main{

    protected var body:Element;

    private function load(scripts:Array, callBack:Function):void {
        HtmlContainer.load(scripts, callBack);
    }

    public function Main(callBack:Function, scripts:Array = null) {
        this.body = document.getElementsByTagName('body')[0];
        this.body.className = 'Application';
        var div:HTMLDivElement = HTMLDivElement(window.document.createElement('div'));
        if (!this.body.style.overflow)
            this.body.style.overflow = 'hidden';

        if(scripts != null){
            load(scripts, callBack);
        } else {
            callBack();
        }
    }

    public function addEventListener(type:String, listener:Object, useCapture:Boolean):Object {
        return body.addEventListener(type, listener, useCapture);
    }

    public function dispatchEvent(evt:Event):Boolean {
        return this.body.dispatchEvent(evt);
    }

    public function removeEventListener(type:String, listener:Object, useCapture:Boolean):Object {
        return this.body.removeEventListener(type, listener, useCapture);
    }
}
}
