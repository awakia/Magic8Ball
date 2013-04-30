class Magic8Ball
  def initialize
    @answers = loadAnswers
  end

  def loadAnswers
    answerFile = NSBundle.mainBundle.pathForResource('answers', ofType:'json')
    errorPointer = Pointer.new(:object)

    data = NSData.alloc.initWithContentsOfFile(answerFile,
      options:NSDataReadingUncached,
      error:errorPointer)

    unless data
      printError error = errorPointer[0]
      return ['X', 'Y']
    end

    json = NSJSONSerialization.JSONObjectWithData(data,
      options:NSDataReadingUncached,
      error:errorPointer)

    unless json
      printError error = errorPointer[0]
      return ['X', 'Y']
    end

    json['answers']
  end

  def printError(error)
    $stderr.puts "Error: #{error.description}"
  end

  def randomAnswer
    @answers.sample
  end
end
