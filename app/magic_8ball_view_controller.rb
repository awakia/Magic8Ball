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
    #(main)> name.class.ancestors
    # => [String, NSMutableString, NSString, Comparable, NSObject, Kernel]
    #(main)> Array.ancestors
    # => [Array, NSMutableArray, NSArray, Enumerable, NSObject, Kernel]
    UIView.animateWithDuration(1.0,
      animations:lambda {
        @label.alpha = 0
        @label.transform = CGAffineTransformMakeScale(0.1, 0.1)
      },
      completion:lambda { |finishied|
        @label.text = @magicBall.randomAnswer
        UIView.animateWithDuration(1.0,
          animations:lambda {
            @label.alpha = 1
            @label.transform = CGAffineTransformIdentity
          }
        )
      }
    )
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
