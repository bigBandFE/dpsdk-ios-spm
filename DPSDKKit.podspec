Pod::Spec.new do |spec|
  spec.name         = "DPSDKKit"
  spec.version      = "3.0.12"
  spec.summary      = "Dragonpass Hybrid SDK for iOS — launch and interact with Dragonpass DPApps."
  spec.description  = <<-DESC
  Dragonpass Hybrid SDK for iOS lets a host app launch and interact with Dragonpass DPApps.

  Core features:
  - One-line initialization: DPSDK.start(clientId:)
  - Auth-code SSO flow via DPSDK.shared.setAuthCode(token:)
  - Open DPApps from UIKit / SwiftUI
  - Sandboxed, monitored, auto-recovered DP-App runtime

  Supports iOS 13.0+, Swift 5.6+.
  DESC

  spec.homepage     = "https://dpsdk.dragonpass.com"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Dragonpass DPSDK Team" => "dpsdk@dragonpass.com" }

  spec.platform     = :ios, "13.0"
  spec.swift_version = "5.6"

  spec.source       = { :git => "https://github.com/bigBandFE/dpsdk-ios-spm.git", :tag => "#{spec.version}" }

  spec.vendored_frameworks = "DPSDKKit.xcframework"

  spec.prepare_command = <<-CMD
    if [ ! -d "DPSDKKit.xcframework" ]; then
      echo "错误: DPSDKKit.xcframework 不存在！"
      exit 1
    fi
    echo "✅ DPSDKKit.xcframework 验证通过"
  CMD

  spec.pod_target_xcconfig = {
    'SWIFT_VERSION' => '5.6',
    'IPHONEOS_DEPLOYMENT_TARGET' => '13.0',
    'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES'
  }

  spec.user_target_xcconfig = {
    'IPHONEOS_DEPLOYMENT_TARGET' => '13.0'
  }

  spec.documentation_url = "https://dpsdk.dragonpass.com/docs/host-app/getting-started"

end
