
#
# Be sure to run `pod lib lint ALLiveLogger.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
s.name             = 'ALLiveLogger'
s.version          = '0.1.2'
s.summary          = '一个基于CocoaHTTPServer搭建的本地服务,可以将日志实时输出到PC浏览器的审查元素console中。'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

s.description      = <<-DESC
一个基于CocoaHTTPServer搭建的本地服务,可以将日志实时输出到PC浏览器的审查元素console中。
DESC

s.homepage         = 'https://github.com/asomePubcode/ALLiveLogger'
s.screenshots     = 'https://github.com/asomePubcode/ALLiveLogger/blob/master/Images/liveLog.jpg',
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'asomeliao' => 'asomeliao@foxmail.com' }
s.source           = { :git => 'https://github.com/asomePubcode/ALLiveLogger.git', :tag => s.version.to_s }
# s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

s.ios.deployment_target = '8.0'
s.resources    = 'ALLiveLogger/Assets/*.bundle'
s.source_files = 'ALLiveLogger/Classes/**/*{.h,.m}'
s.requires_arc = true
s.dependency 'CocoaAsyncSocket'
end
