Redmine::Plugin.register :custom_tables do
  name 'Custom Tables plugin'
  author 'Ivan Marangoz'
  description 'This is a plugin for Redmine'
  version '1.0'

   project_module :custom_tables do

     permission :view_and_manage_entities, {
       custom_entities: [:new, :edit, :create, :update, :destroy, :context_menu, :bulk_edit, :bulk_update],
     }, global: true

   end

end

Redmine::MenuManager.map :admin_menu do |menu|
  menu.push :custom_tables, :custom_tables_path, caption: :label_custom_tables,
            :html => {:class => 'icon icon-package'}
end

Dir[File.join(File.dirname(__FILE__), '/lib/custom_tables/**/*.rb')].each { |file| require_dependency file }