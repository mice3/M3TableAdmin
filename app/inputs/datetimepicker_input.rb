class DatetimepickerInput < SimpleForm::Inputs::StringInput
  def input

    table = object_name.to_s
    relation_table = attribute_name.to_s
    textfield_id = (table + "_" + attribute_name.to_s).gsub("[", "_").gsub("]", "_").gsub("__", "_")

    # path = template.admin_autocomplete_path
    # relation_object_name = nil

    # if object.send(relation_table) != nil
    #   rel = object.send(relation_table)
    #   relation_object_name = rel.name
    # end


    value = input_html_options[:value]
    # name = input_html_options[:name]
    name = table + "[#{attribute_name}]"

    # if table == "search" #TODO
    #   input_html_options[:name] =  "checkin"
    # end


    # name = "xxx"


    value ||= object.send(attribute_name) if object.respond_to? attribute_name
    if value
      value = value.strftime(I18n.t("time.formats.default"))
    end
    # input_html_options[:value] ||= value.strftime(I18n.t("date.formats.default"))  if value.present?
    # out = input_html_classes << "datepicker"

    out = ""
    out << template.text_field_tag(name, value, input_html_options)


    # '%d.%m.%Y %H:%M:%S'  dd/mm/yyyy HH:mm:ss
    out << '<script>
      $("#' + textfield_id + '").datepicker({ dateFormat: "' + I18n.t("date.formats.default").gsub("%", "").gsub("Y", "yy").gsub("H", "dd").gsub("M", "mm").gsub("S", "ss") + '",
        onSelect: function(datetext){
        var d = new Date(); // for now
        datetext=datetext+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();
        $("#' + textfield_id + '").val(datetext) }
        });

    </script>
    '


    template.raw(out)

    # super # leave StringInput do the real rendering
  end
end

