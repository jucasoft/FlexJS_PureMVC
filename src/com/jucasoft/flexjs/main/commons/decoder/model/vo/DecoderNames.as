/**
 * Created with IntelliJ IDEA.
 * User: Luca
 * Date: 06/05/14
 * Time: 18.27
 */
package com.jucasoft.flexjs.main.commons.decoder.model.vo {
import com.jucasoft.flexjs.main.commons.crud.Names;

public class DecoderNames extends Names {
    public function DecoderNames(entityName:String) {
        super(entityName);
    }

    private var _methodName:String;

    public function method(value:String):DecoderNames {
        _methodName = value;
        return this;
    }

    public function get methodName():String {
        return _methodName;
    }
}
}
