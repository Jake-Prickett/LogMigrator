Pod::Spec.new do |s|

s.name         = "LogMigrator"
s.version      = "1.0.0"
s.platform     = :ios, "12.0"
s.summary      = "Lightweight Logging wrapper for OSLog/Swift Logger."

s.description  = <<-DESC
Lightweight Logging wrapper to enable early adoption, as well as a seamless migration to Apple's new Swift Unified Logging APIs
DESC

s.homepage     = "https://github.com/Jake-Prickett/LogMigrator"
s.license      = { :type => 'MIT', :file => 'LICENSE' }
s.author       = { "Jake Prickett" => "jprickett821@gmail.com" }
s.source       = { :git => "https://github.com/Jake-Prickett/LogMigrator.git", :tag => "1.0.0" }

s.swift_version = "5.0"
s.source_files = "Sources/**/*.{h,swift}"

end