Gem::Specification.new do |s|
  s.name = 'easydom'
  s.version = '0.2.0'
  s.summary = 'Experimental gem to access XML elements from simple dot notation (e.g. person.name).'
  s.authors = ['James Robertson']
  s.files = Dir['lib/easydom.rb']
  s.add_runtime_dependency('free_dom', '~> 0.3', '>=0.3.1')
  s.signing_key = '../privatekeys/easydom.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/easydom'
end
