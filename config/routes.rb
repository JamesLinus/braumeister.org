# This code is free software; you can redistribute it and/or modify it under
# the terms of the new BSD License.
#
# Copyright (c) 2012, Sebastian Staudt

Braumeister::Application.routes.draw do

  resources :formulae, :only => :index, :path => 'browse' do
    get ':letter(/:page)', :action => :index, :on => :collection, :as => :letter,
        :constraints => { :letter => /[A-Za-z]/, :page => /\d+/ }
  end

  resources :formulae, :only => :index, :path => 'search' do
    get ':search', :action => :index, :on => :collection
  end

  resources :formula, :only => :show, :constraints => { :id => /.*/ }

  root :to => 'home#index'

  match '*url', :to => 'application#not_found'

end
