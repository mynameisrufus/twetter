dep "on deploy", :old_id, :new_id, :branch, :env do
  requires 'benhoskings:when path changed'.with('db/migrate/', 'migrated db', old_id, new_id, env)
  requires "assets compiled".with(env)
end

dep "assets compiled", :env, :template => "benhoskings:task" do
  run {
    shell "bundle exec rake assets:precompile RAILS_ENV=#{env}"
  }
end
