#
# Be sure to run `pod lib lint TKRouter.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TKRouter'
  s.version          = '0.1.1'
  s.summary          = 'A short description of TKRouter.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
   1.基础路由。Api万能路由利用AOP编程思想，指针参数，等来实现任意object-c的API调用。
     支持基本数据类型，对象类型，代理，block，枚举，结构体等（系统自带和自定义均支持）
   2.本sdk用于组件化开发模式，多sdk嵌套等复杂的情况！完全解决项目开发的耦合度
   3.任意调用，随心所欲。可以在上面拓展hashc跳转表需求。
                       DESC

  s.homepage         = 'https://github.com/Tkoul/TKRouter'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Tkoul' => 'Tkoull@163.com' }
  s.source           = { :git => 'https://github.com/Tkoul/TKRouter.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'TKRouter/Classes/**/*'
  
  # s.resource_bundles = {
  #   'TKRouter' => ['TKRouter/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
