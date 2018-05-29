class LessonCreateMailer < ApplicationMailer
  def remind_finish_lesson lesson
    @lesson = lesson
    mail to: lesson.user.email, subject: t(:subject_finish_lesson)
  end
end
