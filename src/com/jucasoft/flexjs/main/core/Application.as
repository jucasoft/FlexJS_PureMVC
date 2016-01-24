/**
 * Created by Luca on 23/01/2016.
 */
package com.jucasoft.flexjs.main.core {
public class Application{

    protected static const Page:HTMLDocument = window.document;
    public static var Application:HTMLBodyElement;

    public function Application() {
        Application = HTMLBodyElement(Page.body);
    }

}
}
