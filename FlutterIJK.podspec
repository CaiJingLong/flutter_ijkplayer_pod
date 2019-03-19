Pod::Spec.new do |spec|

  spec.name         = "FlutterIJK"
  spec.version      = "0.0.4"
  spec.summary      = "IJKPlayer for Flutter."
  spec.description  = <<-DESC
  IJKPlayer for flutter
                   DESC
  
  spec.homepage     = "https://github.com/CaiJingLong/flutter_ijkplayer_pod"
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.author             = { "Caijinglong" => "cjl_spy@163.com" }
  spec.source       = { :http => "https://github.com/CaiJingLong/flutter_ijkplayer_pod/releases/download/0.0.4/IJKMediaFramework.tar.xz"}
  spec.vendored_frameworks = 'IJKMediaFramework.framework'
  spec.frameworks  = "AudioToolbox", "AVFoundation", "CoreGraphics", "CoreMedia", "CoreVideo", "MobileCoreServices", "OpenGLES", "QuartzCore", "VideoToolbox", "Foundation", "UIKit", "MediaPlayer"
  spec.libraries   = "bz2", "z", "stdc++"

  spec.platform = :ios
  spec.ios.deployment_target = '8.0'
  spec.requires_arc = true

end
