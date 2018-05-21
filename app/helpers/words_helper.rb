module WordsHelper
  def correct_answer word
    word.answers.correct_answer
  end
end
