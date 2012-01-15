dep "on deploy", :old_id, :new_id, :branch, :env do
  requires "benhoskings:deployed migrations run".with(old_id, new_id, env, 'activerecord')
  requires "assets compiled".with(env)
end

dep "assets compiled", :env, template: "benhoskings:task" do
  run {
    shell "bundle exec rake assets:precompile RAILS_ENV=#{env}"
  }
end
