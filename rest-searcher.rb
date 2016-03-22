require 'rest-client'

search_engines = {
  google:     'google.com',
  bing:       'bing.com/search',
  ask:        'ask.com/web',
  duckduckgo: 'duckduckgo.com'
}

puts 'What are you looking for?'
print 'Please insert your search terms: '
input = gets.chomp.split(' ').join('+')

protocol = 'http://'
sub_domain = 'www.'

search_engines.each do |engine, domain_and_path|
  host = protocol + sub_domain + domain_and_path
  puts "\n\nsearching #{engine} at #{host} ...\n\n"

  puts engine.to_s == 'google' ? RestClient.get(host, params: { gws_rd: 'ssl#', q: input }) :
    RestClient.get(host, params: { q: input })
end

puts "\nThat's all the results from these search engines: #{search_engines.keys.join(', ')}!"
