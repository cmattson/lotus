module Lotus
  # Routes factory
  #
  # A Lotus application has this factory instantiated by default and associated
  # to the `Routes` constant, under the application namespace.
  #
  # @since 0.1.0
  class Routes
    # Initialize the factory
    #
    # @param routes [Lotus::Router] a routes set
    #
    # @return [Lotus::Routes] the factory
    #
    # @since 0.1.0
    def initialize(routes)
      @routes = routes
    end

    # Return a relative path for the given route name
    #
    # @param name [Symbol] the route name
    # @param args [Array,nil] an optional set of arguments that is passed down
    #   to the wrapped route set.
    #
    # @return [String] the corresponding relative URL
    #
    # @raise Lotus::Routing::InvalidRouteException
    #
    # @since 0.1.0
    #
    # @see http://rdoc.info/gems/lotus-router/Lotus/Router#path-instance_method
    #
    # @example
    #   require 'lotus'
    #
    #   module Bookshelf
    #     class Application < Lotus::Application
    #       configure do
    #         routes do
    #           get '/login', to: 'sessions#new', as: :login
    #         end
    #       end
    #     end
    #   end
    #
    #   Bookshelf::Routes.path(:login)
    #     # => '/login'
    #
    #   Bookshelf::Routes.path(:login, return_to: '/dashboard')
    #     # => '/login?return_to=%2Fdashboard'
    def path(name, *args)
      @routes.path(name, *args)
    end

    # Return an absolute path for the given route name
    #
    # @param name [Symbol] the route name
    # @param args [Array,nil] an optional set of arguments that is passed down
    #   to the wrapped route set.
    #
    # @return [String] the corresponding absolute URL
    #
    # @raise Lotus::Routing::InvalidRouteException
    #
    # @since 0.1.0
    #
    # @see http://rdoc.info/gems/lotus-router/Lotus/Router#url-instance_method
    #
    # @example
    #   require 'lotus'
    #
    #   module Bookshelf
    #     class Application < Lotus::Application
    #       configure do
    #         routes do
    #           scheme 'https'
    #           host   'bookshelf.org'
    #
    #           get '/login', to: 'sessions#new', as: :login
    #         end
    #       end
    #     end
    #   end
    #
    #   Bookshelf::Routes.url(:login)
    #     # => 'https://bookshelf.org/login'
    #
    #   Bookshelf::Routes.url(:login, return_to: '/dashboard')
    #     # => 'https://bookshelf.org/login?return_to=%2Fdashboard'
    def url(name, *args)
      @routes.url(name, *args)
    end
  end
end
