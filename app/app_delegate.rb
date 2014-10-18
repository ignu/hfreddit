class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    view_controller = RedditImageController.new

    nav_controller = UINavigationController.alloc.initWithRootViewController(
      view_controller
    )

    nav_controller.setNavigationBarHidden true
    @window.rootViewController = nav_controller
    @window.rootViewController.wantsFullScreenLayout = true
    @window.makeKeyAndVisible
    true
  end
end
