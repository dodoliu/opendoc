class OpendocScaffoldGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)


  def copy_opendoc_scaffold_file
    #controller
    template 'controller.rb', "app/controllers/backend/#{table_name}_controller.rb"
    #model
    template 'model.rb', "app/models/#{singular_table_name}.rb"
    #views
    copy_file 'erb/new.html.erb', "app/views/backend/#{file_name}/new.html.erb"
    copy_file 'erb/edit.html.erb', "app/views/backend/#{file_name}/edit.html.erb"
    template 'erb/index.html.erb', "app/views/backend/#{file_name}/index.html.erb"
    template 'erb/_form.html.erb', "app/views/backend/#{file_name}/_form.html.erb"
    #test
    
  end
end
