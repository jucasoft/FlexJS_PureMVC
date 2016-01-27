/**
 * Created by Luca on 24/01/2016.
 */
package com.jucasoft.dashstats.user.model {
import com.jucasoft.flexjs.main.commons.model.Collection;

import org.apache.flex.core.IFactory;

public class UserCollectionBuilder implements IFactory {
    public function UserCollectionBuilder() {
    }

    public function newInstance():* {
        trace('UserCollectionBuilder.newInstance()');
        var result:Collection = new Collection();
        var builder:UserBuilder = new UserBuilder();
        for (var i:int = 0; i < 10; i++) {
            result.addItem(builder.newInstance());
        }
        return result;
    }
}
}
