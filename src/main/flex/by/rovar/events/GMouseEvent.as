/**
 * Created with IntelliJ IDEA.
 * User: vaukalak
 * Date: 7/15/13
 * Time: 10:58 PM
 * To change this template use File | Settings | File Templates.
 */
package by.rovar.events
{
public class GMouseEvent extends GViewEvent
{

    public static const CLICK:String = "click";
    public static const MOUSE_DOWN:String = "down";
    public static const MOUSE_UP:String = "up";
    public static const MOUSE_OVER:String = "over";
    public static const MOUSE_OUT:String = "out";

    public function GMouseEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
    {
        super(type, bubbles, cancelable);
    }
}
}
