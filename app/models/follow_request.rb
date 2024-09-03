class FollowRequest < ApplicationRecord
  belongs_to :requester
  belongs_to :requested
  validates :status, inclusion: { in: %w[pending accepted declined] }

end
