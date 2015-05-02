class Progess < ActiveRecord::Base
  belongs to :status, polymorphic: true
end
