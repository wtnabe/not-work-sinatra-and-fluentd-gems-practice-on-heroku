require 'sinatra'
require 'sinatra/reloader' if development?
require 'fluent-logger'

before do
  @fluent = Fluent::Logger::FluentLogger.new('fluentd-lesson', host: '127.0.0.1', port: 24224)
end

get '/' do
  @fluent.post('info', {message: 'logged from fluent-logger'})
  'Hello, World'
end
