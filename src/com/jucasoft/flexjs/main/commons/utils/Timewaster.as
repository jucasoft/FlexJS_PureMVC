/**
 * Created with IntelliJ IDEA.
 * User: Luca
 * Date: 11/07/14
 * Time: 9.42
 */
package com.jucasoft.flexjs.main.commons.utils {
import flash.events.TimerEvent;
import flash.utils.Timer;

public class Timewaster {

    private var time:Number;
    private var resultFunction:Function;
    private var args:Array;

    private function execute():void {
        var anonimFunction:Function = function aAnonim(event:TimerEvent):void {
            resultFunction.apply(null, args);
            Timer(event.target).removeEventListener(TimerEvent.TIMER, anonimFunction);
        };
        var timer:Timer = new Timer(time, 1);
        timer.addEventListener(TimerEvent.TIMER, anonimFunction);
        timer.start();
    }

    public function Timewaster(time:Number, resultFunction:Function, args:Array) {
        this.time = time;
        this.resultFunction = resultFunction;
        this.args = args;
        execute();
    }

}

}
