Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.name         = "Kollection"
  spec.version      = "0.0.1"
  spec.summary      = "A framework that provides some data structures and sorting algorithms to use on your project, e.g. Queue, Stack, LinkedList."

  spec.description  = <<-DESC
  A framework that provides some data structures and sorting algorithms to use on your project. The structures available are: Queue, Stack, LinkedList, DoublyLinkedList.
                   DESC

  spec.homepage     = "https://github.com/pedro0x53/Kollection"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.license      = { :type => "MIT", :file => "../LICENCE" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.authors            = "Pedro Sousa", "David Augusto"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.ios.deployment_target = "11.0"
  spec.osx.deployment_target = "10.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.source       = { :git => "https://github.com/pedro0x53/Kollection.git", :tag => "#{spec.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.source_files  = "Classes", "Kollection/**/*.{h,m}"
  spec.public_header_files = "Kollection/**/*.h"

end
