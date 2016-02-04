
import luxe.Color;
import luxe.Vector;
import luxe.Input;
import luxe.Text;
import mint.render.luxe.Convert;
import mint.render.luxe.LuxeMintRender;
import mint.focus.Focus;
import mint.layout.margins.Margins;

class Main extends luxe.Game {

    var canvas: mint.Canvas;
    var rendering: LuxeMintRender;
    var focus: Focus;
    var layout: Margins;
    var window1: mint.Window;
    var label : mint.Label;

    override function ready() {

        Luxe.renderer.clear_color.rgb(0x6FFF6F);
        layout = new Margins();
        rendering = new LuxeMintRender();

        canvas = new mint.Canvas({
            name:'canvas',
            rendering: rendering,
            options: { color:new Color(1,1,1,0.0) },
            x: 0, y:0, w: 960, h: 640
        });
        focus = new Focus(canvas);

        window1 = new mint.Window({
            parent: canvas,
            name: 'window1',
            title: 'Title',
            options: {
                color:new Color().rgb(0x121212),
                color_titlebar:new Color().rgb(0x191919),
                label: { color:new Color().rgb(0x06b4fb) },
                close_button: { color:new Color().rgb(0x06b4fb) },
            },
            x:160, y:10, w:256, h: 400,
            w_min: 256, h_min:256,
            collapsible:true
        });

        label = new mint.Label({
           parent: window1,
           name: 'label',
           x:100, y:100, w:100, h:32,
           text: 'hello mínt',
           align:left,
           text_size: 14,
           onclick: function(_,_) { trace('hello mint!'); }
       });

    } //ready

    override function update(dt:Float) {
        canvas.update(dt);
    } //update

    override function onrender() {
        canvas.render();
    } //onrender

    override function onmousemove(e) {

        canvas.mousemove( Convert.mouse_event(e) );

    } //onmousemove

    override function onmousewheel(e) {
        canvas.mousewheel( Convert.mouse_event(e) );
    }

    override function onmouseup(e) {
        canvas.mouseup( Convert.mouse_event(e) );
    }

    override function onmousedown(e) {
        canvas.mousedown( Convert.mouse_event(e) );
    }

    override function onkeydown(e:luxe.Input.KeyEvent) {
        canvas.keydown( Convert.key_event(e) );
    }

    override function ontextinput(e:luxe.Input.TextEvent) {
        canvas.textinput( Convert.text_event(e) );
    }

    override function onkeyup(e:luxe.Input.KeyEvent) {

        canvas.keyup( Convert.key_event(e) );

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

} //Main
