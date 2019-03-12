Pod::Spec.new do |spec|

  spec.name         = "FlutterIJK"
  spec.version      = "0.0.1"
  spec.summary      = "IJKPlayer for FlutterIJK."
  spec.description  = <<-DESC
                   DESC

  spec.homepage     = "https://github.com/CaiJingLong/flutter_ijkplayer_pod"
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.author             = { "Caijinglong" => "cjl_spy@163.com" }
  spec.source       = { :git => "https://github.com/CaiJingLong/flutter_ijkplayer_pod.git", :tag => "#{spec.version}" }
  spec.vendored_frameworks = 'IJKMediaFramework.framework'
  s.frameworks  = "AudioToolbox", "AVFoundation", "CoreGraphics", "CoreMedia", "CoreVideo", "MobileCoreServices", "OpenGLES", "QuartzCore", "VideoToolbox", "Foundation", "UIKit", "MediaPlayer"
  s.libraries   = "bz2", "z", "stdc++"

  # spec.frameworks = "SomeFramework", "AnotherFramework"

  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  spec.requires_arc = true

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # spec.dependency "JSONKit", "~> 1.4"

end
