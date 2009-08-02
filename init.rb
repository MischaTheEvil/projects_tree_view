require 'redmine'

# Patches to the Redmine core.
require 'dispatcher'
require 'projectstreeview_projects_helper_patch'
Dispatcher.to_prepare do
  ProjectsHelper.send(:include, ProjectstreeviewProjectsHelperPatch)
end

Redmine::Plugin.register :projects_tree_view do
  name 'Projects Tree View plugin'
  author 'Chris Peterson'
  description 'Will turn the projects page into a tree view'
  version '0.0.2'
end

class ProjectsTreeViewListener < Redmine::Hook::ViewListener

  # Adds javascript and stylesheet tags
  def view_layouts_base_html_head(context)
    javascript_include_tag('projects_tree_view', :plugin => :projects_tree_view) +
    stylesheet_link_tag('projects_tree_view', :plugin => :projects_tree_view)
  end
  
end
