dep "on deploy", :old_id, :new_id, :branch, :env do
  requires 'benhoskings:when path changed'.with('db/migrate/', 'migrated db', old_id, new_id, env)
end
