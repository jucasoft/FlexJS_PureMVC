/**
 * Created by Luca on 24/01/2016.
 */
package com.jucasoft.dashstats.home.view.components {
import com.jucasoft.flexjs.main.commons.form.FormBase;

public class HomeView extends FormBase{

    public function HomeView() {
        super(window.document.createElement('div'));
        template();
        render();
    }

    private var _template:Function;

    private function template():void {
        _template = _.template("<h2><%- value %></h2>")
    }

    private function render():void {
        var compiled:String = _template(serialize());
        this.element.innerHTML = compiled;
    }

    private function serialize():Object {
        return {value: 'It - could - works!'};
    }

}
}
