/**
 * Created with IntelliJ IDEA.
 * User: Luca
 * Date: 19/06/14
 * Time: 15.28
 */
package com.jucasoft.flexjs.puremvc.user.model {
import com.jucasoft.flexjs.main.commons.crud.Names;
import com.jucasoft.flexjs.main.commons.crud.model.CrudProxy;

public class UserProxy extends CrudProxy {
    public function UserProxy(names:Names, data:Object = null) {
        super(names, "attivita");
    }
}
}
