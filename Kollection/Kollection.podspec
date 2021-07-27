Pod::Spec.new do |spec|
  spec.name           = "Kollection"
  spec.version        = "0.0.1"
  spec.summary        = "A framework that provides some data structures and sorting algorithms to use on your project, e.g. Queue, Stack, LinkedList."

  spec.description    = <<-DESC 
    A framework that provides some data structures and sorting algorithms to use on your project.
    The possible data structures are: Queue, Stack, Linked List, Doubly Linked List.
  DESC

  spec.homepage       = "https://github.com/pedro0x53/Kollection"
  spec.license        = { :type => "MIT", :file => "../LICENSE" }

  spec.author         = "Pedro Sousa"

  spec.ios.deployment_target = "11.0"
  spec.osx.deployment_target = "11.0"

  spec.source         = { :git => "https://github.com/pedro0x53/Kollection.git", :tag => "#{spec.version}" }

  spec.source_files   = "Classes", "Kollection/**/*.{h,m}"
end
