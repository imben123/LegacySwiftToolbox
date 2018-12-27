Pod::Spec.new do |s|

  s.name         = "SwiftToolbox"
  s.version      = "1.0.2"
  s.summary      = "Some simple functions I find myself needing across projects"
  s.description  = <<-DESC
  Contains mostly categories and helper functions I use commonly between many projects.
                   DESC

  s.homepage     = "https://github.com/imben123/SwiftToolbox"

  s.license      = { :type => "MIT", :file => "LICENSE.txt" }

  s.author             = { "Ben Davis" => "ben@bendavisapps.co.uk" }
  s.social_media_url   = "http://twitter.com/imben123"


  s.platform     = :ios
  s.platform     = :ios, "10.0"

  s.source       = { :git => "https://github.com/imben123/SwiftToolbox.git", :tag => "#{s.version}" }
  s.source_files  = "SwiftToolbox"
  s.exclude_files = "SwiftToolbox/*Tests.{swift,h,m}"

  s.dependency "Reachability", "3.2"

end
