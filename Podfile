target 'TheSocialNetwork' do
    use_frameworks!

    source 'https://github.com/CocoaPods/Specs.git'
    platform :ios, '8.0'

    pod 'ReSwift'
    pod 'SwiftLint'
    pod 'GoogleSignIn'
    pod 'GGLSignIn'
    pod 'Alamofire'
    pod 'SwiftyJSON'

    def test_pods
        pod 'Quick'
        pod 'Nimble'
    end

    target 'TheSocialNetworkTests' do
        inherit! :search_paths
        test_pods
    end
end
