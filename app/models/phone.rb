class Phone < Model
  default_scope { order('priority DESC') }
end
