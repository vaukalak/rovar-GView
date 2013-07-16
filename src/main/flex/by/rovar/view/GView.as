/**
 * Created with IntelliJ IDEA.
 * User: vaukalak
 * Date: 6/30/13
 * Time: 2:14 PM
 * To change this template use File | Settings | File Templates.
 */
package by.rovar.view
{
import by.rovar.events.BaseEventDispatcher;
import by.rovar.events.GMouseEvent;

import com.genome2d.components.renderables.GRenderable;
import com.genome2d.components.renderables.GSprite;
import com.genome2d.core.GNodeFactory;

import by.rovar.events.GViewEvent;

import com.genome2d.signals.GMouseSignal;

import flash.display.Stage;

[Event(type="by.rovar.events.GViewEvent", name="addedToStage")]
[Event(type="by.rovar.events.GViewEvent", name="removedFromStage")]
[Event(type="by.rovar.events.GViewEvent", name="added")]
[Event(type="by.rovar.events.GViewEvent", name="removed")]
public class GView extends BaseEventDispatcher
{

    private var _parent:GViewContainer;

    private var _face:GRenderable;


    public function GView()
    {
        addEventListener(GViewEvent.ADDED_TO_STAGE, onAddedToStage);
    }

    private function onAddedToStage(event:GViewEvent):void
    {
        removeEventListener(GViewEvent.ADDED_TO_STAGE, onAddedToStage);
        var viewContainer:GViewContainer = this as GViewContainer;
        if(viewContainer)
        {
            for(var i:uint = 0; i < viewContainer.numChildren; i++)
            {
                viewContainer.getChildAt(i).dispatchEvent(new GViewEvent(GViewEvent.ADDED_TO_STAGE));
            }
        }
        parent.removeEventListener(GViewEvent.ADDED_TO_STAGE, onAddedToStage);

    }


    public function get face():GRenderable
    {
        return _face ||= GNodeFactory.createNodeWithComponent(faceClass) as GRenderable;
    }

    protected function get faceClass():Class
    {
        return GRenderable;
    }

    public function get nativeStage():Stage
    {
        return stage.nativeStage;
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

    public function get parent():GViewContainer
    {
        return _parent;
    }

    final override protected function get $parent():BaseEventDispatcher
    {
        return _parent;
    }
}
}
