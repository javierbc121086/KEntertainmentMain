platform :ios, '10.0'

source 'https://github.com/CocoaPods/Specs.git' 
source 'git@gitlab.com:GonetGrupo/iOS/Dependencies/Spects/GNNetworkServicesSpec.git'
source 'git@gitlab.com:GonetGrupo/iOS/Dependencies/Spects/GNSwissRazorSpec.git'
source 'git@github.com:javierbc121086/KEntertainmentDomainSpec.git'
source 'git@github.com:javierbc121086/KEntertainmentServiceSpec.git'
source 'git@github.com:javierbc121086/KEntertainmentProcessSpec.git'

target 'KEntertainmentMain' do
  use_frameworks!

  pod 'KEntertainmentProcess'

  target 'KEntertainmentMainTests' do
    inherit! :search_paths

    pod 'KEntertainmentProcess'
  end

  target 'KEntertainmentMainUITests' do
  end

end
