/**
 * Created by Luca on 24/01/2016.
 */
package com.jucasoft.dashstats.user.view.components {
import com.jucasoft.flexjs.main.commons.form.FormBase;

public class UserView extends FormBase{

    public function UserView() {
        super(window.document.createElement('div'));
        template();
        render();
    }

    private var _template:Function;

    private function template():void {
        _template = _.template('<iframe width="<%- width %>" height="<%- height %>" src="https://www.youtube.com/embed/<%- video %>" frameborder="0" allowfullscreen></iframe>');
    }

    private function render():void {
        var compiled:String = _template(serialize());
        this.element.innerHTML = compiled;
    }

    private function serialize():Object {
        return {width:'560',height:'315',video:'10KObAQFmlY'};
    }

}
}
