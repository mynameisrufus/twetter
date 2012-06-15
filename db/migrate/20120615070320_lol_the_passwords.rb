class LolThePasswords < ActiveRecord::Migration
  def up
    User.find_each {|user|
      user.password = 'blank'
      user.save!
    }
  end
end
