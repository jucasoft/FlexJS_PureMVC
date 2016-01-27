/**
 * Created by Luca on 24/01/2016.
 */
package com.jucasoft.dashstats.home.model {
import com.jucasoft.dashstats.home.model.vo.Home;
import com.jucasoft.flexjs.main.commons.utils.RandomizerUtil;

import org.apache.flex.core.IFactory;

public class HomeBuilder implements IFactory{

    public function HomeBuilder() {
    }

    public function newInstance():* {
        trace('HomeBuilder.newInstance()');
        var result:Home = new Home();
        result.name = RandomizerUtil.randomValue(RandomizerUtil.NOMI);
        result.surname = RandomizerUtil.randomValue(RandomizerUtil.COGNOMI);
        trace(result.toString());
        return result;
    }
}
}
