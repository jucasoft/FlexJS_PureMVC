/**
 * Created by Luca.
 */
package {
import com.jucasoft.flexjs.main.core.Application;
import com.jucasoft.flexjs.puremvc.main.application.MainFacade;

public class Index extends Application {

    public function Index() {
        new MainFacade(HTMLBodyElement(Page.body), 'mainApplication').startup();
    }

}
}