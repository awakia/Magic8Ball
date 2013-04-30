class Magic8BallViewController < UIViewController
  def loadView
    self.view = UIImageView.alloc.init
  end

  def viewDidLoad
    view.image = UIImage.imageNamed('background.png')

    @label = makeLabel
    view.addSubview(@label)

    view.userInteractionEnabled = true
    recognizer = UITapGestureRecognizer.alloc.initWithTarget(self, action:'showAnswer')
    view.addGestureRecognizer(recognizer)

    @magicBall = Magic8Ball.new
  end

  def showAnswer
    @label.text = @magicBall.randomAnswer
    #(main)> name.class.ancestors
    # => [String, NSMutableString, NSString, Comparable, NSObject, Kernel]
    #(main)> Array.ancestors
    # => [Array, NSMutableArray, NSArray, Enumerable, NSObject, Kernel]

    @label.alpha = 0
    UIView.animateWithDuration(1.0,
      animations:lambda {
        @label.alpha = 1
      })
  end

  def makeLabel
    # labelFrame = CGRectMake(10, 60, 300, 80)
    labelFrame = [[10, 60], [300,80]]
    label = UILabel.alloc.initWithFrame(labelFrame)

    label.text = 'Tap for Answer!'
    label.font = UIFont.boldSystemFontOfSize(34)
    label.backgroundColor = UIColor.lightGrayColor
    label.textColor = UIColor.darkGrayColor
    label.textAlignment = UITextAlignmentCenter
    label
  end

end
