require 'active_support/inflector'

module M3TableAdmin
  class Table
    attr_accessor :columns, :filters, :additional_buttons, :filter_statuses, :nested_field_models, :filters_value, :filters_array, :filter_status, :model, :enable_destroy, :enable_add_new, :show_ids, :enable_edit, :enable_pagination, :enable_sorting, :row_has_locale, :filter_locale, :sort_type, :additional_table_buttons, :custom_header

    def initialize(model)
      @columns = Array.new
      @filters = Array.new
      @additional_buttons = Array.new
      @filter_statuses = Array.new
      @nested_field_models = Array.new

      @filters_value = {}
      @filters_array = {}

      @filter_status = ""
      @model = model
      @enable_destroy = true
      @enable_add_new = true
      @enable_edit = true
      @show_ids = false
      @enable_pagination = true
      @enable_sorting = false
      @row_has_locale = false
      @filter_locale = ""
      @sort_type = ""
      @additional_table_buttons = false
      @custom_header = false
    end

    def index_columns
      tmp_columns = self.columns
      self.columns = Array.new
      tmp_columns.each do |column|
        if !( column["attributes"].has_key?("index") && column["attributes"]["index"] == false )
          self.columns << column
        end
      end

      self.columns
    end

    def form_columns
      tmp_columns = self.columns
      self.columns = Array.new
      tmp_columns.each do |column|
        if !( column["attributes"].has_key?("index") && column["attributes"]["form"] == false )
          self.columns << column
        end
      end

      self.columns
    end

    def add_column ( name, type = "text", attributes = {})
      @columns << { "name" => name, "type" => type, "attributes" => attributes}
    end

    def add_autocomplete_column ( name, select = "name", attributes = {})
      attributes["select"] = select
      add_column( name, "autocomplete", attributes )
    end

    def add_datetime_column ( name, attributes = {})
      add_column( name, "datetime", attributes)
    end

    def add_date_column ( name, attributes = {})
      add_column( name, "date", attributes)
    end

    def add_wysihtml5_column ( name, attributes = {})
      add_column( name, "wysihtml5", attributes)
    end

    def add_checkbox_column ( name, collection, attributes = {})
      attributes["collection"] = collection
      add_column( name, "checkbox", attributes)
    end

    def add_country_column ( name, attributes = {})
      add_column( name, "country", attributes)
    end

    def add_dropdown_column ( name, collection, attributes = {})
      attributes["collection"] = collection
      attributes["prompt"] = "Select value"
      add_column( name, "dropdown", attributes)
    end

    def add_json_column ( name, attributes = {})
      add_column( name, "json", attributes)
    end

    def add_filter ( name, find_in = "")
      if find_in.blank?
        @filters << { "name" => name}
      else
        @filters << { "name" => name, "find_in" => find_in}
      end
    end

    def add_nested_fields ( name, attributes = {})
      @nested_field_models << name
      add_column( name, "nested_fields", attributes)
    end

    def filters?
      @filters.count > 0
    end

    def add_additional_button ( name, url, method )
      @additional_buttons << { "name" => name, "url" => url, "method" => method}
    end

    def additional_buttons?
      @additional_buttons .count > 0
    end

    def singularized
      model.singularize
    end

    def singularized_classified
      model.singularize.classify
    end

    # def index_path
    #   send("table_admin_"+ (self.model) +"_path")
    # end

    # def new_path
    #   if self.enable_add_new
    #     if self.row_has_locale or self.filter_statuses?
    #       send("new_table_admin_"+ (self.singularized) +"_path", :filter_locale => self.filter_locale)
    #     else
    #       send("new_table_admin_"+ (self.singularized) +"_path")
    #     end
    #   else
    #     "#"
    #   end
    # end

    def add_filter_status (name)
      @filter_statuses << name
    end

    def add_filter_statuses (names)
      @filter_statuses = @filter_statuses + name
    end

    def filter_statuses?
      @filter_statuses.count > 0
    end

    def filter_status?
      !self.filter_status.blank?
    end

    def filter_locale?
      !self.filter_locale.blank?
    end

    def sort_type?
      !self.sort_type.blank?
    end

    def add_filters(name, values)
      if !@filters_array
        @filters_array = {}
        @filters_value = {}
      end

      @filters_array[name] = values
      @filters_value[name] = values.first

    end



  end
end
