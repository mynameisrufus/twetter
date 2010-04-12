class AddInReplyToToTweets < ActiveRecord::Migration
  def self.up
    add_column :tweets, :in_reply_to_status_id, :integer
    raise unless Tweet.all.all? {|tweet|
      if tweet.type != 'reply'
        true
      else
        in_reply_to = User.find_by_id(tweet.recipient_id).tweets.find(
          :first,
          :conditions => ["created_at < ?", tweet.created_at],
          :order => "created_at DESC"
        )
        tweet.update_attribute :in_reply_to_status_id, in_reply_to.id
      end
    }
  end

  def self.down
    remove_column :tweets, :in_reply_to_status_id
  end
end
