class Asset < ApplicationRecord
  belongs_to :assetable, polymorphic: true

  delegate :thumb, :url, :size, :path, to: :file
end
