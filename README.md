# Introducing the EasyDom gem

    require 'easydom'

    xml = "<home>
      <kitchen>
        <light switch='off'/>
      </kitchen>

      <porch>
        <doorentry>
          <button name='btn'></button>
        </doorentry>
        <door lock='locked'>
      </porch>

      <livingroom>
      </livingroom>
    </home>
    "


    home = EasyDom.new(xml, debug: true)
    home.kitchen #=> #<EasyDom:0x00005653821e4db8 @debug=false, @e=<kitchen styl...

    home.kitchen.light.switch #=> off
    home.kitchen.light.switch = 'on'
    home.kitchen.light.switch #=> on


Element attributes values are written back to the XML document through the DOM.

## Resources

* easydom https://rubygems.org/gems/easydom

easydom dom xml
