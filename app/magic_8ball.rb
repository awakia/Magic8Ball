class Magic8Ball
  def initialize
    @answers = ['Yes', 'No', 'Maybe', 'Try Again']
  end

  def randomAnswer
    @answers.sample
  end
end
