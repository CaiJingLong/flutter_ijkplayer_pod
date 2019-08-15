Pod::Spec.new do |spec|

  spec.name         = "FlutterIJK"
  spec.version      = "0.1.0"
  spec.summary      = "IJKPlayer for Flutter."
  spec.description  = <<-DESC
  IJKPlayer for flutter
                   DESC
  
  spec.homepage     = "https://github.com/CaiJingLong/flutter_ijkplayer_pod"
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.author             = { "Caijinglong" => "cjl_spy@163.com" }
  spec.source       = { :git => "https://cjlspy@dev.azure.com/cjlspy/flutter_ijkplayer_pod/_git/flutter_ijkplayer_pod",:tag =>'0.1.0'}
  spec.vendored_frameworks = 'IJKMediaFramework.framework'
  spec.frameworks  = "AudioToolbox", "AVFoundation", "CoreGraphics", "CoreMedia", "CoreVideo", "MobileCoreServices", "OpenGLES", "QuartzCore", "VideoToolbox", "Foundation", "UIKit", "MediaPlayer"
  spec.libraries   = "bz2", "z", "stdc++"

  spec.platform = :ios
  spec.ios.deployment_target = '8.0'
  spec.requires_arc = true

  spec.prepare_command = <<-CMD
    tar -xvf ./IJKMediaFramework.txz
  CMD
end
