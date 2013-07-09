/**
 * Created with IntelliJ IDEA.
 * User: vaukalak
 * Date: 6/30/13
 * Time: 2:14 PM
 * To change this template use File | Settings | File Templates.
 */
package rovar.view
{
import by.rovar.events.BaseEventDispatcher;

import com.genome2d.components.renderables.GRenderable;
import com.genome2d.core.GNodeFactory;

import rovar.events.GViewEvent;

public class GView extends BaseEventDispatcher
{

    private var _parent:GViewContainer;

    private var _face:GRenderable;

    public function get face():GRenderable
    {
        return _face ||= GNodeFactory.createNodeWithComponent(faceClass) as GRenderable;
    }

    protected function get faceClass():Class
    {
        return GRenderable;
    }

    public function get stage():GViewStage
    {
        if (_parent)
        {
            return _parent.stage;
        }
        else
        {
            return null;
        }
    }

    internal function $setParent(value:GViewContainer):void
    {
        if (value === $parent) return;
        if ($parent)
        {
            dispatchEvent(new GViewEvent(GViewEvent.REMOVED, true));
            if(stage)
            {
                dispatchEvent(new GViewEvent(GViewEvent.REMOVED_FROM_STAGE));
            }
        }
        _parent = value;
        if (value)
        {
            dispatchEvent(new GViewEvent(GViewEvent.ADDED, true));
            if(stage)
            {
                dispatchEvent(new GViewEvent(GViewEvent.ADDED_TO_STAGE));
            }
        }
    }

    public function parent():GViewContainer
    {
        return _parent;
    }

    final override protected function get $parent():BaseEventDispatcher
    {
        return _parent;
    }
}
}
