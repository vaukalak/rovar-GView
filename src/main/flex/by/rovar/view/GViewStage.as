/**
 * Created with IntelliJ IDEA.
 * User: vaukalak
 * Date: 6/30/13
 * Time: 3:21 PM
 * To change this template use File | Settings | File Templates.
 */
package by.rovar.view
{
import com.genome2d.components.renderables.GRenderable;
import com.genome2d.core.GNode;
import com.genome2d.core.Genome2D;

import flash.display.Stage;

final public class GViewStage extends GViewContainer
{
    private var _nativeStage:Stage;

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
        return Genome2D.getInstance().root;
    }


    override public function get stage():GViewStage
    {
        return this;
    }

    public function set nativeStage(value:Stage):void
    {
        _nativeStage = value;

    }

    override public function get nativeStage():Stage
    {
        return _nativeStage;
    }
}
}
