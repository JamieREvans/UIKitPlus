Pod::Spec.new do |s|

  s.name             = "UIKitPlus"
  s.version          = "1.3.0"
  s.summary          = "The missing UIKit methods"
  s.homepage         = "https://github.com/JamieREvans/UIKitPlus"
  s.license          = 'MIT'
  s.author           = { "Jamie Evans" => "jamie.riley.evans@gmail.com" }
  s.source           = { :git => "https://github.com/JamieREvans/UIKitPlus.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files     = 'Pod/Classes/*.{h,m}', 'Pod/Classes/**/*.{h,m}'

  s.dependency 'FoundationPlus', '~> 1.0'

end
