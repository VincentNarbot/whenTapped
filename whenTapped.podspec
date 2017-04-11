Pod::Spec.new do |spec|
  spec.name = "whenTapped"
  spec.version = "1.1.1"
  spec.summary = "Adding a closure to a UIButton, UIView, UIImageView and many more."
  spec.homepage = "https://github.com/VincentNarbot/whenTapped/"
  spec.license = { type: 'MIT', file: 'LICENSE' }
  spec.authors = { "Vincent Narbot" => 'vincent@innovatice.tech' }
  spec.social_media_url = "http://twitter.com/vincentnarbot"

  spec.platform = :ios, "9.0"
  spec.requires_arc = true
  spec.source = { git: "https://github.com/VincentNarbot/whenTapped.git", tag: "v#{spec.version}", submodules: true }
  spec.source_files = "whenTapped/**/*.{h,swift}"
end