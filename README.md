M3TableAdmin
============


<img src="https://dl.dropboxusercontent.com/u/3389098/m3_admin_index.jpg">

Add to your gem file:

    gem 'm3_table_admin', :git => "git://github.com/mice3/M3TableAdmin.git"


Create routes for viewing and editing your tables (this will add view/edit option for users table):

    namespace :m3_table_admin, path: "admin" do
      get "/", to: "users#index"
      resources :users
    end

Create controller with table definition in: "controllers/m3_table_admin/users_controller.rb"

    class M3TableAdmin::UsersController < M3TableAdmin::ApplicationController
    
      before_action :set_table
    
      private
        def set_table
          @table = M3TableAdmin::Table.new("users")
          @table.add_column("email", "text", {"index" => true})
          @table.add_column("role", "text", {"index" => false})
        end
    end


Manually create navigation header file (and modify it to your needs) in: "views/layouts/m3_table_admin/_navigation.html.haml"
  
  
    %nav.navbar.navbar-default.navbar-fixed-top
      .col-sm-12
        .navbar-header
          .navbar-brand
            = link_to "/" do
              = "Logo goes here"
              / = image_tag "logo.png"
        .collapse.navbar-collapse
          %ul.nav.navbar-nav.navbar-right
            %li
              = link_to "Users", m3_table_admin_users_path
            %li
              = link_to "Logout?", "#"
