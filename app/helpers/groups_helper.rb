module GroupsHelper

  def remove_child_link(name, form_builder)
    form_builder.hidden_field(:_destroy) + link_to_function(name, "remove_child(this)")
  end

#  add_child_link 'Add Person', 'person', f
  def add_child_link(name, child, form_builder)
    fields = escape_javascript(new_child_fields(child, form_builder)) # child = 'person', form_builder = 'f'
    # calling the js function in nested_attributes.js

    link_to_function(name, h("add_child(this, \"#{child}\", \"#{fields}\")"))

    
#    function add_child(element, child_name, new_child) {
#      $(child_name + '_children').insert({
#        bottom: new_child.replace(/NEW_RECORD/g, new Date().getTime())
#      });
#    }

  end

  # child = 'person', form_builder = 'f'
  def new_child_fields(child, form_builder)
    form_builder.fields_for(child.pluralize.to_sym, child.camelize.constantize.new, :child_index => 'NEW_RECORD') do |f|
      render(:partial => child.underscore, :locals => { :f => f })
    end
  end

end
