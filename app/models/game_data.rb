class GameData < ActiveRecord::Base
  attr_accessible :level_id, :user_id, :time, :star_count, :status, :user_agent, :uuid
end