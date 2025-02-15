class CreateInfluencers < ActiveRecord::Migration[7.2]
  create_table :influencers do |t|
    t.string :external_id
    t.string :username, null: false
    t.string :fullname
    t.boolean :verified, default: false
    t.integer :platform, null: false
    t.bigint :followers, null: false
    t.string :picture

    t.timestamps
  end

  add_index :influencers, [ :external_id, :platform ], unique: true, where: "external_id IS NOT NULL"
end
