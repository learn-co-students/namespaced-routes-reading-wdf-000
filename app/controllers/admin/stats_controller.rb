class Admin::StatsController < ApplicationController
  def index
    @post_count = Post.count
  end
end