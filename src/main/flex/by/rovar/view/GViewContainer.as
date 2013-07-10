/**
 * Created with IntelliJ IDEA.
 * User: vaukalak
 * Date: 6/30/13
 * Time: 2:16 PM
 * To change this template use File | Settings | File Templates.
 */
package by.rovar.view
{
import com.genome2d.components.GTransform;
import com.genome2d.components.renderables.GSprite;
import com.genome2d.core.GNode;

public class GViewContainer extends GView
{
    override protected function get faceClass():Class
    {
        return GSprite;
    }

    public function addChild(value:GView):GView
    {
        value.$setParent(this);
        targetNode.addChild(value.face.node);
        return value;
    }

    public function removeChild(value:GView):GView
    {
        value.$setParent(null);
        targetNode.removeChild(value.face.node);
        return value;
    }

    public function get transform():GTransform
    {
        return face.node.transform;
    }

    protected function get targetNode():GNode
    {
        return face.node;
    }

}
}
