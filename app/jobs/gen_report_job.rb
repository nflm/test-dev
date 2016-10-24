class GenReportJob < ApplicationJob
  queue_as :default

  def perform(args={})
    users = User.all
    items = []
    users.each do |user|
      qty_posts = user.posts.where("published_at >= :start_date AND published_at <= :end_date",  {start_date: args[:start_date], end_date: args[:end_date]}).count
      qty_comments = user.comments.where("published_at >= :start_date AND published_at <= :end_date",  {start_date: args[:start_date], end_date: args[:end_date]}).count
      items << {
          nickname: user.nickname,
          email: user.email,
          qty_posts: qty_posts,
          qty_comments: qty_comments,
          sort: (qty_posts+qty_posts)/10
      }
    end

    items.sort!{|x,y| y[:sort]<=>x[:sort]}

    ReportsMailer.analytical_report(items, args[:email], args[:start_date], args[:end_date]).deliver_now
  end
end
