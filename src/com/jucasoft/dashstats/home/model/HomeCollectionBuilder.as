/**
 * Created by Luca on 24/01/2016.
 */
package com.jucasoft.dashstats.home.model {
import com.jucasoft.flexjs.main.commons.model.Collection;

import org.apache.flex.core.IFactory;

public class HomeCollectionBuilder implements IFactory{
    public function HomeCollectionBuilder() {
    }

    public function newInstance():* {
        trace('HomeCollectionBuilder.newInstance()');
        var result:Collection = new Collection();
        var builder:HomeBuilder = new HomeBuilder();
        for (var i:int = 0; i<10 ; i++) {
            result.addItem(builder.newInstance());
        }
        return result;
    }
}
}
