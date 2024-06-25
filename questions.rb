class Question
  def initialize()
    @number1 = rand(1..50)
    @number2 = rand(1..50)
    @answer = @number1 + @number2
    @answered = false
  end

  def ask_question()
  "What does #{@number1} plus #{@number2} equal?"
  end

  def correct_answer?(user_answer)
    user_answer.to_i == @answer
  end
end