class DashboardMessage < ApplicationRecord
  scope :by_priority, -> { order(priority: :asc) }
end
