#
# Be sure to run `pod lib lint InjectedContentKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'InjectedContentKit'
  s.version          = '0.1.0'
  s.summary          = 'A short description of InjectedContentKit.'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/flypigrmvb/InjectedContentKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'flypigrmvb' => '862709539@qq.com' }
  s.source           = { :git => 'https://github.com/flypigrmvb/InjectedContentKit.git', :tag => s.version.to_s }

    s.ios.deployment_target = '8.0'
    s.source_files = 'InjectedContentKit/Classes/**/*'
    s.public_header_files = 'Pod/Classes/**/*.h'
    s.prefix_header_contents = '#import "ICK_NetworkInterfaceManager.h"', '#import "ICK_UtilMacro.h"', '#import "ICK_MMSessionTask.h"'
end
