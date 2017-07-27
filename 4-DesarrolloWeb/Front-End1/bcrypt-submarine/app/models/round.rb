class Round < ActiveRecord::Base
  #Validaciones
validates :destroyed_subs, :result, presence: true
end
