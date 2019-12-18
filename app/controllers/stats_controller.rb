class StatsController < ApplicationController
  respond_to :json
  before_action do
    login_required "admin"
  end

  def index
    @worlds = World.all
    @reached_counts = [].fill 0, 0..@worlds.count - 1
    @mustaches_counts = [].fill 0, 0..@worlds.count - 1
    @secret_counts = [].fill 0, 0..@worlds.count - 1
    @highscores = []
    reached_max = mustaches_max = secret_max = 1
    User.all.each do |user|
      if user.game_progress
        gp = ActiveSupport::JSON.decode user.game_progress
        # gp ex: {"score"=>5595, "lastCheckpoints"=>[4], "stars"=>[[nil, nil, 0, 0, 3]], "unlockWorlds"=>[], "mustaches"=>[]}
        if @highscores.length == 0 or gp["score"] > @highscores[0][:score]
          @highscores << {:score => gp["score"], :user => user}
          @highscores.sort {|a, b| a[:score] <=> b[:score]}
        end
        reached_max = world_stats gp["lastCheckpoints"], @reached_counts
        mustaches_max = world_stats gp["mustaches"], @mustaches_counts
        secret_max = world_stats gp["unlockWorlds"], @secret_counts
      end
    end
    normalize_array @reached_counts, reached_max
    normalize_array @mustaches_counts, mustaches_max
    normalize_array @secret_counts, secret_max
    @day_stats = day_stats
    @retention_stats = retention_stats
  end

  protected

  def world_stats user_stat_arr, world_stat_arr
    max = 1
    user_stat_arr.each_with_index do |el, i|
      if el
        world_stat_arr[i] += 1
        max == world_stat_arr[i] if max < world_stat_arr[i]
      end
    end
    max
  end

  def normalize_array arr, max
    arr.each_with_index do |el, i|
      arr[i] = el * 100 / max
    end
  end

  def day_stats
    # TODO
  end

  def retention_stats
    # TODO
  end
end

