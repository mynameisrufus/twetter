class AddInReplyToToTweets < ActiveRecord::Migration
  def self.up
    add_column :tweets, :in_reply_to_status_id, :integer
    raise unless Tweet.replies.all? {|tweet|
      if tweet.recipient_id.nil?
        puts "Missing recipient_id on Tweet<#{tweet.id}> (#{tweet.tweet})"
      else
        user = User.find_by_id(tweet.recipient_id)
        if user.nil?
          puts "Missing User<#{tweet.recipient_id}> for Tweet<#{tweet.id}> (#{tweet.tweet})"
        else
          in_reply_to = user.tweets.find(
            :first,
            :conditions => ["created_at < ?", tweet.created_at],
            :order => "created_at DESC"
          )
          if tweet.nil?
            puts "Missing in_reply_to tweet for User<#{tweet.recipient_id}>"
          else
            tweet.update_attribute :in_reply_to_status_id, in_reply_to.id
          end
        end
      end
    }
  end

  def self.down
    remove_column :tweets, :in_reply_to_status_id
  end
end
