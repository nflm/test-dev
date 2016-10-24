class ReportsMailer < ApplicationMailer
  def analytical_report (items, email, start_date, end_date)
    @items = items
    @start_date = start_date
    @end_date = end_date
    mail(to: email, subject: "Analytical report from #{start_date} to #{start_date}")
  end

end
