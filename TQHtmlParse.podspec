#
#  Be sure to run `pod spec lint Uagent.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "TQHtmlParse"
  s.version      = "0.0.2"
  s.summary      = "html 解析获取文本图片对象."
  s.homepage     = "https://github.com/TianQiLi/TQHtmlParse"
  s.license      = "MIT"
  s.author       = { "litianqi" => "871651575@qq.com" }
  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/TianQiLi/TQHtmlParse.git", :tag => "#{s.version}" }
  s.source_files  = "TQHtmlParse/**/*.{h,m}"
  s.vendored_libraries = "TQHtmlParse/**/*.a"
  s.requires_arc = true


 end
