module M3TableAdmin
  class ApplicationController < ActionController::Base
    protect_from_forgery
    respond_to :html

    layout :detect_popup_layout

    def detect_popup_layout
      if params[:layout]
        if params[:layout] == "popup"
          "popup"
        elsif params[:layout] == "iframe"
          "iframe"
        else
          "m3_table_admin/application"
        end
      else
        "m3_table_admin/application"
      end
    end

    def locale_param
      params[:locale] || I18n.available_locales.first.to_s
    end

    def autocomplete

      @return_objects = []
      if defined?(params[:type]) && defined?(params[:term]) && defined?(params[:select])
        @return_objects = params[:type].camelize.constantize.filter_find_in(params[:term],[params[:select]]).select(" #{params[:select]} as value" ,"id").limit(20)
      end

      render json: @return_objects.to_json
    end

    def rearrange

      index = 1;
      params[:ids].each do |id|
        obj = table_klass.find(id)
        obj.position = index
        obj.save
        index += 1
      end



      respond_to do |format|
        format.json { render json: {"status" => "ok"} }
      end

    end


    def index


      klass = table_klass

      q = klass
      if @table.filters?
        @table.filters.each do |filter|
          if defined? filter[:find_in]
            q = q.filter_find_in(params[filter[:name]], filter[:find_in])
          else
            q = q.filter_select_by(params[filter[:name]], filter[:name], "=")
          end
        end
      end

      if @table.filter_locale?
        q = q.where("locale = ?", @table.filter_locale)
      end


      if @table.filter_status?

        q = q.where("status = ?", @table.filter_status)

      end


      if @table.enable_sorting
        q = q.order("position ASC")
      end

      if @table.sort_type?
        q = q.order(@table.sort_type)
      end


      if @table.enable_pagination
        @objects = q.page(params[:page]).per(50)
      else
        @objects = q.to_a
      end

      render "m3_table_admin/table_admin/index"
    end

    def table_klass
      Object.const_get @table.singularized_classified
    end

    # GET /amenities/1
    # GET /amenities/1.json
    def show
      set_object()

      if !template_exists?("show", _prefixes, false)
        render "m3_table_admin/table_admin/show"
      end
    end

    def table_index_path(options = {})
      l = nil


      if @object and defined? @object.locale
        l = @object.locale
      end

      if !options[:ignore_table_params] # delete metod does not set table_params
        if table_params[:locale]
          l = table_params[:locale]
        end
      end


      if params[:filter_locale]
        l = params[:filter_locale]
      end

      if l
        send("m3_table_admin_"+ (@table.model) +"_path", :filter_locale => l)
      else
        send("m3_table_admin_"+ (@table.model) +"_path")
      end
    end

    # # GET /amenities/new
    def new
      @object = table_klass().new

      render "m3_table_admin/table_admin/new"
    end

    # # GET /amenities/1/edit
    def edit
      set_object()

      render "m3_table_admin/table_admin/edit"
    end

    # POST /amenities
    # POST /amenities.json
    def create
      @object = table_klass().new(table_params)
      if table_params[:locale]
        @object.locale = table_params[:locale]
      end
      puts table_params

      respond_to do |format|


        if @object.save
          p = table_index_path()
          format.html { redirect_to p, notice: t("admin.admin_controller.item_was_created") }
          format.js { render js: %(flash_message("success", "xxx")) }
        else
          format.html { render "m3_table_admin/table_admin/new", action: 'new' }
          format.js { render  :partial  => "shared/form_errors",
                                :locals   => {  :form_id  => "changePasswordFormContainer",
                                                :errors   => @object.errors,
                                                :obj_type => @table.singularized
                                            }
                                        }
        end
      end
    end

    # PATCH/PUT /amenities/1
    # PATCH/PUT /amenities/1.json
    def update
      set_object()


      respond_to do |format|

        tmp_params = table_params

        # keep old locale
        if defined? (@object.locale)
          tmp_params[:locale] = @object.locale
        end

        if @object.update(tmp_params)


          p = table_index_path()
          format.html { redirect_to p, notice: t('ajax_messages.item_was_updated')}
        else
          format.html { render "m3_table_admin/table_admin/edit", action: 'edit' }
        end
      end
    end

    # DELETE /amenities/1
    # DELETE /amenities/1.json
    def destroy
      set_object()

      p = table_index_path(:ignore_table_params => true)

      if @table.filter_statuses? and @table.filter_statuses.include? "deleted"
        @object.status = "deleted"
        @object.save
      else
        @object.destroy
      end


      respond_to do |format|
        format.html { redirect_to p, :notice => t("ajax_messages.object_has_been_deleted") }
      end
    end

    def destroy_translation
      translation_klass = Object.const_get ((@table.singularized) + "_translation").classify


      translations = translation_klass.where((@table.singularized) +"_id = ? and locale = ?", params["translation_parent_id"], params["translation_locale"])
      if translations.count > 0
        translations.first.destroy
      end

      respond_to do |format|
        format.js { render js: %() }
      end
    end


    def csv_export
      if params.has_key?(:columns) && params.has_key?(:model)
        objects = (params[:model].camelize.constantize).where('id in (?)', params[:min]..params[:max]).order("id DESC")

        csv_file_to_export = CSV.generate do |csv|
          csv << params[:columns]
          objects.each do |object|
            #csv << [ value[0], value[1]['count'] ]
            array_of_value = []
            params[:columns].each do |column|
              array_of_value << object.send(column)
            end
            csv << array_of_value
          end
        end

        send_data csv_file_to_export, alert: t('ajax_messages.columns_or_model_not_specified')
        #redirect_to :back
      else
        redirect_to :back, alert: t('ajax_messages.columns_or_model_not_specified')
      end
    end


    private
      # Use callbacks to share common setup or constraints between actions.
      def set_object
        @object = table_klass.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def table_params
        params.require(@table.singularized).permit!
      end

      def ensure_en_locale
        I18n.locale = :sl
        save_locale
      end

      def add_status_filters(filters)
        @filter_statuses = filters
        @filter_status = filters.first
        if params["filter_status"]
          @filter_status = params["filter_status"]
        end
      end
  end
end
