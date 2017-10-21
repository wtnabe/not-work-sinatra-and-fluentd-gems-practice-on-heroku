require 'sinatra'
require 'sinatra/reloader' if development?
require 'fluent-logger'

before do
  @fluent = Fluent::Logger::FluentLogger.new('fluentd-lesson', socket_path: '/tmp/fluentd.socket')
end

get '/' do
  @fluent.post('info', {message: 'logged from fluent-logger'})
  'Hello, World'
end
