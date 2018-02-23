
Pod::Spec.new do |s|
#1.
s.name               = "ASAlert"
#2.
s.version            = "1.0.5"
#3.
s.summary         = "Sort description of 'ASAlert' framework"
#4.
s.homepage        = "http://www.yudiz.com"
#5.
s.license              = "MIT"
#6.
s.author               = "Aravind"
#7.
s.platform            = :ios, "10.0"
#8.
s.source              = { :git => "URL", :tag => "1.0.5" }
#9.
s.source_files     = "ASAlert", "ASAlert/**/*.{h,m,swift}"
#10
s.resource_bundles = {
'ASAlert' => ['ASAlert/**/*.{storyboard,xib}']
end
