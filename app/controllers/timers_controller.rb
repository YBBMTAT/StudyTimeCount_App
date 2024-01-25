class TimersController < ApplicationController

  def index
    @timers = Timer.all
  end

  def show
    #累積時間の取得
    @cumulative_time = format_duration(current_user.timers.sum(:duration_seconds))
    @weekly_time = format_duration(current_user.timers.where(created_at: 1.week.ago..Time.now).sum(:duration_seconds))
    @month_time = format_duration(current_user.timers.where(created_at: 1.month.ago..Time.now).sum(:duration_seconds))
    @weekly_data = weekly_data(current_user)
  end
  
  def save
    # 受け取ったデータを処理
    duration_seconds = params[:duration_seconds]
    puts "Received duration_seconds: #{duration_seconds}"
    # データベースに保存する処理を追加
    Timer.create(user_id: current_user.id, duration_seconds: duration_seconds)

    render json: { status: 'success' }
  end

private

  def format_duration(seconds)
    Time.at(seconds).utc.strftime("%H時間%M分%S秒")
  end

  def weekly_data(user)
    weekly_data = user.timers
      .where(created_at: 1.week.ago..Time.now)
      .group_by_day(:created_at)
      .sum(:duration_seconds)

      weekly_data.map { |day, duration| [day, duration] }
  end
end
