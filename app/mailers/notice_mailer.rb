class NoticeMailer < ApplicationMailer
  def notice_mail(story)
    @story = story
    mail to: "example@mail.com", subject: "投稿通知メール"
  end
end
