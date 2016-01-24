package com.jucasoft.flexjs.main.commons.crud.model.vo {
import com.jucasoft.flexjs.main.commons.crud.model.api.ICriteria;

public class Criteria implements ICriteria {

    public function Criteria(data:Object = null) {
        this.data = data;
    }

    public var data:Object;

}
}
