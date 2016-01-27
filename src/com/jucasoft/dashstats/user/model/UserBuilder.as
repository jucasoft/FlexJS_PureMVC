/**
 * Created by Luca on 24/01/2016.
 */
package com.jucasoft.dashstats.user.model {
import com.jucasoft.dashstats.user.model.vo.User;
import com.jucasoft.flexjs.main.commons.utils.RandomizerUtil;

import org.apache.flex.core.IFactory;

public class UserBuilder implements IFactory{

    public function UserBuilder() {
    }

    public function newInstance():* {
        trace('UserBuilder.newInstance()');
        var result:User = new User();
        result.name = RandomizerUtil.randomValue(RandomizerUtil.NOMI);
        result.surname = RandomizerUtil.randomValue(RandomizerUtil.COGNOMI);
        trace(result.toString());
        return result;
    }
}
}
