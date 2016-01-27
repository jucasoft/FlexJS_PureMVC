/**
 * Created with IntelliJ IDEA.
 * User: Luca
 * Date: 19/06/14
 * Time: 15.28
 */
package com.jucasoft.dashstats.user.model {
import com.jucasoft.flexjs.main.commons.crud.Names;
import com.jucasoft.flexjs.main.commons.crud.model.CrudProxy;
import com.jucasoft.flexjs.main.commons.crud.model.api.ICriteria;
import com.jucasoft.flexjs.main.commons.event.FaultEvent;
import com.jucasoft.flexjs.main.commons.event.ResultEvent;

public class UserProxy extends CrudProxy {
    public function UserProxy(names:Names, data:Object = null) {
        super(names);
    }

    override public function search(criteria:ICriteria):void {
        trace('UserProxy.search(criteria:ICriteria)');
        var ev:ResultEvent = new ResultEvent('result', new UserCollectionBuilder().newInstance());
        onResultSearch(ev);
    }

    override protected function onResultSearch(event:ResultEvent):void {
        super.onResultSearch(event);
    }

    override protected function onFaultSearch(event:FaultEvent):void {
        super.onFaultSearch(event);
    }
}
}
