require 'rbs_rails/rake_task'

namespace :rbs do
  desc 'CI'
  task ci: %i[clean collection rbs_rails:all rbs_inline steep]

  desc 'Clean up all RBS related files'
  task :clean do
    rm_rf %w[sig/rbs_rails sig/z_rbs_inline .gem_rbs_collection]
  end

  task :collection do
    sh 'rbs', 'collection', 'install'
  end

  desc 'Generate RBS with rbs-inline'
  task :rbs_inline do
    sh 'rbs-inline', 'app', '--opt-out', '--output=sig/z_rbs_inline/app'
  end

  desc 'Run steep check'
  task :steep do
    sh 'steep', 'check'
  end
end

RbsRails::RakeTask.new do |task|
  # If you want to avoid generating RBS for some classes, comment in it.
  # default: nil
  #
  # task.ignore_model_if = -> (klass) { klass == MyClass }

  # If you want to change the rake task namespace, comment in it.
  # default: :rbs_rails
  # task.name = :cool_rbs_rails

  # If you want to change where RBS Rails writes RBSs into, comment in it.
  # default: Rails.root / 'sig/rbs_rails'
  # task.signature_root_dir = Rails.root / 'my_sig/rbs_rails'
end
