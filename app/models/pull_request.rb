class PullRequest < ApplicationRecord
  enum status: { open: 0, merged: 1, closed: 2 }
  belongs_to :curriculum
end
