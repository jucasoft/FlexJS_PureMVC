/**
 * Created with IntelliJ IDEA.
 * User: Luca
 * Date: 27/06/14
 * Time: 16.19
 */
package com.jucasoft.flexjs.main.commons.utils {
import flash.events.Event;
import flash.events.IEventDispatcher;
import flash.net.FileFilter;
import flash.net.FileReference;

public class FileSelector {

    public function FileSelector(resultFunction:Function) {
        this.resultFunction = resultFunction;
        file = new FileReference();
        configureListeners(file);
        file.browse([new FileFilter("Documento (*.pdf)", "*.pdf")]);
    }

    private var file:FileReference;
    private var resultFunction:Function;

    private function configureListeners(dispatcher:IEventDispatcher):void {
        dispatcher.addEventListener(Event.CANCEL, cancelHandler);
        dispatcher.addEventListener(Event.COMPLETE, completeHandler);
        dispatcher.addEventListener(Event.OPEN, openHandler);
        dispatcher.addEventListener(Event.SELECT, selectHandler);
    }

    private function cancelHandler(event:Event):void {
        trace("cancelHandler: " + event);
    }

    private function completeHandler(event:Event):void {
        trace("completeHandler: " + event);
        var _file:FileReference = FileReference(event.target);
        resultFunction(_file);
    }

    private function openHandler(event:Event):void {
        trace("openHandler: " + event);
    }

    private function selectHandler(event:Event):void {
        var _file:FileReference = FileReference(event.target);
        trace("selectHandler: name=" + _file.name);
        _file.load();
    }
}
}
