ActiveRecord::Schema.verbose = false

ActiveRecord::Schema.define(:version => 1) do
  create_table :translations do |t|
    t.belongs_to :user
    t.string     :locale
    t.string     :key
    t.text       :value
    t.text       :interpolations
    t.boolean    :is_proc, default: false

    t.timestamps
  end

  create_table :users do |t|
    t.string :name
  end
end
