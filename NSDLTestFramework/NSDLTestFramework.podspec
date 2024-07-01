

Pod::Spec.new do |spec|

  spec.name         = "NSDLTestFramework"
  spec.version      = "1.0.0"
  spec.summary      = "This is NSDL Test framework."
  spec.description  = "Demo framework for learning purpose."

  spec.homepage     = "https://github.com/dharabhuva9/NSDLFrameworkk"
 
  spec.license      = "MIT"
  
  spec.author             = { "Dhara Bhuva" => "dhara.bhuva@plusinfosys.com" }
 
  spec.platform     = :ios, "15.0"

  spec.source       = { :git => "https://github.com/dharabhuva9/NSDLFramework.git", :tag => "#{spec.version}" }

  spec.source_files  = "NSDLTestFramework/**/*.{swift}"

  spec.resources = "NSDLTestFramework/**/*.storyboard", "NSDLTestFramework/**/*.xib"

  spec.dependency "Alamofire", "~> 5.9.1"
  
  spec.swift_version = "5.0"

end
