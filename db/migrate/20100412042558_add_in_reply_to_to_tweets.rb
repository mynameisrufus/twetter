class AddInReplyToToTweets < ActiveRecord::Migration
  def self.up
    add_column :tweets, :in_reply_to_status_id, :integer
    raise unless Tweet.replies.all? {|tweet|
      in_reply_to = User.find_by_id(tweet.recipient_id).tweets.find(
        :first,
        :conditions => ["created_at < ?", tweet.created_at],
        :order => "created_at DESC"
      )
      unless tweet.nil?
        tweet.update_attribute :in_reply_to_status_id, in_reply_to.id
      end
    }
  end

  def self.down
    remove_column :tweets, :in_reply_to_status_id
  end
end
