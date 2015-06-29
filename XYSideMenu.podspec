Pod::Spec.new do |s|
  s.name         = "XYSideMenu"
  s.version      = "1.0.2"
  s.summary      = "左右滚动的视图"
  s.homepage     = "https://github.com/tianpengtao/XYSideMenu"
  s.license      = "MIT"
  s.authors      = { 'tianpengtao' => '1174060232@qq.com'}
  s.platform     = :ios, "6.0"
  s.source       = { :git => "https://github.com/tianpengtao/XYSideMenu.git", :tag => s.version.to_s }
  s.source_files = "SideMenu/*.{h,m}"
  s.requires_arc = true
end
