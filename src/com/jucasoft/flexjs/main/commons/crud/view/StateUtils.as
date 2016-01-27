package com.jucasoft.flexjs.main.commons.crud.view {
public class StateUtils {

    /**
     *     |  visible   |   enabled
     *-------------------------------
     *   0 |  false     |   false
     *   1 |  true      |   false
     *   2 |  false     |   true
     *   3 |  true      |   true
     *     |            |
     *
     * @param value
     * @return
     */

    public static function fromInt(value:int):Object {

        switch (value) {
            case 0:
                return {visible: false, enabled: false, includeInLayout: true};
                break;
            case 1:
                return {visible: true, enabled: false, includeInLayout: true};
                break;
            case 2:
                return {visible: false, enabled: true, includeInLayout: true};
                break;
            case 3:
                return {visible: true, enabled: true, includeInLayout: true};
                break;
            case 4:
                return {visible: true, enabled: true, includeInLayout: false};
                break;
        }

        return null;
    }

    public static function evaluate(state:int, uicomponet:UIComponent):void {
        trace("StateUtils.evaluate()");
        var prop:Object = fromInt(state);
//        trace("uicomponet.id: " + uicomponet.id);
//        trace("prop.visible: " + prop.visible);
//        trace("prop.enabled: " + prop.enabled);

        for (var key:String in prop) {
            trace("uicomponet.id: " + uicomponet.id + " key: " + key + " prop: " + prop[key]);
            uicomponet[key] = prop[key];
        }
//        uicomponet.visible = prop.visible;
//        uicomponet.enabled = prop.enabled;
    }

}

}
