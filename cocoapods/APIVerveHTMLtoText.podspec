Pod::Spec.new do |s|
  s.name             = 'APIVerveHTMLtoText'
  s.version          = '1.2.3'
  s.summary          = 'HTML to Text extracts clean plain text from raw HTML markup, reporting word counts and character counts.'
  s.description      = <<-'DESC'
HTML to Text extracts clean plain text from raw HTML markup, reporting word counts and character counts. It identifies main article bodies automatically, records the extraction method used, and notes whether parsing succeeded.

This iOS/macOS SDK provides a convenient way to access the HTML to Text from APIVerve.
Supports both callback-based and async/await patterns.
                       DESC

  s.homepage         = 'https://apiverve.com/marketplace/htmltotext?utm_source=cocoapods&utm_medium=referral&utm_content=homepage'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'APIVerve' => 'hello@apiverve.com' }
  # The SDK repo holds every language; the pod lives under cocoapods/ with its own tag.
  s.source           = { :git => 'https://github.com/apiverve/htmltotext-api.git', :tag => "cocoapods/v#{s.version}" }

  s.ios.deployment_target = '15.0'
  s.osx.deployment_target = '12.0'

  s.swift_version = '5.0'

  s.source_files = 'cocoapods/Sources/APIVerveHTMLtoText/**/*.swift'

  s.frameworks = 'Foundation'

  # APIResponse, APIVerveError and the request plumbing, shared by every APIVerve pod.
  s.dependency 'APIVerveCore', '~> 1.2'
end
