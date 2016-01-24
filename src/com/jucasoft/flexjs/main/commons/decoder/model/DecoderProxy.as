/**
 * Created with IntelliJ IDEA.
 * User: Luca
 * Date: 20/03/14
 * Time: 17.20
 */
package com.jucasoft.flexjs.main.commons.decoder.model {
import com.jucasoft.flexjs.main.commons.crud.MethodNames;
import com.jucasoft.flexjs.main.commons.crud.Names;
import com.jucasoft.flexjs.main.commons.crud.model.RemoteObjectProxy;
import com.jucasoft.flexjs.main.commons.crud.model.api.ICriteria;
import com.jucasoft.flexjs.main.commons.crud.model.vo.Criteria;
import com.jucasoft.flexjs.main.commons.event.FaultEvent;
import com.jucasoft.flexjs.main.commons.event.ResultEvent;

public class DecoderProxy extends RemoteObjectProxy {

    /**
     *
     * @param names
     * @param data
     * @param methodName
     * @param destination
     */
    public function DecoderProxy(names:Names, data:Object, methodName:String, destination:String = "decoder") {
        this._methodName = methodName;
        super(names, destination, data);
    }

    protected var _methodName:String;
    public var loaded:Boolean = false;

    override protected function getMethodNames():MethodNames {
        return new MethodNames()
                .searchMethod(_methodName);
    }

    override public function search(criteria:ICriteria):void {
        if (criteria)
            ro.getOperation(_methodName).send(Criteria(criteria).data);
        else
            ro.getOperation(_methodName).send();
    }

    override protected function onResultSearch(event:ResultEvent):void {
        loaded = true;
        setData(event.result);
        sendNotification(names.remote.searchSuccess, getData(), uidChannel);
    }


    override protected function onFaultSearch(event:FaultEvent):void {
        loaded = true;
        super.onFaultSearch(event);
    }
}
}
