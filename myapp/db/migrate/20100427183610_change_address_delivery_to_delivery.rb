class ChangeAddressDeliveryToDelivery < ActiveRecord::Migration
  def self.up
    rename_column :customers, :address_delivery,:delivery
  end

  def self.down
  end
end
