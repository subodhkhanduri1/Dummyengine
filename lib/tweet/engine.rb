module Tweet
  class Engine < ::Rails::Engine
    isolate_namespace Tweet
  end
end
