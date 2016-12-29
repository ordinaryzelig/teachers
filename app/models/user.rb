class User < ApplicationRecord

  has_many :comments
  has_many :teaching_positions, :foreign_key => :teacher_id do
    def latest
      order(:created_at).last
    end
  end
  has_many :schools, :through => :teaching_positions
  has_many :teacher_requests, :through => :teaching_positions

  has_many :supporter_follows, :class_name => 'Followship', :foreign_key => 'teacher_id'
  has_many :supporters, :through => :supporter_follows
  has_many :teacher_follows, :class_name => 'Followship', :foreign_key => 'supporter_id'
  has_many :teachers, :through => :teacher_follows

  CATEGORIES = %w[
    teacher
    donor
  ]

  TITLES = %w[
    Dr.
    Mr.
    Mrs.
    Ms.
  ]

  before_validation :if => :title_changed? do |user|
    user.title = user.title.presence
  end

  validates :title, :inclusion => {:in => TITLES}, :allow_nil => true
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :category, :inclusion => {:in => CATEGORIES}, :if => :category_changed?

  CATEGORIES.each do |cat|
    scope cat.pluralize, -> { where(:category => cat) }
  end

  class << self

    def find_or_create_from_auth_hash(auth_hash)
      raise "Can only authenticate via facebook" if auth_hash.fetch(:provider) != 'facebook'

      user_scope = User.where(
        :email => auth_hash.dig(:extra, :raw_info, :email),
      )
      user_scope.first || user_scope.create!(
        :auth_hash  => auth_hash,
        :first_name => auth_hash.dig(:extra, :raw_info, :first_name),
        :last_name  => auth_hash.dig(:extra, :raw_info, :last_name),
      )
    end

  end

  def name
    [
      title,
      first_name,
      last_name,
    ].compact.join(' ')
  end

  def professional_name
    [
      title || 'Ms./Mr.',
      last_name,
    ].join(' ')
  end

  def support(teacher)
    teachers << teacher
  end

  def supports?(teacher)
    teachers
      .where(:id => teacher.id)
      .exists?
  end

  CATEGORIES.each do |cat|
    define_method "#{cat}?" do
      category == cat
    end
  end

  # So teachers path uses '/teachers'.
  def model_name
    return super unless category
    ActiveModel::Name.new(self.class, nil, category.classify)
  end

end
