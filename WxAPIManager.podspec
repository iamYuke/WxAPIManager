
Pod::Spec.new do |s|

	s.name = 'WxAPIManager'
	s.version = '0.0.1'
	s.summary = '#{s.name}'
	s.description = '集成微信的最新SDK 1.8.3， 处理的一个APIManager'
	s.homepage = "https://weibo.com/IamYukeZhang"
	s.license = {:type => 'MIT',:file => 'LICENSE'}
	s.author = {'Yuke' => 'zhangnan@yukez.com'}
    s.source = {:git => "https://github.com/iamYuke/WxAPIManager.git", :tag => "#{s.version}" }
	s.platform = :ios, "9.0"
    s.source_files = "#{s.name}/Classes/**/*.{h,m}"
    s.vendored_libraries = "#{s.name}/Classes/**/*.a"
    s.libraries = 'c++','sqlite3','z'
  	s.frameworks = 'CoreGraphics', 'SystemConfiguration', 'Security', 'CoreTelephony', 'CFNetwork'

  end


