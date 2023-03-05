class IntroducerMailer < ApplicationMailer
  def send_mail(new_teacher)
    @new_teacher = new_teacher
    @introducer = Teacher.find(new_teacher.introducer)
    mail(
      from: ENV['ADMIN_EMAIL'],
      to:   @introducer.email,
      subject: '権限付与の依頼'
    )
  end
end
