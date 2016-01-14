Pod::Spec.new do |s|

  s.name         = "XQExpendTextView"
  s.version      = "0.0.1"
  s.summary      = "A textView can expend and close."
  s.homepage     = "https://github.com/qq521/XQExpendTextView"
  s.license      = "MIT"
  s.author       = { "saman" => "441473064@qq.com" }
  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/qq521/XQExpendTextView.git", :tag => "0.0.1" }
  s.source_files = "XQExpendTextView/*.{h,m}"
  s.requires_arc = true
end
