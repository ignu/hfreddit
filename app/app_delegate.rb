class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    view_controller = RedditImageController.new

    nav_controller = UINavigationController.alloc.initWithRootViewController(
      view_controller
    )

    @window.rootViewController = nav_controller
    @window.makeKeyAndVisible
    true
  end
end
