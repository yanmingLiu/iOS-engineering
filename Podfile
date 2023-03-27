platform :ios, '13.0'

inhibit_all_warnings!

install! 'cocoapods',
         :generate_multiple_pod_projects => true

def dev_pods
  puts "🚀 dev_pods start 🚀"
  pod 'LookinServer', :subspecs => ['Swift'], :configurations => ['Debug']
  pod 'SwiftLint', configurations: ['Debug']
end

def core_pods
  puts "🚀 core_pods start 🚀"
  pod 'Moya', '= 15.0.0'
  pod 'BetterCodable', '~> 0.1.0'
  pod 'SnapKit', '= 5.6.0'
  pod 'JXSegmentedView', '= 1.3.0'
  pod 'JXPagingView/Paging', '= 2.1.2'
  pod 'SwiftyAttributes', '= 5.1.1'
  pod 'Kingfisher', '= 7.6.2'
  pod 'Cache', '= 6.0.0'
  pod 'R.swift', '= 7.3.0'
  pod 'CryptoSwift', '= 1.6.0'
  pod 'YMExtension'
end

target 'iOS-engineering' do
  use_frameworks!
  puts "🚀 pod install start 🚀"
  dev_pods
  core_pods
end

post_install do |installer|
  puts "🚀 post_install start 🚀"
  installer.generated_projects.each do |project|
    puts "#{project.targets}"
    project.targets.each do |target|
      puts "#{target.name}"
      target.build_configurations.each do |config|
        config.build_settings['ENABLE_BITCODE'] ='NO'
        config.build_settings['VALID_ARCHS'] = 'arm64'
        config.build_settings['VALID_ARCHS[sdk=iphonesimulator*]'] = 'x86_64'
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
      end
    end
  end
  puts "🚀 post_install end 🚀"
end
