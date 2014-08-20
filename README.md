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

If a model is used in the autocomplete input, you must add inside your model

  def m3_table_admin_autocomplete_label
    email #this is the name of the field, that you want to display
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

For authorization purposes is added a concern and a method require_authorization. Those two things must be defined.
the AuthorizationControllerConcern must de created inside controllers/concerns .Inside this file a function named require_authorization must
also be defined. Example
  module AuthorizationControllerConcern
    extend ActiveSupport::Concern

    module ClassMethods
      # Runs authorization check for current user and restricts access
      # for unauthorized roles.
      def require_authorization(options={})
        self.class_eval("
          before_filter :handle_authorization, #{options}
          def handle_authorization
            not_authorized unless authorized?
          end
        ")
      end
    end

    # Checks if current user is authorized for controller/action.
    def authorized?
      true
    end

    # Called when access is restricted.
    def not_authorized
      redirect_to root_path
    end

  end
