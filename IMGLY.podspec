Pod::Spec.new do |s|
    s.name         = 'IMGLYUI'
    s.version      = '1.0.0'
    s.summary      = 'Video Editor'
    s.description  = <<-DESC
A custom video editor
DESC
    s.homepage     = 'https://github.com/elonmitchell/IMGLY'
    s.license      = { :type => 'MIT', :file => 'LICENSE' }
    s.author       = { 'Elon Mitchell' => 'elon@levelsapp.ai' }
    s.source       = { :git => 'git@github.com:imgly/IMGLYUI-swift.git', :tag => s.version.to_s }
    s.source_files = 'Sources/**/*.{h,m,swift}'
    s.requires_arc = true
    s.ios.deployment_target = '10.0'
  end