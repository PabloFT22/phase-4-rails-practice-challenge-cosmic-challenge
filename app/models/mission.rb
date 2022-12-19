class Mission < ApplicationRecord
  belongs_to :scientist
  belongs_to :planet

  validates :name, :scientist, :planet, presence: true

  validates :scientist, uniqueness: {scope: :name}

  # must have a name, a scientist and a planet
  # validates :scientist, length: {maximum: 1}
  # validates :planet, presence: true
  # a scientist cannot join the same mission twice
  # validates :scientist, length: {maximum: 1}

  # validates :scientist, uniqueness: {scope: :name, message: "cant join the same mission twice"}
  # validates :planet_id, uniqueness: { scope: :scientist_id }
  # validates :scientist_id, uniqueness: true
end
