/**
 * Created by Luca on 24/01/2016.
 */
package com.jucasoft.dashstats.home.model.vo {
public class Home {
    public function Home() {
    }

    public var name:String;
    public var surname:String;

    public function toString():String {
        return name + ' - ' + surname;
    }
}
}
