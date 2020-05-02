#!/usr/bin/env ruby

# file: easydom.rb

require 'free_dom'


class EasyDom
  
  attr_reader :e

  def initialize(obj=nil, debug: false, root: 'root')

    @debug = debug
    
    obj ||= "<#{root}/>"

    @e = obj.is_a?(String) ? FreeDom.new(obj).root : obj      

  end
  
  def ==(v)
    @e.attributes.values.first.to_s == v
  end  
  
  def to_s()
    @e.attributes.values.first.to_s
  end
  
  def to_sliml()
    @e.to_sliml()
  end

  def method_missing(sym, *args, &block)

    puts "name: %s; args: %s" % [sym, args.inspect] if @debug

    if @e.respond_to? sym then
      
      puts 'attribute found' if @debug
      @e.method(sym).call(*args)
      
    elsif sym.to_s[-1] == '='
      
      # assumes the 1st attribute it finds is the attribute to be set
      
      puts '==' if @debug
      e = @e.element(sym.to_s[0..-2])
      
      if e.nil? then

        attribute = sym[0..-2]
        
        @e.instance_eval("def #{attribute}()
          attributes[:#{attribute}]
        end")
        
        @e.instance_eval("def #{sym}(val)
          attributes[:#{attribute}] = val
          val
        end")
        
        return @e.method(sym).call(args.first)
      end
      
      attr = e.attributes.keys.first.to_s        
      
      puts 'attribute: ' + attr.inspect if @debug
      
      e.method((attr + '=').to_sym).call(*args)
      
    else
      
      puts 'query element: ' + sym.to_s if @debug
      e = @e.element(sym.to_s)
      
      # if the element doesn't exist, create it
      e = @e.add FreeDom::Element.new(sym, attributes: {}) unless e
      
      EasyDom.new(e, debug: @debug) if e
      
    end

  end

end
