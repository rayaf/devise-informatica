# frozen_string_literal: true

# Classe base para todos os modelos da aplicação.
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
