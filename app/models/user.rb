class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  DIALECT_VALUES = {
    yoda: 0,
    valleygirl: 1,
    piglatin: 2,
    ultraleet: 3
  }.freeze

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :messages

  validates :name, :dialect, presence: true

  enum dialect: DIALECT_VALUES
end
