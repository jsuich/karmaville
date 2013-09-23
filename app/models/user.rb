class User < ActiveRecord::Base
  has_many :karma_points

  attr_accessible :first_name, :last_name, :email, :username, :total_karma

  # validates :first_name, :presence => true
  # validates :last_name, :presence => true

  # validates :username,
  #           :presence => true,
  #           :length => {:minimum => 2, :maximum => 32},
  #           :format => {:with => /^\w+$/},
  #           :uniqueness => {:case_sensitive => false}

  # validates :email,
  #           :presence => true,
  #           :format => {:with => /^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/i},
  #           :uniqueness => {:case_sensitive => false}

  def self.by_karma
    # joins(:karma_points).group('users.id').order('SUM(karma_points.value) DESC')
      User.order("total_karma DESC")
  end

  def update_karma
    self.total_karma = KarmaPoint.where(user_id: self.id).sum('value')
    self.save
  end
  # def total_karma
    # self.karma_points.sum(:value)
  # end

  def full_name
    "#{first_name} #{last_name}"
  end
end
