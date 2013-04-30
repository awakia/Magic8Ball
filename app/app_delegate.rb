class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.backgroundColor = UIColor.yellowColor
    @window.makeKeyAndVisible
    # main)> app = UIApplication.sharedApplication
    # main)> repl(app.delegate)
    # (#<AppDelegate:0xd2773b0 @windo...)> @window.backgroundColor = UIColor.greenColor
    true
  end
end
