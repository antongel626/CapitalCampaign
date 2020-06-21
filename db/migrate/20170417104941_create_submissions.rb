class CreateSubmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :submissions do |t|
      t.string :donor_name
      t.string :address
      t.string :email
      t.string :phone
      t.string :payment_info
      t.string :credit_card
      t.date :expire_date
      t.string :ccv
      t.string :comment
      t.integer :number_of_sfd
      t.integer :submitted_by

      t.timestamps
    end
  end
end
