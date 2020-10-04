FactoryBot.define do
  factory :discipline do
    name { %w[raciocínio\ lógico
              literatura
              português
              legislação\ federal
              direito\ constitucional
              estatística
              inglês
              geografia
              direito\ civil
              matemática].sample }
  end
end