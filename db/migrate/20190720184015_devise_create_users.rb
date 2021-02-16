# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ##Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      t.string   :user_type,                  default: ""
      t.string   :first_name,                 default: ""
      t.string   :last_name,                  default: ""
      t.string   :picture,                    default: ""
      t.string   :business_name,              default: ""
      t.string   :address,                    default: ""
      t.string   :home_number,                default: ""
      t.string   :zip_code,                   default: ""
      t.string   :city,                       default: ""
      t.string   :province,                   default: ""
      t.string   :cod_fisc,                   default: ""
      t.string   :p_lva,                      default: ""
      t.string   :mobile,                     default: ""
      t.string   :phone,                      default: ""
      t.string   :pec,                        default: ""
      t.string   :cuu,                        default: ""
      t.string   :specialization,             default: ""
      t.string   :building,                   default: ""

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
