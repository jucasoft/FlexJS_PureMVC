/**
 * Created by Luca on 23/01/2016.
 */
package com.jucasoft.flexjs.main.commons.ui {
public class Container implements IContainer{
    public function Container(element:Element = null) {
        this.element = element ? element : window.document.createElement('div');
    }
    public var element:Element;
}
}
