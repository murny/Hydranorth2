class User < ApplicationRecord
  # Connects this user object to Hydra behaviors.
  include Hydra::User
  # Connects this user object to Curation Concerns behaviors.
  include CurationConcerns::User
  # Connects this user object to Sufia behaviors.
  include Sufia::User
  include Sufia::UserUsageStats

  if Blacklight::Utils.needs_attr_accessible?
    attr_accessible :email, :password, :password_confirmation
  end
  # Connects this user object to Blacklights Bookmarks.
  include Blacklight::User

  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # TODO: Can probably remove a few of these if we are only using omniauth?
  # Don't need recoverable/rememberable (can drop columns as well,
  # reset_password_toket/reset_password_sent_at/remember_created_at
  # devise guest? drop column
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:shibboleth]

  has_many :user_roles, dependent: :destroy

  validates :uid, :provider, presence: true
  validates :uid, uniqueness: { scope: :provider }

  # Method added by Blacklight; Blacklight uses #to_s on your
  # user class to get a user-displayable login/identifier for
  # the account.
  def to_s
    email
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.affiliation = auth.info.affiliation
      user.display_name = auth.info.display_name
      user.telephone = auth.info.telephone
    end
  end

  # Override user_groups to add 'admin' based on rolify admin role
  def groups
    has_role?(:admin) ? ['admin'] : []
  end
end
