platform :ios, '9.0'

target 'RGA_Test' do

use_frameworks!

pod 'RealmSwift'
pod 'SDWebImage', '~> 3.8'
pod 'RxSwift', '~> 3.0.0.beta.1'
pod 'RxCocoa', '~> 3.0.0.beta.1'

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end

end
