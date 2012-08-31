#ActionController::Routing::Routes.draw do |map|
RedmineApp::Application.routes.draw do
#  map.resources :public_keys, :controller => 'gitosis_public_keys', :path_prefix => 'my'
	scope 'my' do
  	resources :public_keys, :controller => 'gitosis_public_keys'
  end
end
