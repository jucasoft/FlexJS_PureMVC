/**
 * Created by Luca on 24/01/2016.
 */
package {
import com.jucasoft.dashstats.application.MainFacade;
import com.jucasoft.dashstats.application.view.components.Main;

public class Index extends Main {

    public static var NAME:String = 'mainApplication'

    private static const JQUERY_SCRIPT:String = 'vendor/jquery.js';
    private static const UNDERSCORE:String = 'vendor/underscore.js';

    public function Index() {
        super(run, [JQUERY_SCRIPT, UNDERSCORE]);
    }

    private function run():void {
        trace('Index.run()');
        new MainFacade(this, NAME).startup();
    }

}
}