class AutocompleteInput < SimpleForm::Inputs::StringInput
  # This method only create a basic input without reading any value from object
  def input
    table = object_name
    relation_table = attribute_name
    path = template.m3_table_admin_autocomplete_path
    relation_object_name = nil

    if object.send(relation_table) != nil
      rel = object.send(relation_table)
      relation_object_name = rel.m3_table_admin_autocomplete_label
    end


    textfield_id = "autocomplete_"+table+"_#{attribute_name}_id"
    out = ""
    out << template.text_field_tag(table + "[#{attribute_name}_id]", relation_object_name, :id => textfield_id)
    out << @builder.hidden_field("#{attribute_name}_id")
    out << ""

    out << '<script>
                $( "#'+ textfield_id +'" ).click(function() {
                    setTimeout(function() { $( "#'+ textfield_id +'" ).select()  }, 100);
                  });
                $( "#'+ textfield_id +'" ).autocomplete({
                  source: "'+ path + '?type='+ relation_table +'",
                  minLength: 2,
                  autoFocus: true,
                  change: function(event,ui){

                  },
                  select: function( event, ui ) {
                    $(this).val((ui.item ? ui.item.value : ""));
                    $("#'+ table + '_' + attribute_name + '_id").val((ui.item ? ui.item.id : ""));
                    $(this).blur();
                  }
                  ,
                    response: function(event, ui) {
                        if (!ui.content.length) {
                            var noResult = { value:"",label:"No results found" };
                            ui.content.push(noResult);
                        }
                    }
                });
              </script>'


    template.raw(out)
  end
end
