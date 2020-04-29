#!/usr/bin/env ruby

# file: easydom.rb

require 'free_dom'


class EasyDom

  def initialize(obj, debug: false)

    @debug = debug

    @e = obj.is_a?(String) ? FreeDom.new(obj).root : obj      

  end

  def method_missing(sym, *args, &block)

    puts "name: %s; args: %s" % [sym, args.inspect] if @debug

    if @e.respond_to? sym then
      puts 'attribute found' if @debug
      @e.method(sym).call(*args)
    else
      e = @e.element(sym.to_s)
      EasyDom.new(e, debug: @debug) if e
    end

  end

end
