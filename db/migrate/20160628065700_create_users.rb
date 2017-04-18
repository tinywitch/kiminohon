class CreateUsers < ActiveRecord::Migration
  	def change
    	create_table :users do |t|
    		t.string :username
    		t.string :password_digest
    		t.string :remember_digest
    		t.string :email
	  		t.string :fullname
	  		t.string :address
	  		t.integer :role
    		t.timestamps null: false
    	end
  	end
end
