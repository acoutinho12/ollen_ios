# Uncomment the next line to define a global platform for your project
platform :ios, '17.2'

target 'Ollen' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  pod 'SwiftLint'
  pod 'SwiftFormat/CLI'
  # Pods for Ollen

  target 'OllenTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'OllenUITests' do
    # Pods for testing
  end

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64 i386"
      config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'
   end
  end
end