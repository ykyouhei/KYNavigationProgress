Pod::Spec.new do |s|
  s.name         = "KYNavigationProgress"
  s.version      = "1.0.0"
  s.summary      = "KYNavigationProgress is simple extension of UINavigationController to display progress on the UINavigationBar."
  s.homepage     = "https://github.com/ykyouhei/KYNavigationProgress"
  s.license      = "MIT"
  s.author       = { "Kyohei Yamaguchi" => "kyouhei.lab@gmail.com" }
  s.social_media_url   = "https://twitter.com/kyo__hei"
  s.platform     = :ios
  s.source       = { :git => "https://github.com/ykyouhei/KYNavigationProgress.git", :tag => s.version.to_s }
  s.source_files = "KYNavigationProgress/*.swift"
  s.requires_arc = true
  s.ios.deployment_target = '8.0'
end
