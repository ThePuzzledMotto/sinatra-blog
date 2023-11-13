require 'sinatra'
require 'blog/posts.rb'

class App < Sinatra::Base
    @posts = Posts.new
    
    configure do
        set :port, 8080  
    end

    def self.run()
        @posts.insert 'First Post', 'This is the first Post'
        @posts.insert 'Second Post', 'This is the second Post'

        get '/' do
            erb :index, locals: { posts: @posts.get_posts }
        end
    end
end
