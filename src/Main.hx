
import luxe.Color;
import luxe.Vector;
import luxe.Input;
import luxe.Text;

import mint.render.luxe.LuxeMintRender;
import mint.layout.margins.Margins;

class Main extends luxe.Game {

    static var canvas: mint.Canvas;
    static var rendering: LuxeMintRender;
    static var layout: Margins;

    var window1: mint.Window;
    var label : mint.Label;

    override function ready() {

        Luxe.renderer.clear_color.rgb(0x6FFF6F);

        rendering = new LuxeMintRender();
        layout = new Margins();

        canvas = new mint.Canvas({
            name:'canvas',
            rendering: rendering,
            options: { color:new Color(1,1,1,0.0) },
            x: 0, y:0, w: 960, h: 640
        });

        create_window1();
    } //ready

    override function update(dt:Float) {

        canvas.update(dt);
    } //update

    function create_window1() {

        window1 = new mint.Window({
            parent: canvas,
            name: 'window1',
            title: 'Titlebar',
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

    } //create_window1
} //Main
