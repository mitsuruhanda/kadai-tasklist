#!/app/bin/ruby

require 'platform-api'

cleardb_url = ENV['CLEARDB_DATABASE_URL']
if cleardb_url.nil? || cleardb_url == ''
  puts "********Error: CLEARDB_DATABASE_URL not set"
  exit -1
end


target_app = ENV['HEROKU_APP_NAME']
puts "********target_app: #{ target_app }"
mysql_url = cleardb_url.sub('mysql', 'mysql2')
puts "********mysql_url: #{ mysql_url }"

puts "********Promoting '#{ mysql_url }' to DATABASE_URL for '#{ target_app }'..."
begin
  heroku.config_var.update(target_app, { 'DATABASE_URL' => mysql_url })
rescue Excon::Errors::UnprocessableEntity => e
  puts "#{ e.class }: #{ e.message }"
  exit (-1)
end


puts "********1 DATABASE_URL: #{ ENV['DATABASE_URL'] }"
`export DATABASE_URL='#{ mysql_url }'`
puts "********2 DATABASE_URL: #{ ENV['DATABASE_URL'] }"
ENV['DATABASE_URL'] = mysql_url
puts "********3 DATABASE_URL: #{ ENV['DATABASE_URL'] }"

exit (-1)