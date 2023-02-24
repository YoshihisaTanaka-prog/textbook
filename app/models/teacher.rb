class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :introducer, presence: true

  def hash_format
    return {id: self.id, name: self.name, affiliation: self.affiliation}
  end
end
