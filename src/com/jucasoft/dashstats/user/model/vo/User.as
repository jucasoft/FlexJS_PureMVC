/**
 * Created by Luca on 24/01/2016.
 */
package com.jucasoft.dashstats.user.model.vo {
public class User {
    public function User() {
    }

    public var name:String;
    public var surname:String;

    public function toString():String {
        return name + ' - ' + surname;
    }
}
}
