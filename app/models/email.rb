class Email < Model
  default_scope { order('priority DESC') }
end
