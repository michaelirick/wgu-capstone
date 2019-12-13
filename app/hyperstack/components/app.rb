# app/hyperstack/component/app.rb

# This is your top level component, the rails router will
# direct all requests to mount this component.  You may
# then use the Route psuedo component to mount specific
# subcomponents depending on the URL.

class App < HyperComponent
  include Hyperstack::Router
  include Hyperstack::Router::Helpers

  # define routes using the Route psuedo component.  Examples:
  # Route('/foo', mounts: Foo)                : match the path beginning with /foo and mount component Foo here
  # Route('/foo') { Foo(...) }                : display the contents of the block
  # Route('/', exact: true, mounts: Home)     : match the exact path / and mount the Home component
  # Route('/user/:id/name', mounts: UserName) : path segments beginning with a colon will be captured in the match param
  # see the hyper-router gem documentation for more details

  render(DIV) do
    NAV(class: 'navbar navbar-default') do
      DIV(class: 'container-fluid') do
        DIV(class: 'navbar-header') do
          A(class: 'navbar-brand', href: '/') { "Christie's Companions" }
        end
        UL(class: 'nav navbar-nav navbar-right') do
          LI do
            A(href: 'admin', class: 'admin-link') { 'Admin' }
          end
        end
      end
    end
    DIV(class: :container) do
      Catalogue {}
    end
  end
end
