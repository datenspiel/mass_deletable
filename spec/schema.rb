ActiveRecord::Schema.define(:version => 1) do
  create_table :persons, :force => true do |t|
    t.column :name, :string
    t.column :type, :string
    t.column :person_id, :integer
  end
end
