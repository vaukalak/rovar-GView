/**
 * Created with IntelliJ IDEA.
 * User: vaukalak
 * Date: 6/30/13
 * Time: 3:21 PM
 * To change this template use File | Settings | File Templates.
 */
package rovar.view
{
import com.genome2d.components.renderables.GRenderable;
import com.genome2d.core.GNode;
import com.genome2d.core.Genome2D;

final public class GViewStage extends GViewContainer
{

    override public function get face():GRenderable
    {
        return null;
    }


    override protected function get faceClass():Class
    {
        return null;
    }


    override protected function get targetNode():GNode
    {
        return Genome2D.getInstance().root;;
    }


    override public function get stage():GViewStage
    {
        return this;
    }
}
}
