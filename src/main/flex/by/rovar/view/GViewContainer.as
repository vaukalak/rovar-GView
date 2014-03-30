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

    private const _children:Vector.<GView> = new Vector.<GView>();

    override protected function get faceClass():Class
    {
        return GSprite;
    }

    public function addChild(value:GView):GView
    {
        value.$setParent(this);
        targetNode.addChild(value.face.node);
        _children.push(value);
        return value;
    }

    public function removeChild(value:GView):GView
    {
        value.$setParent(null);
        targetNode.removeChild(value.face.node);
        _children.splice(_children.indexOf(value), 1);
        return value;
    }

	public function removeChildAt(value : int) : void {
		removeChild(getChildAt(value));
	}

	public function getChildByName(value : String) : GView {
		var numChildren:int = _children.length;
		for (var i:int=0; i<numChildren; ++i)
			if (_children[i].name == name) return _children[i];

		return null;
	}

    public function get numChildren():uint
    {
        return _children.length;
    }

    public function getChildAt(i:int):GView
    {
        return _children[i];
    }
}
}
