Pod::Spec.new do |s|
  s.name         = "SwiftySlideMenu"
  s.version      = "0.1.0"
  s.summary      = "Slide animation menu for iOS"

  s.description  = <<-DESC
										- Slide animation menu written in Swift
                   DESC

  s.homepage     = "https://github.com/dobnezmi/SwiftySlideMenu"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Shingo Suzuki" => "kuma.kinoko.momo@gmail.com" }

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/dobnezmi/SwiftySlideMenu.git", :tag => "v#{s.version}" }

  s.source_files  = "SwiftySlideMenu/**/*.swift""
  s.requires_arc = true

end
