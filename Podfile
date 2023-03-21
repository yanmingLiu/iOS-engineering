platform :ios, '13.0'

inhibit_all_warnings!

install! 'cocoapods',
         :generate_multiple_pod_projects => true,
         :incremental_installation => true

def dev_pods
  pod 'LookinServer', :subspecs => ['Swift'], :configurations => ['Debug']
end

def core_pods
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
  dev_pods
  core_pods
end

