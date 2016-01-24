package com.jucasoft.flexjs.main.commons.crud.model.vo {
import com.jucasoft.flexjs.main.commons.crud.Names;
import com.jucasoft.flexjs.main.commons.crud.model.api.ICriteria;

public class InitCriteria implements ICriteria {
    public function InitCriteria(names:Names, crudProxy:Class = null) {
        this.names = names;
        this.proxy = crudProxy;
    }

    public var proxy:Class;
    public var names:Names;

}
}