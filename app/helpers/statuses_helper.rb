module StatusesHelper
    def status_path tweet
      user_status_path :username => tweet.user.username, :id => tweet.id
    end

    def sidebar_tab name, contents, opts = {}
      url = "#{opts[:prefix]}/#{name}"
      content_tag :li, :id => "#{name}_#{opts[:suffix] || 'tab'}", :class => ('active' if current_page?(url)) do
        content_tag :a, :class => 'in-page-link', :href => url do
          contents
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
end
