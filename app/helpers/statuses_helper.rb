module StatusesHelper
    def status_path tweet
      user_status_path :username => tweet.user.username, :id => tweet.id
    end

    def sidebar_tab name, contents = nil, opts = {}
      url = "#{opts[:prefix]}/#{name}"
      content_tag :li, :id => "#{name}_#{opts[:suffix] || 'tab'}", :class => ('active' if current_page?(url)) do
        content_tag :a, :class => 'in-page-link', :href => url do
          block_given? ? yield : html_escape(contents)
        end
      end
    end

    # Take a Status update and generate link elements
    def create_links(tweet)
      # NOTE: URLs before Users, otherwise we'll double escape the URLs
      link_users(link_hashtags(link_urls(html_escape(tweet)))).html_safe
      #link_users(link_urls(html_escape(tweet)))
    end

    # Turn @username into a link element
    def link_users(tweet)
      tweet.gsub(/@(\S+)/, '@<a href="/\1">\1</a>')    
    end

    def link_hashtags(tweet)
      # In normal use, hastags can be words and/or numbers
      tweet.gsub(/([^\S]|^)#([\w\d]+)/, '\1<a href="/search?keyword=%23\2">#\2</a>')                 
    end
    
    # Turn URLs into a link
    def link_urls(tweet)
      tweet.gsub(/([A-Z]+:\/\/[^\s]+)/i, '<a href="\1">\1</a>')
    end

    # Kaminari has link_to_next_page, but not this, so we need to add it so users can page back and forth
    def link_to_previous_page(scope, name, options = {})
      params = options.delete(:params) || {}
      param_name = options.delete(:param_name) || Kaminari.config.param_name
      link_to name, params.merge(param_name => (scope.current_page - 1)), options.reverse_merge(:rel => 'prev') unless scope.first_page?
    end

    def update_label
      if current_path[:controller] == 'users'
        "Send message to @#{user.username}:"
      else
        "What's happening?"
      end
    end
end
